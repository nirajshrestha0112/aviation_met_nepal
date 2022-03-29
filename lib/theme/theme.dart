import 'package:flutter/material.dart';

import '../constant/colors_properties.dart';
import '/utils/size_config.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    primaryColor: colorBlue,
    appBarTheme: const AppBarTheme(color: colorBlue),
    textTheme: const TextTheme(
      overline: TextStyle(
        color: Color(colorPrimary),
      ),
      caption: TextStyle(height: 1.5),
      button: TextStyle(height: 1.5),
      bodyText1: TextStyle(
        height: 1.5,
      ),
      bodyText2: TextStyle(height: 1.5),
      subtitle1: TextStyle(height: 1.5, fontSize: 18),
      subtitle2: TextStyle(height: 1.5, fontSize: 16),
      headline6: TextStyle(height: 1.5),
      headline5: TextStyle(height: 1.5),
      headline4: TextStyle(height: 1.5),
      headline3: TextStyle(height: 1.5),
      headline2: TextStyle(height: 1.5),
      headline1: TextStyle(height: 1.5),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: colorBlue,
        ),
        borderRadius: BorderRadius.circular(
          2 * SizeConfig.heightMultiplier,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color: colorBlue,
        ),
        borderRadius: BorderRadius.circular(
          2 * SizeConfig.heightMultiplier,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Theme.of(context).errorColor,
        ),
        borderRadius: BorderRadius.circular(
          2 * SizeConfig.heightMultiplier,
        ),
      ),
    ),
  );
}
