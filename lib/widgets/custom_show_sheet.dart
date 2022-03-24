import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:aviation_met_nepal/constant/routes.dart';
import 'package:aviation_met_nepal/provider/airport_list_provider.dart';
import 'package:aviation_met_nepal/screens/details_screen.dart';
import 'package:aviation_met_nepal/widgets/custom_icon.dart';
import 'package:aviation_met_nepal/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant/values.dart';
import '../utils/custom_scroll_behavior.dart';
import '../utils/size_config.dart';
import 'general_filter.dart';

class ShowSheet {
  static final List<Map<String, dynamic>> data = [
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

  static void showSheet({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
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

class ShowLocationSheet {
  static void showLocationSheet({
    required BuildContext context,
    required TextEditingController editingController,
    required Future future,
  }) {
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
                    controller: editingController,
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
                    child: FutureBuilder(
                        future: future,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator.adaptive());
                          }
                          return Consumer<AirportListProvider>(
                              builder: (_, value, __) {
                            return value.searchData.isEmpty
                                ? Center(
                                    child: Text("No Airport Data Found",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                SizeConfig.textMultiplier! *
                                                    2.5)))
                                : ListView.builder(
                                    itemCount: value.searchData.length,
                                    itemBuilder: (c, i) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailsScreen(
                                                          data: value
                                                              .searchData[i])));
                                        },
                                        child: ListTile(
                                          contentPadding: const EdgeInsets.only(
                                              left: padding * 2.0),
                                          leading: Text(
                                            value.searchData[i].ident,
                                            style: TextStyle(
                                                fontSize:
                                                    SizeConfig.textMultiplier! *
                                                        2.0,
                                                color: iconColor),
                                          ),
                                          trailing: Container(
                                            padding: EdgeInsets.only(
                                                right: SizeConfig
                                                        .widthMultiplier! *
                                                    4.0),
                                            width: SizeConfig.widthMultiplier! *
                                                55,
                                            child: Text(
                                              value.searchData[i].name,
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                fontSize:
                                                    SizeConfig.textMultiplier! *
                                                        2.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                          });
                        }),
                  ),
                ))
              ]),
            ),
          );
        });
  }
}

class ShowFilterSheet {
  static Future showFilterSheet(context) async {
    String? value;
    await showModalBottomSheet(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.filter_alt,
                            color: textColor,
                            size: SizeConfig.imageSizeMultiplier! * 6,
                          ),
                          SizedBox(
                            width: SizeConfig.widthMultiplier! * 3.0,
                          ),
                          Text(
                            "Filter",
                            style: TextStyle(
                                fontSize: SizeConfig.textMultiplier! * 2.2,
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
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      border: Border.all(color: bgColor, width: 2.0),
                    ),
                    child: StatefulBuilder(builder: (context, set) {
                      return DropDownFilter(
                        setValue: (val) {
                          value = val;
                          set(() {});
                        },
                      );
                    }),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier! * 2.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: SizeConfig.heightMultiplier! * 6.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(iconColor)),
                      child: Text(
                        "Apply",
                        style: TextStyle(
                            fontSize: SizeConfig.textMultiplier! * 1.8,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
    return value;
  }
}
