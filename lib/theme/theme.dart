import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';

import '../constant/colors_properties.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(

      // splashColor: Colors.transparent,
      // highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(radius),
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
          iconTheme: IconThemeData(
            color: const Color(colorDarkBlue),
            size: 16.w,
          ),
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
        contentPadding: const EdgeInsets.symmetric(
            horizontal: padding, vertical: padding / 2.0),
        hintStyle: TextStyle(
            color: const Color(colorGrey10),
            fontSize: 16.sp,
            fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius)),
      ));
}
