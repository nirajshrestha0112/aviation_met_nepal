import 'package:flutter/material.dart';

import '../constant/values.dart';
import '../utils/size_config.dart';

class CustomSnackBar {
  static customSnackBar(
      {required String statusText,
      required String message,
      Color? bgColor,
      Color? colorBlue,
      IconData? icon}) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(
          vertical: radius * 2.5, horizontal: padding),
      backgroundColor: bgColor ?? Colors.green,
      // duration: Duration(minutes: 2),
      content: SizedBox(
        height: SizeConfig.heightMultiplier * 5,
        width: double.infinity,
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          CircleAvatar(
            radius: SizeConfig.imageSizeMultiplier * 3.5,
            backgroundColor: Colors.white,
            child: Icon(
              icon ?? Icons.done,
              color: colorBlue ?? Colors.green,
              semanticLabel: "done",
              size: SizeConfig.imageSizeMultiplier * 4.5,
            ),
          ),
          SizedBox(
            width: SizeConfig.widthMultiplier * 3.0,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  statusText,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.textMultiplier * 1.8),
                ),
                Text(
                  message,
                  style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.6),
                ),
              ]),
        ]),
      ),
    );
  }
}
