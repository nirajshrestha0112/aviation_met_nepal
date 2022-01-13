import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/routes.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/custom_scroll_behavior.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:aviation_met_nepal/widgets/custom_icon.dart';
import 'package:aviation_met_nepal/widgets/reusable_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> data = [
    {
      'icon': const CustomIcon(icon: Icons.home),
      'title': const ReusableText(text: "Home"),
      'navigate': homeScreen
    },
    {
      'icon': const CustomIcon(icon: Icons.notification_add),
      'title': const ReusableText(text: "Notification"),
      'navigate': notificationScreen
    },
    {
      'icon': const CustomIcon(icon: Icons.expand_less_outlined),
      'title': const ReusableText(text: "Icing & Turbulence Chart"),
      'navigate': loginScreen
    },
    {
      'icon': const CustomIcon(icon: Icons.storm_outlined),
      'title': const ReusableText(text: "Weather Camera Images"),
      'navigate': loginScreen
    },
    {
      'icon': const CustomIcon(icon: Icons.satellite_outlined),
      'title': const ReusableText(text: "Satellite Images"),
      'navigate': satelliteImagesScreen
    },
    {
      'icon': const CustomIcon(icon: Icons.bolt_outlined),
      'title': const ReusableText(text: "Lighting Data"),
      'navigate': lightingDataScreen
    },
    {
      'icon': const CustomIcon(icon: Icons.air_outlined),
      'title': const ReusableText(text: "Wind Chart"),
      'navigate': windChartScreen
    },
    {
      'icon': const CustomIcon(icon: Icons.stacked_line_chart_sharp),
      'title': const ReusableText(text: "SIGWX Chart"),
      'navigate': loginScreen
    },
    {
      'icon': const CustomIcon(icon: Icons.table_view),
      'title': const ReusableText(text: "Weather Forecast"),
      'navigate': weatherForecastScreen
    },
    {
      'icon': const CustomIcon(icon: Icons.table_view),
      'title': const ReusableText(text: "Airmet Data"),
      'navigate': AirmetDataScreen
    },
    {
      'icon': const CustomIcon(icon: Icons.table_view),
      'title': const ReusableText(text: "Ashtams Data"),
      'navigate': AshtamsDataScreen
    },
    {
      'icon': const CustomIcon(icon: Icons.table_view),
      'title': const ReusableText(text: "Gamet Data"),
      'navigate': gametDataScreen
    },
    {
      'icon': const CustomIcon(icon: Icons.table_view),
      'title': const ReusableText(text: "Opmet Data"),
      'navigate': opmetDataScreen
    },
    {
      'icon': const CustomIcon(icon: Icons.contacts_outlined),
      'title': const ReusableText(text: "Contact Us"),
      'navigate': contactScreen
    },
    {
      'icon': const CustomIcon(icon: Icons.message),
      'title': const ReusableText(text: "Feedback"),
      'navigate': feedbackScreen
    },
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                  title: Text(
                    'Confirm to Exit',
                    style: TextStyle(
                        fontSize: SizeConfig.textMultiplier! * 2.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                  content: Text("Are you sure you want to exit?",
                      style: TextStyle(
                        fontSize: SizeConfig.textMultiplier! * 1.8,
                        color: Colors.black,
                      )),
                  contentPadding: const EdgeInsets.only(
                      top: padding / 2.0, left: padding * 1.5),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text('No',
                            style: TextStyle(
                              fontSize: SizeConfig.textMultiplier! * 1.8,
                              color: Colors.green,
                            ))),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text('Yes',
                            style: TextStyle(
                              fontSize: SizeConfig.textMultiplier! * 1.8,
                              color: Colors.green,
                            ))),
                  ])),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            "Discover",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: textColor,
                fontSize: SizeConfig.textMultiplier! * 2.5,
                fontWeight: FontWeight.w500),
          ),
        ),
        floatingActionButton: SizedBox(
          height: SizeConfig.heightMultiplier! * 6.0,
          width: SizeConfig.widthMultiplier! * 12.0,
          child: FloatingActionButton(
            backgroundColor: iconColor,
            child: Icon(
              Icons.apps_sharp,
              size: SizeConfig.imageSizeMultiplier! * 8.0,
            ),
            onPressed: () {
              _showSheet();
            },
            elevation: 0.0,
          ),
        ),
        backgroundColor: bgColor,
        body: const HomeScreenBody(),
      ),
    );
  }

  void _showSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // set this to true
      builder: (_) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (_, controller) {
            return Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: padding / 1.5, vertical: padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.apps_sharp,
                          color: textColor,
                          size: SizeConfig.imageSizeMultiplier! * 8.0,
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier,
                        ),
                        Text(
                          "Menu",
                          style: TextStyle(
                              fontSize: SizeConfig.textMultiplier! * 2.2,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close_outlined,
                          size: SizeConfig.imageSizeMultiplier! * 8.0,
                          color: textColor,
                        ))
                  ],
                ),
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView.builder(
                      controller: controller,
                      itemCount: data.length,
                      itemBuilder: (c, i) {
                        return ListTile(
                          leading: data[i]['icon'],
                          title: data[i]['title'],
                          onTap: () {
                            Navigator.pushNamed(context, data[i]['navigate']);
                          },
                        );
                      }),
                ),
              ),
            ]);
          },
        );
      },
    );
  }
}

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final List<Map<String, dynamic>> selectAirportData = [
    {
      'leading': const ReusableText(
        text: "VNKT",
        colorData: true,
      ),
      'trailing': const ReusableText(
        text: "Kathmandu/Tribhuvan",
        colorData: false,
      )
    },
    {
      'leading': const ReusableText(
        text: "VGHS",
        colorData: true,
      ),
      'trailing': const ReusableText(
        text: "Dhaka/Shahjalal Intl",
        colorData: false,
      )
    },
    {
      'leading': const ReusableText(
        text: "VIDP",
        colorData: true,
      ),
      'trailing': const ReusableText(
        text: "New Delhi/Gandhi Intl",
        colorData: false,
      )
    },
    {
      'leading': const ReusableText(
        text: "VILK",
        colorData: true,
      ),
      'trailing': const ReusableText(
        text: "Lucknow/Singh Arpt",
        colorData: false,
      )
    },
    {
      'leading': const ReusableText(
        text: "RJNK",
        colorData: true,
      ),
      'trailing': const ReusableText(
        text: "Komatsu Arpt",
        colorData: false,
      )
    },
    {
      'leading': const ReusableText(
        text: "RJTT",
        colorData: true,
      ),
      'trailing': const ReusableText(
        text: "Tokyo/Haneda Intl",
        colorData: false,
      )
    },
    {
      'leading': const ReusableText(
        text: "OPPS",
        colorData: true,
      ),
      'trailing': const ReusableText(
        text: "Peshawar/Khan Intl",
        colorData: false,
      )
    },
    {
      'leading': const ReusableText(
        text: "VNKT",
        colorData: true,
      ),
      'trailing': const ReusableText(
        text: "Kathmandu/Tribhuvan",
        colorData: false,
      )
    },
    {
      'leading': const ReusableText(
        text: "VGHS",
        colorData: true,
      ),
      'trailing': const ReusableText(
        text: "Dhaka/Shahjalal Intl",
        colorData: false,
      )
    },
    {
      'leading': const ReusableText(
        text: "VIDP",
        colorData: true,
      ),
      'trailing': const ReusableText(
        text: "New Delhi/Gandhi Intl",
        colorData: false,
      )
    },
    {
      'leading': const ReusableText(
        text: "VILK",
        colorData: true,
      ),
      'trailing': const ReusableText(
        text: "Lucknow/Singh Arpt",
        colorData: false,
      )
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: padding * 1.2, vertical: padding * 1.5),
        child: TextFormField(
            onTap: () {
              _showLocationSheet();
            },
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: padding, vertical: padding / 2.0),
                hintText: "Select Airport",
                hintStyle: TextStyle(
                    color: searchColor,
                    fontSize: SizeConfig.textMultiplier! * 2.0,
                    fontWeight: FontWeight.w400),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8.0)),
                suffixIcon: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    _showLocationSheet();
                  },
                  child: IconButton(
                    icon: Icon(
                      Icons.location_on,
                      color: iconColor,
                      size: SizeConfig.widthMultiplier! * 7.5,
                    ),
                    onPressed: () {
                      _showLocationSheet();
                    },
                  ),
                ))),
      ),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              aiportImg,
              width: SizeConfig.widthMultiplier! * 30,
            ),
            SizedBox(
              width: SizeConfig.widthMultiplier! * 56.0,
              height: SizeConfig.heightMultiplier! * 5.0,
              child: Text(
                "Please select the airport first to view detail readings",
                style: TextStyle(
                    fontSize: SizeConfig.textMultiplier! * 2.0,
                    color: textColor),
              ),
            )
          ],
        ),
      ),
    ]);
  }

  void _showLocationSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (_) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.7,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: padding / 1.5, vertical: padding),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: textColor,
                          size: SizeConfig.imageSizeMultiplier! * 5.5,
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier! * 3.0,
                        ),
                        Text(
                          "Select Aiport",
                          style: TextStyle(
                              fontSize: SizeConfig.textMultiplier! * 2.1,
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
                        size: SizeConfig.imageSizeMultiplier! * 7.0,
                        color: textColor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier! * 3.0,
                ),
                TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: padding * 2.0, vertical: padding / 2.0),
                        hintText: "Select Airport",
                        hintStyle: TextStyle(
                            color: searchColor,
                            fontSize: SizeConfig.textMultiplier! * 2.0,
                            fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0)),
                        suffixIcon: Icon(
                          Icons.search,
                          color: iconColor,
                          size: SizeConfig.widthMultiplier! * 7.5,
                        ))),
                SizedBox(
                  height: SizeConfig.heightMultiplier! * 2.0,
                ),
                Expanded(
                    child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: RawScrollbar(
                    isAlwaysShown: true,
                    thumbColor: bgColor,
                    child: ListView.builder(
                        itemCount: selectAirportData.length,
                        itemBuilder: (c, i) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, nextScreen);
                            },
                            child: ListTile(
                                contentPadding:
                                    const EdgeInsets.only(left: padding * 2.0),
                                leading: selectAirportData[i]['leading'],
                                trailing: selectAirportData[i]['trailing']),
                          );
                        }),
                  ),
                ))
              ]),
            ),
          );
        });
  }
}
