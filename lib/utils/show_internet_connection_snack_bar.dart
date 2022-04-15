import 'package:auto_size_text/auto_size_text.dart';
import 'package:aviation_met_nepal/main.dart';
import 'package:aviation_met_nepal/widgets/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';

showInternetConnectionSnackBar(
    {required String statusText,
    required String message,
    Color? circleAvatarbgColor,
    Color? iconColor,
    CrossAxisAlignment? crossAxisAlignment,
    Color? bgColor,
    double? size,
    IconData? icon}) {
  messengerKey.currentState!.showSnackBar(
    CustomSnackBar.customSnackBar(
        crossAxisAlignment: crossAxisAlignment,
        statusText: statusText,
        message: message,
        circleAvatarbgColor: circleAvatarbgColor,
        icon: icon,
        bgColor: bgColor,
        size: size,
        // crossAxisAlignment: crossAxisAlignment,
        iconColor: iconColor),
  );
}
