import 'package:flutter/material.dart';

import '../constant/colors_properties.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralIcon extends StatelessWidget {
  const GeneralIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w),
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
