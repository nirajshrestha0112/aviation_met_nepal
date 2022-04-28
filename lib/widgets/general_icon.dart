import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/colors_properties.dart';
import '../utils/get_device_size.dart';

class GeneralIcon extends StatelessWidget {
  const GeneralIcon({
    this.isPadding,
    Key? key,
  }) : super(key: key);
  final EdgeInsetsGeometry? isPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          isPadding ?? EdgeInsets.only(left: DeviceUtil.isMobile ? 4.w : 14.w),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.adaptive.arrow_back,
          color: const Color(colorDarkBlue),
          size: DeviceUtil.isMobile ? 20.h : 24.h,
        ),
      ),
    );
  }
}
