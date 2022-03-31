import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';

import '../constant/colors_properties.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(radius),
          color: Colors.red,
        ),
        labelColor: Colors.white,
        unselectedLabelColor: const Color(textColor),
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      scaffoldBackgroundColor: const Color(bgColor),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(colorPrimary),
      ),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          iconTheme: IconThemeData(
            color: const Color(colorDarkBlue),
            size: SizeConfig.imageSizeMultiplier * 6.0,
          ),
          elevation: 0.0,
          color: const Color(colorWhite),
          titleTextStyle: TextStyle(
              height: 1.5,
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.textMultiplier * 2.5,
              color: const Color(colorDarkBlue))),
      textTheme: TextTheme(
        headline6: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: SizeConfig.textMultiplier * 2.2,
            color: const Color(colorPrimary)),
        bodyText1: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2.1,
            color: const Color(colorDarkBlue)),
        bodyText2: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: SizeConfig.textMultiplier * 1.8,
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
            fontSize: SizeConfig.textMultiplier * 2.0,
            fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius)),
      ));
}
