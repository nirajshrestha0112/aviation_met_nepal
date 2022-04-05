import 'dart:developer';

import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/routes.dart';
import 'package:aviation_met_nepal/provider/airport_list_provider.dart';
import 'package:aviation_met_nepal/provider/login_provider.dart';
import 'package:aviation_met_nepal/screens/details_screen.dart';
import 'package:aviation_met_nepal/widgets/custom_alert_dialog.dart';
import 'package:aviation_met_nepal/widgets/custom_icon_image.dart';
import 'package:aviation_met_nepal/widgets/each_text.dart';
import 'package:aviation_met_nepal/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constant/values.dart';
import '../utils/custom_scroll_behavior.dart';
import '../utils/size_config.dart';
import 'general_filter.dart';

class ShowFabSheet {
  static String getEmailUrl({required String email}) {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
    );
    return params.toString();
  }

  static final List<Map<String, dynamic>> data = [
    {
      'icon': const CustomIcon(icon: Icons.home),
      'title': const ReusableText(text: "Home"),
      'navigate': homeRoute
    },
    {
      'icon': const CustomIcon(icon: Icons.notification_add),
      'title': const ReusableText(text: "Notification"),
      'navigate': notificationRoute
    },
    {
      'icon': const CustomIcon(icon: Icons.expand_less_outlined),
      'title': const ReusableText(text: "Icing & Turbulence Chart"),
      'navigate': loginRoute
    },
    {
      'icon': const CustomImage(assetName: cameraImg),
      'title': const ReusableText(text: "Weather Camera Images"),
      'navigate': loginRoute
    },
    {
      'icon': const CustomImage(assetName: satelliteImg),
      'title': const ReusableText(text: "Satellite Images"),
      'navigate': satelliteImageDataRoute
    },
    {
      'icon': const CustomImage(assetName: lightingImg),
      'title': const ReusableText(text: "Lighting Data"),
      'navigate': lightingDataRoute
    },
    {
      'icon': const CustomImage(assetName: windImg),
      'title': const ReusableText(text: "Wind Chart"),
      'navigate': windChartRoute
    },
    {
      'icon': const CustomImage(assetName: chartImg),
      'title': const ReusableText(text: "SIGWX Chart"),
      'navigate': loginRoute
    },
    {
      'icon': const CustomImage(assetName: newsImg),
      'title': const ReusableText(text: "Weather Forecast"),
      'navigate': weatherForecastRoute
    },
    {
      'icon': const CustomImage(assetName: newsImg),
      'title': const ReusableText(text: "Airmet Data"),
      'navigate': airmetDataRoute
    },
    {
      'icon': const CustomImage(assetName: newsImg),
      'title': const ReusableText(text: "Ashtams Data"),
      'navigate': ashtamsDataRoute
    },
    {
      'icon': const CustomImage(assetName: newsImg),
      'title': const ReusableText(text: "Gamet Data"),
      'navigate': gametDataRoute
    },
    {
      'icon': const CustomImage(assetName: newsImg),
      'title': const ReusableText(text: "Opmet Data"),
      'navigate': opmetDataRoute
    },
    {
      'icon': const CustomIcon(icon: Icons.contacts_outlined),
      'title': const ReusableText(text: "Contact Us"),
      'navigate': contactRoute
    },
    {
      'icon': const CustomIcon(icon: Icons.message),
      'title': const ReusableText(text: "Feedback"),
      'url': getEmailUrl(email: "mfddhm@gmail.com"),
    },
  ];

  static launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  static void showFabSheet({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.65,
          builder: (_, controller) {
            return Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: padding / 1.5, vertical: padding),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.apps_sharp,
                            color: const Color(colorDarkBlue),
                            size: SizeConfig.imageSizeMultiplier * 8.0,
                          ),
                          SizedBox(
                            width: SizeConfig.widthMultiplier,
                          ),
                          Text(
                            "Menu",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: SizeConfig.textMultiplier * 2.2,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close_outlined,
                            size: SizeConfig.imageSizeMultiplier * 8.0,
                            color: const Color(colorDarkBlue),
                          ))
                    ],
                  ),
                  Provider.of<LoginProvider>(context, listen: true).loginName !=
                          null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: const Color(bgColor),
                                  radius: SizeConfig.imageSizeMultiplier * 3.0,
                                  child: Icon(
                                    Icons.person,
                                    color: const Color(colorDarkBlue),
                                    size: SizeConfig.imageSizeMultiplier * 4.0,
                                  ),
                                ),
                                SizedBox(
                                  width: SizeConfig.widthMultiplier * 5.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        Provider.of<LoginProvider>(context,
                                                listen: true)
                                            .loginName
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!),
                                    SizedBox(
                                        height: SizeConfig.heightMultiplier),
                                    Text(
                                      Provider.of<LoginProvider>(context,
                                              listen: true)
                                          .userId
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                            fontSize:
                                                SizeConfig.textMultiplier * 1.5,
                                          ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: SizeConfig.heightMultiplier * 3.0,
                              width: SizeConfig.widthMultiplier * 6.5,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(radius / 4.0),
                                color: const Color(bgColor),
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(
                                  Icons.logout,
                                  size: SizeConfig.imageSizeMultiplier * 3.5,
                                ),
                                color: const Color(colorDarkBlue),
                                onPressed: () async {
                                  final result = await showDialog(
                                      context: context,
                                      builder: (context) =>
                                          const ShowAlertDialogBox());
                                  log(result.toString());
                                  if (result == true) {
                                    showDialog(
                                        context: context,
                                        builder: (context) => const Center(
                                            child: CircularProgressIndicator
                                                .adaptive()));
                                    Provider.of<LoginProvider>(context,
                                            listen: false)
                                        .clearLoginDetails();
                                    Navigator.pushNamed(context, homeRoute);
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ]),
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      controller: controller,
                      itemCount: data.length,
                      itemBuilder: (c, i) {
                        return ListTile(
                          leading: data[i]['icon'],
                          title: data[i]['title'],
                          onTap: () {
                            data.last == data[i]
                                ? launchUrl(data[i]["url"])
                                : Navigator.pushNamed(
                                    context, data[i]['navigate']);
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
            color: const Color(colorWhite),
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
                          color: const Color(colorDarkBlue),
                          size: SizeConfig.imageSizeMultiplier * 5.5,
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 3.0,
                        ),
                        Text(
                          "Select Aiport",
                          style: Theme.of(context).textTheme.bodyText1,
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close_outlined,
                        size: SizeConfig.imageSizeMultiplier * 7.0,
                        color: const Color(colorDarkBlue),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3.0,
                ),
                TextFormField(
                    controller: editingController,
                    decoration: InputDecoration(
                        hintText: "Select Airport",
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(radius)),
                        suffixIcon: Icon(
                          Icons.search,
                          size: SizeConfig.widthMultiplier * 7.5,
                        ))),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2.0,
                ),
                Expanded(
                    child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: RawScrollbar(
                    isAlwaysShown: true,
                    thumbColor: const Color(bgColor),
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
                                ? Align(
                                    alignment: Alignment.topCenter,
                                    child: Text("No Airport Data Found",
                                        style: TextStyle(
                                            color: const Color(colorGrey20),
                                            fontSize:
                                                SizeConfig.textMultiplier *
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
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    color: const Color(
                                                        colorPrimary)),
                                          ),
                                          trailing: Container(
                                            padding: EdgeInsets.only(
                                                right:
                                                    SizeConfig.widthMultiplier *
                                                        4.0),
                                            width:
                                                SizeConfig.widthMultiplier * 55,
                                            child: Text(
                                              value.searchData[i].name,
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                color: const Color(colorNavy50),
                                                fontSize:
                                                    SizeConfig.textMultiplier *
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
                            color: const Color(colorDarkBlue),
                            size: SizeConfig.imageSizeMultiplier * 6,
                          ),
                          SizedBox(
                            width: SizeConfig.widthMultiplier * 3.0,
                          ),
                          Text(
                            "Filter",
                            style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 2.2,
                                fontWeight: FontWeight.w500,
                                color: const Color(colorDarkBlue)),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close_outlined,
                          size: SizeConfig.imageSizeMultiplier * 7.0,
                          color: const Color(colorDarkBlue),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 3.0,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      border: Border.all(color: Color(bgColor), width: 2.0),
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
                    height: SizeConfig.heightMultiplier * 2.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: SizeConfig.heightMultiplier * 6.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(colorBlue)),
                      child: Text(
                        "Apply",
                        style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 1.8,
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
