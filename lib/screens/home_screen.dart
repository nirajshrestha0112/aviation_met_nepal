import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/routes.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/custom_scroll_behavior.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
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
      'icon': const ReusableIcon(icon: Icons.home),
      'title': const ReusableText(text: "Home")
    },
    {
      'icon': const ReusableIcon(icon: Icons.notification_add),
      'title': const ReusableText(text: "Notification")
    },
    {
      'icon': const ReusableIcon(icon: Icons.expand_less_outlined),
      'title': const ReusableText(text: "Icing & Turbulence Chart")
    },
    {
      'icon': const ReusableIcon(icon: Icons.storm_outlined),
      'title': const ReusableText(text: "Weather Camera Images")
    },
    {
      'icon': const ReusableIcon(icon: Icons.satellite_outlined),
      'title': const ReusableText(text: "Satellite Images")
    },
    {
      'icon': const ReusableIcon(icon: Icons.bolt_outlined),
      'title': const ReusableText(text: "Lighting Data")
    },
    {
      'icon': const ReusableIcon(icon: Icons.air_outlined),
      'title': const ReusableText(text: "Wind Chart")
    },
    {
      'icon': const ReusableIcon(icon: Icons.stacked_line_chart_sharp),
      'title': const ReusableText(text: "SIGWX Chart")
    },
    {
      'icon': const ReusableIcon(icon: Icons.table_view),
      'title': const ReusableText(text: "Weather Forecast")
    },
    {
      'icon': const ReusableIcon(icon: Icons.table_view),
      'title': const ReusableText(text: "Airmet Data")
    },
    {
      'icon': const ReusableIcon(icon: Icons.table_view),
      'title': const ReusableText(text: "Ashtams Data")
    },
    {
      'icon': const ReusableIcon(icon: Icons.table_view),
      'title': const ReusableText(text: "Gamet Data")
    },
    {
      'icon': const ReusableIcon(icon: Icons.table_view),
      'title': const ReusableText(text: "Opmet Data")
    },
    {
      'icon': const ReusableIcon(icon: Icons.contacts_outlined),
      'title': const ReusableText(text: "Contact Us")
    },
    {
      'icon': const ReusableIcon(icon: Icons.chat),
      'title': const ReusableText(text: "Opmet Data")
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Icon(
                      Icons.close_outlined,
                      size: SizeConfig.imageSizeMultiplier! * 8.0,
                      color: textColor,
                    )
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
                            leading: data[i]['icon'], title: data[i]['title']);
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



class ReusableIcon extends StatelessWidget {
  final IconData icon;
  const ReusableIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: textColor,
      size: SizeConfig.imageSizeMultiplier! * 6.0,
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
                   icon:Icon( Icons.location_on,
                    color: iconColor,
                    size: SizeConfig.widthMultiplier! * 7.5,
                   ), onPressed: () {  
                     Navigator.pushNamed(context, feedbackScreen);
                   },),
                ))),
      ),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
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
                            onTap: (){
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
