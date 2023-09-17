import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:app/models/updates_model.dart';
import 'package:app/widgets/updates.dart';

class UpdatesScreen extends StatefulWidget {
  const UpdatesScreen({Key? key}) : super(key: key);

  @override
  State<UpdatesScreen> createState() => _UpdatesScreenState();
}

class _UpdatesScreenState extends State<UpdatesScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UpdatesModelApi().getUpdates(),
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
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Updates(
                snapshot.data[index],
              );
            },
          );
        }
      },
    );
  }
}
