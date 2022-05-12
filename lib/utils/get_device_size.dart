import 'package:flutter/material.dart';

class DeviceUtil {
  static bool get isMobile {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? true : false;
  }
}
