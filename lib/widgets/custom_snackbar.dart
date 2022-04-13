import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
      backgroundColor: bgColor ?? Colors.transparent,
      // duration: Duration(minutes: 2),
      content: SizedBox(
        height: 30.h,
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
                          fontWeight: FontWeight.w500, fontSize: 14.sp),
                    ),
                    Text(
                      message,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ]),
            ]),
      ),
    );
  }
}
