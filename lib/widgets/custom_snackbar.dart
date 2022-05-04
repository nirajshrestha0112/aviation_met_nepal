import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/get_device_size.dart';

class CustomSnackBar {
  static customSnackBar(
      {required String statusText,
      required String message,
      Color? circleAvatarbgColor,
      Color? bgColor,
      Color? iconColor,
      CrossAxisAlignment? crossAxisAlignment,
      double? size,
      IconData? icon}) {
    return SnackBar(
      duration: const Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
      backgroundColor: bgColor ?? Colors.transparent,
      // duration: Duration(minutes: 2),
      content: SizedBox(
        height: DeviceUtil.isMobile?34.h:48.h,
        width: double.infinity,
        child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: crossAxisAlignment??CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 13.w,
                backgroundColor: circleAvatarbgColor ?? Colors.transparent,
                child: Icon(
                  icon ?? Icons.done,
                  color: iconColor ?? Colors.transparent,
                  size: size ?? 20.w,
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      statusText,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 13.sp),
                    ),
                    AutoSizeText(
                      message,
                      style: TextStyle(fontSize: 11.5.sp),
                    ),
                  ]),
            ]),
      ),
    );
  }
}
