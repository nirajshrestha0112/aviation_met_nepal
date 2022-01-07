import 'dart:developer';
import 'dart:ffi';
import 'dart:ui';

import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/custom_scroll_behavior.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:aviation_met_nepal/widgets/reusable_text.dart';
import 'package:flutter/material.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> with TickerProviderStateMixin {
  // int currentIndex = 2;
  late TabController _tabController;
  static const List<Widget> _views = [
    EachTabBody(),
    // const Center(child: const Text('Content of Tab One')),
    const Center(child: const Text('Content of Tab Two')),
    const Center(child: const Text('Content of Tab Three')),
    const Center(child: const Text('Content of Tab Four')),
  ];
  final List<Tab> _tabs = [
    Tab(
      child: Text(
        "TAFS",
        style: TextStyle(
          fontSize: SizeConfig.textMultiplier! * 1.8,
        ),
      ),
    ),
    Tab(
      child: Text("METARs",
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier! * 1.8,
          )),
    ),
    Tab(
      child: Text("SIGMETs",
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier! * 1.8,
          )),
    ),
    Tab(
        child: Text("SPECI",
            style: TextStyle(
              fontSize: SizeConfig.textMultiplier! * 1.8,
            )))
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    // _tabController.animateTo(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        foregroundColor: Colors.blue,
        elevation: 0.0,
        title: Text(
          "VNKTKathmandu/Tribhuvan",
          style: TextStyle(
              fontSize: SizeConfig.textMultiplier! * 2.0, color: textColor),
        ),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: textColor,
          ),
        ),
        bottom: TabBar(
          indicatorPadding: const EdgeInsets.symmetric(
              horizontal: radius, vertical: padding / 4),
          indicator: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(radius),
            color: Colors.red,
          ),
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: textColor,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          // unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.italic),
          tabs: _tabs,
        ),
        backgroundColor: Colors.white,
      ),
      body: TabBarView(controller: _tabController, children: _views
          // Put widgets here

          ),
    );
  }
}

class EachTabBody extends StatefulWidget {
  const EachTabBody({Key? key}) : super(key: key);

  @override
  State<EachTabBody> createState() => _EachTabBodyState();
}

class _EachTabBodyState extends State<EachTabBody> {
  final List<Map<String, dynamic>> decodedData = [
    {
      "text": "Text",
      "value":
          "VNKT 070750Z 24003KT 5000 HZ FEW015 SCT030 BKN100 17/08 Q1021 NOSIG",
    },
    {
      "text": "Temp.",
      "value":
          "VNKT 070750Z 24003KT 5000 HZ FEW015 SCT030 BKN100 17/08 Q1021 NOSIG",
    },
    {
      "text": "Dewpoint",
      "value": "17.0\u2103 (63\u2109)",
    },
    {
      "text": "Pressure(atimeter)",
      "value": "30.12 inches Hg(1020.0 mb)",
    },
    {
      "text": "Winds",
      "value": "from the WNW(290 degrees) at 3 MPH(3 knots;1.5m/s)",
    },
    {
      "text": "Visibility",
      "value": "4sm ( 6 km)",
    },
    {
      "text": "Ceiling",
      "value": "10000 feet AGL",
    },
    {
      "text": "Clouds",
      "value": "few clouds at 1500 feet AGL,broken clouds at 10000 feet AGL",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "0712 UTC 06 Jan 2022",
                style: TextStyle(fontSize: SizeConfig.textMultiplier! * 1.8),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: double.infinity,
                        );
                      });
                },
                child: Container(
                  height: SizeConfig.heightMultiplier! * 4.5,
                  width: SizeConfig.widthMultiplier! * 20.0,
                  // padding: EdgeInsets.symmetric(horizontal:radius/2),
                  decoration: BoxDecoration(
                      color: iconColor,
                      borderRadius: BorderRadius.circular(radius)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: SizeConfig.widthMultiplier,
                      ),
                      Text(
                        "Filter",
                        style: TextStyle(
                            fontSize: SizeConfig.textMultiplier! * 1.8,
                            color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        size: SizeConfig.imageSizeMultiplier! * 8.0,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier! * 3.0,
          ),
          Container(
            padding: const EdgeInsets.only(left: padding, top: radius / 4.0),
            height: SizeConfig.heightMultiplier! * 12,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(radius)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "RAW",
                  style: TextStyle(
                      fontSize: SizeConfig.textMultiplier! * 2.0,
                      fontWeight: FontWeight.w500,
                      color: iconColor),
                ),
                Text(
                  "VNKT 070750Z 24003KT 5000 HZ FEW015 SCT030 BKN100 17/08 Q1021 NOSIG",
                  style: TextStyle(
                      fontSize: SizeConfig.textMultiplier! * 1.8,
                      color: textColor),
                )
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier! * 2.0,
          ),
          Container(
            padding: const EdgeInsets.only(left: padding, top: radius / 4.0),
            height: SizeConfig.heightMultiplier! * 12,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(radius)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Decoded",
                  style: TextStyle(
                      fontSize: SizeConfig.textMultiplier! * 2.0,
                      fontWeight: FontWeight.w500,
                      color: iconColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "METAR For",
                      style: TextStyle(
                          fontSize: SizeConfig.textMultiplier! * 1.8,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                    SizedBox(
                      width: SizeConfig.widthMultiplier! * 6.0,
                    ),
                    Expanded(
                      child: Text(
                        "VNKT (Kathmandu/Tribhuvan,BA,NP)",
                        style: TextStyle(
                            fontSize: SizeConfig.textMultiplier! * 1.8,
                            color: textColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier! * 2.0,
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 1.0,
                    );
                  },
                  itemCount: decodedData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(
                          left: padding, top: radius / 4.0, right: padding),
                      decoration: BoxDecoration(
                        color: decodedData[index]['text'] == "Text"
                            ? Colors.transparent
                            : Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              decodedData[index]['text'],
                              style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier! * 2.0,
                                  fontWeight: FontWeight.w500,
                                  color: textColor),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.widthMultiplier! * 2.0,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                decodedData[index]['value'],
                                style: TextStyle(
                                    fontSize: SizeConfig.textMultiplier! * 2.0,
                                    fontWeight: FontWeight.w500,
                                    color: textColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
          /*  Text(
            "VNKT 070750Z 24003KT 5000 HZ FEW015 SCT030 BKN100 17/08 Q1021 NOSIG",
            style: TextStyle(
                fontSize: SizeConfig.textMultiplier! * 1.8, color: textColor),
          ), */
        ],
      ),
    );
  }
}
