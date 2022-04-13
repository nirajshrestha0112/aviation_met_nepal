import 'package:flutter/material.dart';

import '../constant/colors_properties.dart';
import '../constant/values.dart';
import '../utils/size_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildRow(String label, String value,
    {bool isText = false,
    bool isMetarFor = false,
    bool isClouds = false,
    bool isDecoded = false}) {
  return Container(
    decoration: BoxDecoration(
        color: isText ? Colors.transparent : Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: isDecoded ? Radius.circular(6.w) : Radius.zero,
            topRight: isDecoded ? Radius.circular(6.w) : Radius.zero)),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h, bottom: 2.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            isDecoded
                ? Column(children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Decoded",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: colorBlue,
                      ),
                    ),
                  ])
                : const SizedBox.shrink(),
            isDecoded
                ? SizedBox(
                    height: 4.h,
                  )
                : const SizedBox.shrink(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(textColor)),
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Expanded(
                  child: Text(
                    value.trim(),
                    style: TextStyle(
                        fontSize: 14.sp, color: const Color(textColor)),
                  ),
                ),
              ],
            ),
          ]),
        ),
        isText
            ? isMetarFor
                ? isClouds
                    ? const Divider()
                    : const SizedBox.shrink()
                : const SizedBox.shrink()
            : const SizedBox.shrink(),
      ],
    ),
  );
}
