import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:app/screens/fixtures_screen.dart';
import 'package:app/screens/updates_screen.dart';
import 'package:app/sidebar/navigation_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'live_score_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    super.initState();
    getConnectivity();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(
              () {
                isAlertSet = true;
              },
            );
          }
        },
      );

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          drawer: const NavBar(),
          backgroundColor: Colors.grey[350],
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                title: const Image(
                  image: AssetImage('assets/images/app_title.png'),
                  color: Colors.black,
                  height: 45,
                  width: 300,
                ),
                centerTitle: true,
                pinned: true,
                floating: true,
                snap: true,
                backgroundColor: Colors.red[900],
                bottom: TabBar(
                  labelColor: Colors.grey[300],
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Colors.white,
                  labelStyle: const TextStyle(fontSize: 16),
                  tabs: const [
                    Tab(
                      text: 'Live',
                      icon: Icon(Icons.live_tv),
                    ),
                    Tab(
                      text: 'Fixtures',
                      icon: Icon(Icons.schedule),
                    ),
                    Tab(
                      text: 'Updates',
                      icon: Icon(Icons.notifications_on_outlined),
                    ),
                  ],
                ),
              ),
            ],
            body: const TabBarView(
              children: [
                LiveScoreScreen(),
                FixturesScreen(),
                UpdatesScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text("No Connection"),
          content: const Text("Please check your internet connectivity"),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, "Cancel");
                setState(
                  () {
                    isAlertSet = false;
                  },
                );
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected) {
                  showDialogBox();
                  setState(
                    () {
                      isAlertSet = true;
                    },
                  );
                }
              },
              child: const Text("Retry"),
            ),
          ],
        ),
      );
}
