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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constant/values.dart';
import '../utils/custom_scroll_behavior.dart';
import '../utils/size_config.dart';
import 'custom_loading_indicator.dart';
import 'general_filter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      'title': const EachText(text: "Home"),
      'navigate': homeRoute,
      'toCheck': false
    },
    {
      'icon': const CustomIcon(icon: Icons.notification_add),
      'title': const EachText(text: "Notification"),
      'navigate': notificationRoute,
      'toCheck': false
    },
    {
      'icon': const CustomIcon(icon: Icons.expand_less_outlined),
      'title': const EachText(text: "Icing & Turbulence Chart"),
      'navigate': icingTurbulenceChartRoute,
      'toCheck': true
    },
    {
      'icon': const CustomImage(assetName: cameraImg),
      'title': const EachText(text: "Weather Camera Images"),
      'navigate': weatherCameraImagesRoute,
      'toCheck': true
    },
    {
      'icon': const CustomImage(assetName: satelliteImg),
      'title': const EachText(text: "Satellite Images"),
      'navigate': satelliteImageDataRoute,
      'toCheck': false
    },
    {
      'icon': const CustomImage(assetName: lightingImg),
      'title': const EachText(text: "Lighting Data"),
      'navigate': lightingDataRoute,
      'toCheck': false
    },
    {
      'icon': const CustomImage(assetName: windImg),
      'title': const EachText(text: "Wind Chart"),
      'navigate': windChartRoute,
      'toCheck': false
    },
    {
      'icon': const CustomImage(assetName: chartImg),
      'title': const EachText(text: "SIGWX Chart"),
      'navigate': sigwxChartRoute,
      'toCheck': true
    },
    {
      'icon': const CustomImage(assetName: newsImg),
      'title': const EachText(text: "Weather Forecast"),
      'navigate': weatherForecastRoute,
      'toCheck': false
    },
    {
      'icon': const CustomImage(assetName: newsImg),
      'title': const EachText(text: "Airmet Data"),
      'navigate': airmetDataRoute,
      'toCheck': false
    },
    {
      'icon': const CustomImage(assetName: newsImg),
      'title': const EachText(text: "Ashtams Data"),
      'navigate': ashtamsDataRoute,
      'toCheck': false
    },
    {
      'icon': const CustomImage(assetName: newsImg),
      'title': const EachText(text: "Gamet Data"),
      'navigate': gametDataRoute,
      'toCheck': false
    },
    {
      'icon': const CustomImage(assetName: newsImg),
      'title': const EachText(text: "Opmet Data"),
      'navigate': opmetDataRoute,
      'toCheck': false
    },
    {
      'icon': const CustomIcon(icon: Icons.contacts_outlined),
      'title': const EachText(text: "Contact Us"),
      'navigate': contactRoute,
      'toCheck': false
    },
    {
      'icon': const CustomIcon(icon: Icons.message),
      'title': const EachText(text: "Feedback"),
      'url': getEmailUrl(email: "mfddhm@gmail.com"),
      'toCheck': false
    },
  ];

  static launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      log('Could not launch $url');
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
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SizedBox(width: 3.w,),
                      Row(
                        children: [
                          Icon(
                            Icons.apps_sharp,
                            color: const Color(colorDarkBlue),
                            size: 32.w,
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          Text(
                            "Menu",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ],
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close_outlined,
                            size: 25.w,
                            color: const Color(colorDarkBlue),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Provider.of<LoginProvider>(context, listen: true).loginName !=
                          null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 4.w,
                                ),
                                CircleAvatar(
                                  backgroundColor: const Color(bgColor),
                                  radius: 11.w,
                                  child: Icon(
                                    Icons.person,
                                    color: const Color(colorDarkBlue),
                                    size: 16.w,
                                  ),
                                ),
                                SizedBox(
                                  width: 15.w,
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
                              margin: EdgeInsets.only(right: 5.3.w),
                              height: 20.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.w),
                                color: const Color(bgColor),
                              ),
                              child: InkWell(
                                child: Icon(
                                  Icons.logout,
                                  size: 16.w,
                                  color: const Color(colorDarkBlue),
                                ),
                                onTap: () async {
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
                                : data[i]["toCheck"]
                                    ? Provider.of<LoginProvider>(context,
                                                    listen: false)
                                                .loginName !=
                                            null
                                        ? Navigator.pushNamed(
                                            context, data[i]['navigate'])
                                        : Navigator.pushNamed(
                                            context, loginRoute)
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
                          size: 20.w,
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
                            return const CustomLoadingIndicator();
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
                                          contentPadding:
                                              const EdgeInsets.only(left: 4),
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
                      border:
                          Border.all(color: const Color(bgColor), width: 2.0),
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
