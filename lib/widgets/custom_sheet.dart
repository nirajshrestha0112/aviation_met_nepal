import 'dart:developer';

import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/provider/airport_list_provider.dart';
import 'package:aviation_met_nepal/provider/login_provider.dart';
import 'package:aviation_met_nepal/provider/weather_camera_images_provider.dart';
import 'package:aviation_met_nepal/screens/details_screen.dart';
import 'package:aviation_met_nepal/theme/theme.dart';
import 'package:aviation_met_nepal/widgets/general_text_button.dart';
import 'package:aviation_met_nepal/widgets/general_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../provider/weather_forecast_provider.dart';
import '../utils/custom_scroll_behavior.dart';
import '../utils/get_device_size.dart';
import 'general_filter.dart';
import 'modal_sheet_header.dart';

class ShowLocationSheet {
  static Future showLocationSheet({
    required BuildContext context,
    required Future future,
    required TextEditingController editingController,
  }) async {
    return await _showCustomizedBottomSheet(
        context: context,
        editingController: editingController,
        child: getShowLocationWidget(future));
  }

  static getShowLocationWidget(Future future) {
    return Scrollbar(
      child: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            return Consumer<AirportListProvider>(builder: (_, value, __) {
              return value.searchData.isEmpty
                  ? Align(
                      alignment: Alignment.center,
                      child: Text("No Airport Data Found",
                          style: TextStyle(
                              color: const Color(colorGrey20),
                              fontSize: 20.sp)))
                  : ListView.builder(
                      itemCount: value.searchData.length,
                      itemBuilder: (c, i) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                        data: value.searchData[i])));
                          },
                          child: ListTile(
                            contentPadding: EdgeInsets.only(
                              left: 4.w,
                              right: 8.w,
                            ),
                            minVerticalPadding:
                                DeviceUtil.isMobile ? 0.h : 28.h,
                            leading: Container(
                              margin: EdgeInsets.only(
                                bottom: DeviceUtil.isMobile ? 8.h : 0.h,
                              ),
                              height: 100.h,
                              child: Text(
                                value.searchData[i].ident,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 18.sp,
                                        color: const Color(colorPrimary)),
                              ),
                            ),
                            trailing: Container(
                              margin: EdgeInsets.only(
                                bottom: DeviceUtil.isMobile ? 8.h : 0.h,
                              ),
                              height: 100.h,
                              width: 180.w,
                              child: Text(
                                value.searchData[i].name,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: const Color(colorNavy50),
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ),
                        );
                      });
            });
          }),
    );
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
                    // height: 150.h,
                    height: !DeviceUtil.isMobile ? 60.h : null,
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
                  GeneralTextButton(
                      height: DeviceUtil.isMobile ? 46.h : 56.h,
                      text: "Apply",
                      onPressed: () => Navigator.pop(context))
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
    required Future future,
  }) async {
    final editingController = TextEditingController();

    log(editingController.text, name: 'Filter name');

    editingController.addListener(() {
      Provider.of<CitiesProvider>(context, listen: false)
          .filterSearchWeatherForecastResults(editingController.text);
    });

    return await _showCustomizedBottomSheet(
        context: context,
        editingController: editingController,
        child: getWeatherForecastCitiesWidget(future));
  }

  static getWeatherForecastCitiesWidget(Future future) {
    return Scrollbar(
      child: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }

            return Consumer<CitiesProvider>(builder: (_, value, __) {
              return value.searchWeatherForecastData.isEmpty
                  ? Align(
                      alignment: Alignment.topCenter,
                      child: Text("No Data Found",
                          style: TextStyle(
                              color: const Color(colorGrey20),
                              fontSize: 18.sp)))
                  : ListView.builder(
                      itemCount: value.searchWeatherForecastData.length,
                      itemBuilder: (c, i) {
                        return GestureDetector(
                            onTap: () async {
                              Navigator.pop(
                                  context,
                                  value.searchWeatherForecastData[i]
                                      .description);

                              await Provider.of<WeatherForecastProvider>(
                                      context,
                                      listen: false)
                                  .fetchWeatherForecast(
                                      id: value.searchWeatherForecastData[i].id)
                                  .then((_) {});
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 16.h, left: 4.h),
                              child: Text(
                                  value
                                      .searchWeatherForecastData[i].description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontSize: 18.sp,
                                          color: const Color(colorPrimary))),
                            ));
                      });
            });
          }),
    );
  }
}

_showCustomizedBottomSheet({
  required BuildContext context,
  required TextEditingController editingController,
  required Widget child,
}) async {
  return await showModalBottomSheet(
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
                height: DeviceUtil.isMobile ? 8.h : 16.h,
              ),
              GeneralTextFormField(
                suffixIconsSize: 25.w,
                contextPadding: EdgeInsets.only(
                  left: 5.w,
                ),
                prefixIconsPadding: false,
                suffixIcons: Icons.search,
                hintText: "Search Airport",
                obscureText: false,
                controller: editingController,
              ),
              SizedBox(
                height: DeviceUtil.isMobile ? 8.h : 16.h,
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: Theme(
                      data: theme(context)
                          .copyWith(highlightColor: const Color(bgColor)),
                      child: child),
                ),
              )
            ]),
          ),
        );
      });
}

class ShowWeatherCameraImagesSheet {
  static showWeatherCameraImagesSheet({
    required BuildContext context,
    required TextEditingController editingController,
    required Future future,
  }) async {
    return await _showCustomizedBottomSheet(
      context: context,
      editingController: editingController,
      child: getShowWeatherCameraImagesWidget(future),
    );
  }

  static getShowWeatherCameraImagesWidget(Future future) {
    return Scrollbar(
      child: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }

            return Consumer<WeatherCameraImagesProvider>(
              builder: (_, value, __) {
                return value.searchWeatherCameraImagesData.isEmpty
                    ? Align(
                        alignment: Alignment.center,
                        child: Text("No Airport Data Found",
                            style: TextStyle(
                                color: const Color(colorGrey20),
                                fontSize: 20.sp)))
                    : ListView.builder(
                        itemCount: value.searchWeatherCameraImagesData.length,
                        itemBuilder: (c, i) {
                          return ListTile(
                            onTap: (() => {
                                  Navigator.pop(context,
                                      value.searchWeatherCameraImagesData[i])
                                }),
                            contentPadding: EdgeInsets.only(left: 4.w),
                            minVerticalPadding:
                                DeviceUtil.isMobile ? null : 28.h,
                            leading: Text(
                              value.searchWeatherCameraImagesData[i].name
                                  .toString()
                                  .toCapitalized()
                                  .trim()
                                  .replaceAll(" ", "_"),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 18.sp,
                                      color: const Color(colorPrimary)),
                            ),
                            trailing: Container(
                              padding: EdgeInsets.only(right: 10.w),
                              width: 160.w,
                              child: Text(
                                value.searchWeatherCameraImagesData[i].name
                                    .toString(),
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: const Color(colorNavy50),
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          );
                        });
              },
            );
          }),
    );
  }
}
