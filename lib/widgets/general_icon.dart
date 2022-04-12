import 'package:flutter/material.dart';

import '../constant/colors_properties.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralIcon extends StatelessWidget {
  const GeneralIcon({
    this.isPadding,
    Key? key,
  }) : super(key: key);
  final EdgeInsetsGeometry? isPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isPadding ?? EdgeInsets.only(right: 6.w),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.adaptive.arrow_back,
          color: const Color(colorDarkBlue),
          size: 20.h,
        ),
      ),
    );
  }
}
