import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/utils/get_device_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  const CustomIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: const Color(textColor),
      size: DeviceUtil.isMobile ? 20.h : 26.h,
    );
  }
}

class CustomImage extends StatelessWidget {
  final String assetName;
  const CustomImage({
    Key? key,
    required this.assetName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      height: DeviceUtil.isMobile ? 20.h : 26.h,
    );
  }
}
