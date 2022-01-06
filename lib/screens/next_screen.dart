import 'dart:developer';

import 'package:flutter/material.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  int currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: currentIndex,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              padding: EdgeInsets.zero,
              indicatorColor: Colors.transparent,
              onTap: (int index) {
                currentIndex = index;
                setState(() {});
                log(index.toString());
              },
              tabs: [
                /* Tab(
              text: "METARS",
            ),
             */
                currentIndex == 0
                    ? ElevatedButton(onPressed: () {}, child: Text("METARS"))
                    : Text(
                        "METARS",
                      ),
                currentIndex == 1
                    ? ElevatedButton(onPressed: () {}, child: Text("METARS"))
                    : Text(
                        "METARS",
                      ),
                Tab(
                  text: "SIGMETS",
                ),
                Tab(
                  text: "SPECI",
                )
              ]),
        ),
        body: TabBarView(children: [
          Text("METARS"),
          Text("TAFS"),
          Text("SIGMETS"),
          Text('SPECI')
        ]),
      ),
    );
  }
}
