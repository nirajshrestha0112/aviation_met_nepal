import 'dart:developer';

import 'package:aviation_met_nepal/provider/login_provider.dart';
import 'package:aviation_met_nepal/widgets/customized_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../constant/colors_properties.dart';
import '../provider/weather_camera_images_provider.dart';
import '../utils/get_device_size.dart';

class ShowWeatherCameraImagesSheet {
  static showWeatherCameraImagesSheet({
    required BuildContext context,
    required TextEditingController editingController,
    required Future future,
  }) async {
    return await ShowCustomizedBottomSheet.showCustomizedBottomSheet(
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
