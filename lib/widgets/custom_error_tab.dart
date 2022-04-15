import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constant/colors_properties.dart';
import '../constant/images.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorTab extends StatelessWidget {
  const CustomErrorTab({this.margin = true, Key? key}) : super(key: key);
  final bool margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Container(
        height: 100.h,
        margin: margin ? EdgeInsets.only(bottom: 440.h) : null,
        // alignment: Alignment.topCenter,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(colorWhite),
            borderRadius: BorderRadius.circular(8.w)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              noDataImg,
              width: 100.w,
              height: 80.h,
            ),
            Text("No data Available",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}
