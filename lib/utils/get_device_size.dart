import 'package:flutter/material.dart';
/* 
boolgetDeviceType() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);

  print(data.size.shortestSide < 550 ? 'phone' : 'tablet');

  return data.size.shortestSide < 550 ? true : false;
} */


class DeviceUtil {
  static bool get isMobile {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
    return data.size.shortestSide < 600 ? true : false;
  }

   
}