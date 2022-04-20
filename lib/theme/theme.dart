import 'package:flutter/material.dart';
import '../constant/colors_properties.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData theme(BuildContext context) {
  return ThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(8.w),
          color: Colors.red,
        ),
        labelColor: Colors.white,
        unselectedLabelColor: const Color(textColor),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
      ),
      scaffoldBackgroundColor: const Color(bgColor),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(colorPrimary),
      ),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          toolbarHeight: 44.h,
          /* iconTheme: IconThemeData(
            color: const Color(colorDarkBlue),
            size: 16.w,
          ), */

          elevation: 0.0,
          color: const Color(colorWhite),
          titleTextStyle: TextStyle(
              height: 1.5,
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              color: const Color(colorDarkBlue))),
      textTheme: TextTheme(
        headline6: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            color: const Color(colorPrimary)),
        bodyText1:
            TextStyle(fontSize: 16.sp, color: const Color(colorDarkBlue)),
        bodyText2: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: const Color(colorDarkBlue)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        suffixIconColor: const Color(colorPrimary),
        fillColor: const Color(colorWhite),
        filled: true,
        contentPadding:
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h / 2.0),
        hintStyle: TextStyle(
            color: const Color(colorGrey10),
            fontSize: 16.sp,
            fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.w)),
      ));
}
