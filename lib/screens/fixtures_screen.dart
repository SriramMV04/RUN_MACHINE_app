import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:app/models/fixtures_model.dart';
import 'package:app/widgets/fixtures.dart';
import 'package:url_launcher/url_launcher.dart';

class FixturesScreen extends StatefulWidget {
  const FixturesScreen({Key? key}) : super(key: key);

  @override
  State<FixturesScreen> createState() => _FixturesScreenState();
}

class _FixturesScreenState extends State<FixturesScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FixturesModelApi().getFixtures(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.grey[350],
            body: const SizedBox(
              child: Center(
                child: Text(
                  'Something went wrong',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          );
        } else if (snapshot.data == null) {
          return const Center(
            child: SpinKitCircle(
              color: Colors.black,
              size: 50.0,
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              launchUrl(
                Uri.parse(
                    'https://www.espncricinfo.com/live-cricket-match-schedule-fixtures'),
              );
            },
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Fixtures(
                  snapshot.data[index],
                );
              },
            ),
          );
        }
      },
    );
  }
}
