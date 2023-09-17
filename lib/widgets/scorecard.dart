import 'package:flutter/material.dart';

class ScoreCard extends StatefulWidget {
  final dynamic snapshotData;
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  ScoreCard(this.snapshotData);

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  late final data = widget.snapshotData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400, blurRadius: 10, spreadRadius: 7),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.matchTitle.toString(),
                    style: const TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 30,
                                child: Image.network(data.flag1),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                data.team1.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                data.run1.toString() +
                                    '-' +
                                    data.wicket1.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                '(' + data.overs1.toString() + ')',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              SizedBox(
                                height: 30,
                                child: Image.network(data.flag2),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                data.team2.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                data.run2.toString() +
                                    '-' +
                                    data.wicket2.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                '(' + data.overs2.toString() + ')',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: 2,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 15),
                          const SizedBox(
                            width: 50,
                            child: Icon(Icons.live_tv_outlined),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                data.status.toString(),
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
