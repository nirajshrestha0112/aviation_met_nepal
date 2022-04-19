import 'dart:developer';
import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/routes.dart';
import 'package:aviation_met_nepal/provider/airport_list_provider.dart';
import 'package:aviation_met_nepal/provider/login_provider.dart';
import 'package:aviation_met_nepal/screens/details_screen.dart';
import 'package:aviation_met_nepal/utils/is_online_checker.dart';
import 'package:aviation_met_nepal/widgets/custom_alert_dialog.dart';
import 'package:aviation_met_nepal/widgets/custom_icon_image.dart';
import 'package:aviation_met_nepal/widgets/each_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../provider/weather_forecast_provider.dart';
import '../utils/custom_scroll_behavior.dart';
import '../utils/show_internet_connection_snack_bar.dart';
import 'custom_loading_indicator.dart';
import 'general_filter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'modal_sheet_header.dart';

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
      'toCheck': true
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
          initialChildSize: 0.7,
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
                      GestureDetector(
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
                                    SizedBox(height: 4.h),
                                    Text(
                                      Provider.of<LoginProvider>(context,
                                              listen: true)
                                          .userId
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                            fontSize: 14.sp,
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
                              child: GestureDetector(
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
                            if (data.last == data[i]) {
                              launchUrl(data[i]["url"]);
                            } else {
                              if (data[i]["toCheck"]) {
                                if (Provider.of<LoginProvider>(context,
                                            listen: false)
                                        .loginName !=
                                    null) {
                                  if (getIsOnline(context)) {
                                    

                                    Navigator.pushNamed(
                                        context, data[i]['navigate']);
                                  } else {
                                    if (data[i]['navigate'] ==
                                        icingTurbulenceChartRoute) {
                                      Navigator.pop(context);
                                      showInternetConnectionSnackBar(
                                          icon: Icons.close,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          bgColor: Colors.red,
                                          circleAvatarbgColor: Colors.white,
                                          iconColor: Colors.red,
                                          statusText: "Error",
                                          message:
                                              "Cannot Get IcingTurbulence Image...Please Try Again");
                                    } else if (data[i]['navigate'] ==
                                        sigwxChartRoute) {
                                      Navigator.pop(context);
                                      showInternetConnectionSnackBar(
                                          icon: Icons.close,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          bgColor: Colors.red,
                                          circleAvatarbgColor: Colors.white,
                                          iconColor: Colors.red,
                                          statusText: "Error",
                                          message:
                                              "Cannot Get Sigwx Image...Please Try Again");
                                    } else if (data[i]['navigate'] ==
                                        windChartRoute) {
                                      Navigator.pop(context);
                                      showInternetConnectionSnackBar(
                                          icon: Icons.close,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          bgColor: Colors.red,
                                          circleAvatarbgColor: Colors.white,
                                          iconColor: Colors.red,
                                          statusText: "Error",
                                          message:
                                              "Cannot Get Wind Image...Please Try Again");
                                    } else {
                                      Navigator.pop(context);
                                      showInternetConnectionSnackBar(
                                          icon: Icons.close,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          bgColor: Colors.red,
                                          circleAvatarbgColor: Colors.white,
                                          iconColor: Colors.red,
                                          statusText: "Error",
                                          message:
                                              "Cannot Get WeatherCamera Image...Please Try Again");
                                    }
                                  }
                                } else {
                                  Navigator.pushNamed(context, loginRoute);
                                }
                              } else {
                                if (getIsOnline(context)) {
                                  Navigator.pushNamed(
                                        context, data[i]['navigate']);
                                 /*  if (data[i]['navigate'] == homeRoute) {
                                    Navigator.pop(context);
                                    // return;
                                  } else {
                                    Navigator.pushNamed(
                                        context, data[i]['navigate']);
                                  } */
                                } else {
                                  if (data[i]['navigate'] ==
                                      satelliteImageDataRoute) {
                                    Navigator.pop(context);
                                    showInternetConnectionSnackBar(
                                        icon: Icons.close,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        bgColor: Colors.red,
                                        circleAvatarbgColor: Colors.white,
                                        iconColor: Colors.red,
                                        statusText: "Error",
                                        message:
                                            "Cannot Get Satellite Image...Please Try Again");
                                  } else if (data[i]['navigate'] ==
                                      lightingDataRoute) {
                                    Navigator.pop(context);
                                    showInternetConnectionSnackBar(
                                        icon: Icons.close,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        bgColor: Colors.red,
                                        circleAvatarbgColor: Colors.white,
                                        iconColor: Colors.red,
                                        statusText: "Error",
                                        message:
                                            "Cannot Get Lighting Image...Please Try Again");
                                  } else {
                                    Navigator.pop(context);
                                    showInternetConnectionSnackBar(
                                        icon: Icons.close,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        bgColor: Colors.red,
                                        circleAvatarbgColor: Colors.white,
                                        iconColor: Colors.red,
                                        statusText: "Error",
                                        message:
                                            "Server Error...Please Try Again");
                                  }
                                }
                              }
                            }
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
    required ScrollController scrollController,
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
              padding:
                  EdgeInsets.symmetric(horizontal: 16.w / 1.5, vertical: 16.h),
              child: Column(children: [
                const ModalSheetHeader(),
                SizedBox(
                  height: 6.h,
                ),
                TextFormField(
                    controller: editingController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 4.w),
                        hintText: "Search Airport",
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.w)),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(left: 18.w),
                          child: Icon(
                            Icons.search,
                            size: 25.w,
                          ),
                        ))),
                Expanded(
                    child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: RawScrollbar(
                    controller: scrollController,
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
                                            fontSize: 20.sp)))
                                : ListView.builder(
                                    itemCount: value.searchData.length,
                                    controller: scrollController,
                                    itemBuilder: (c, i) {
                                      return GestureDetector(
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
                                              EdgeInsets.only(left: 4.w),
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
                                            padding:
                                                EdgeInsets.only(right: 10.w),
                                            width: 160.w,
                                            child: Text(
                                              value.searchData[i].name,
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                color: const Color(colorNavy50),
                                                fontSize: 16.sp,
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
              padding: EdgeInsets.only(left: 16.w, top: 16.h, right: 16.w),
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
                            size: 22.w,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            "Filter",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(colorDarkBlue)),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close_outlined,
                          size: 25.w,
                          color: const Color(colorDarkBlue),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      border:
                          Border.all(color: const Color(bgColor), width: 2.0.w),
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
                    height: 16.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 40.h,
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
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
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

class ShowWeatherForecastCities {
  static Future showWeatherForecastCities({
    required BuildContext context,
    // required TextEditingController editingController,
    required Future future,
  }) async {
    final editingController = TextEditingController();
    editingController.addListener(() {
      Provider.of<CitiesProvider>(context, listen: false)
          .filterSearchWeatherForecastResults(editingController.text);
    });

    return await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (_) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.7,
            color: const Color(colorWhite),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
              child: Column(children: [
                const ModalSheetHeader(),
                SizedBox(
                  height: 6.h,
                ),
                TextFormField(
                    controller: editingController,
                    decoration: InputDecoration(
                        hintText: "Search Airport",
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.w)),
                        suffixIcon: Icon(
                          Icons.search,
                          size: 24.w,
                        ))),
                SizedBox(
                  height: 6.h,
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
                          return Consumer<CitiesProvider>(
                              builder: (_, value, __) {
                            return value.searchWeatherForecastData.isEmpty
                                ? Align(
                                    alignment: Alignment.topCenter,
                                    child: Text("No Data Found",
                                        style: TextStyle(
                                            color: const Color(colorGrey20),
                                            fontSize: 18.sp)))
                                : ListView.builder(
                                    itemCount:
                                        value.searchWeatherForecastData.length,
                                    itemBuilder: (c, i) {
                                      return GestureDetector(
                                        onTap: () async {
                                          await Provider.of<
                                                      WeatherForecastProvider>(
                                                  context,
                                                  listen: false)
                                              .fetchWeatherForecast(
                                                  id: value
                                                      .searchWeatherForecastData[
                                                          i]
                                                      .id);
                                          Navigator.pop(
                                              context,
                                              value.searchWeatherForecastData[i]
                                                  .description);
                                        },
                                        child: ListTile(
                                          contentPadding:
                                              EdgeInsets.only(left: 4.w),
                                          leading: Text(
                                            value.searchWeatherForecastData[i]
                                                .description,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    color: const Color(
                                                        colorPrimary)),
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
