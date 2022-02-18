import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/custom_scroll_behavior.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  static const List<Widget> _views = [
    EachTabBody(),
    EachTabFirst(),
    EachTabSecond(),
    EachTabSecond()
  ];
  final List<Tab> _tabs = [
    const Tab(
      child: EachText(
        text: "TAFS",
      ),
    ),
    const Tab(child: EachText(text: "METARs")),
    const Tab(child: EachText(text: "SIGMETs")),
    const Tab(child: EachText(text: "SPECI"))
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(SizeConfig.heightMultiplier! * 13.0),
          child: Theme(
            data: ThemeData(splashColor: Colors.transparent),
            child: AppBar(
              foregroundColor: Colors.blue,
              elevation: 0.0,
              title: Text(
                "VNKTKathmandu/Tribhuvan",
                style: TextStyle(
                    fontSize: SizeConfig.textMultiplier! * 2.0,
                    color: textColor),
              ),
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: textColor,
                ),
              ),
              bottom: TabBar(
                indicatorPadding: const EdgeInsets.symmetric(
                    horizontal: radius, vertical: padding / 3.0),
                indicator: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(radius),
                  color: Colors.red,
                ),
                controller: _tabController,
                labelColor: Colors.white,
                unselectedLabelColor: textColor,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle:
                    const TextStyle(fontStyle: FontStyle.italic),
                tabs: _tabs,
              ),
              backgroundColor: Colors.white,
            ),
          )),
      body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: TabBarView(
            controller: _tabController,
            children: _views,
          )),
      // Put widgets here
    );
  }
}

class EachText extends StatelessWidget {
  final String text;
  const EachText({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: SizeConfig.textMultiplier! * 1.8,
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "0712 UTC 06 Jan 2022",
                style: TextStyle(fontSize: SizeConfig.textMultiplier! * 2.0),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: padding, top: padding, right: padding),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.filter_alt,
                                          color: textColor,
                                          size:
                                              SizeConfig.imageSizeMultiplier! *
                                                  6,
                                        ),
                                        SizedBox(
                                          width:
                                              SizeConfig.widthMultiplier! * 3.0,
                                        ),
                                        Text(
                                          "Filter",
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.textMultiplier! *
                                                      2.2,
                                              fontWeight: FontWeight.w500,
                                              color: textColor),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.close_outlined,
                                        size: SizeConfig.imageSizeMultiplier! *
                                            7.0,
                                        color: textColor,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: SizeConfig.heightMultiplier! * 3.0,
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(radius),
                                    border:
                                        Border.all(color: bgColor, width: 2.0),
                                  ),
                                  child: const DropDownFilter(),
                                ),
                                SizedBox(
                                  height: SizeConfig.heightMultiplier! * 2.0,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: SizeConfig.heightMultiplier! * 6.0,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                iconColor)),
                                    child: Text(
                                      "Apply",
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.textMultiplier! * 1.8,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  height: SizeConfig.heightMultiplier! * 5.0,
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
            padding: const EdgeInsets.only(
              left: padding,
              top: radius / 4.0,
            ),
            height: SizeConfig.heightMultiplier! * 12.0,
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
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier! * 2.0,
          ),
          Container(
            padding: const EdgeInsets.only(left: padding, top: radius / 4.0),
            height: SizeConfig.heightMultiplier! * 12.0,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        "VNKT (Kathmandu/Tribhuvan, BA, NP)",
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
                        left: padding,
                        top: radius / 4.0,
                      ),
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
                              padding: const EdgeInsets.all(radius / 2.0),
                              child: Text(
                                decodedData[index]['value'],
                                style: TextStyle(
                                    fontSize: SizeConfig.textMultiplier! * 2.0,
                                    fontWeight:
                                        decodedData[index]['text'] == "Text"
                                            ? FontWeight.bold
                                            : FontWeight.normal,
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
        ],
      ),
    );
  }
}

class DropDownFilter extends StatefulWidget {
  const DropDownFilter({Key? key}) : super(key: key);

  @override
  _DropDownFilterState createState() => _DropDownFilterState();
}

class _DropDownFilterState extends State<DropDownFilter> {
  String selectedValue = "Most Recent";
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
        child: Text("Most Recent"),
        value: "Most Recent",
      ),
      const DropdownMenuItem(
          child: Text("Past 1 Hours"), value: "Past 1 Hours"),
      const DropdownMenuItem(
          child: Text("Past 2 Hours"), value: "Past 2 Hours"),
      const DropdownMenuItem(
          child: Text("Past 3 Hours"), value: "Past 3 Hours"),
      const DropdownMenuItem(
          child: Text("Past 4 Hours"), value: "Past 4 Hours"),
      const DropdownMenuItem(
          child: Text("Past 5 Hours"), value: "Past 5 Hours"),
      const DropdownMenuItem(
          child: Text("Past 6 Hours"), value: "Past 6 Hours"),
      const DropdownMenuItem(
          child: Text("Past 7 Hours"), value: "Past 7 Hours"),
      const DropdownMenuItem(
          child: Text("Past 10 Hours"), value: "Past 10 Hours"),
      const DropdownMenuItem(
          child: Text("Past 11 Hours"), value: "Past 11 Hours"),
      const DropdownMenuItem(
          child: Text("Past 12 Hours"), value: "Past 12 Hours"),
      const DropdownMenuItem(
          child: Text("Past 13 Hours"), value: "Past 13 Hours"),
      const DropdownMenuItem(
          child: Text("Past 14 Hours"), value: "Past 14 Hours"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton(
          menuMaxHeight: SizeConfig.heightMultiplier! * 70.0,
          elevation: 0,
          isExpanded: true,
          value: selectedValue,
          items: dropdownItems,
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
            });
          },
        ),
      ),
    );
  }
}

class EachTabFirst extends StatefulWidget {
  const EachTabFirst({Key? key}) : super(key: key);

  @override
  _EachTabFirstState createState() => _EachTabFirstState();
}

class _EachTabFirstState extends State<EachTabFirst> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: padding, vertical: padding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "0712 UTC 06 Jan 2022",
            style: TextStyle(fontSize: SizeConfig.textMultiplier! * 2.0),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier! * 3.0,
          ),
          Container(
            padding: const EdgeInsets.only(
              left: padding,
              top: radius / 4.0,
            ),
            height: SizeConfig.heightMultiplier! * 12.0,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EachTabSecond extends StatelessWidget {
  const EachTabSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: padding, vertical: padding * 2.0),
      child: Column(
        children: [
          Container(
            height: SizeConfig.heightMultiplier! * 23.0,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(radius)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  deleteImg,
                  width: SizeConfig.heightMultiplier! * 30,
                  height: SizeConfig.widthMultiplier! * 30,
                ),
                Text(
                  "No data Available",
                  style: TextStyle(
                      fontSize: SizeConfig.textMultiplier! * 2.0,
                      color: textColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
