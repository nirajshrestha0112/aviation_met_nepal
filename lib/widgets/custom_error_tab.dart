import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/colors_properties.dart';
import '../constant/images.dart';
import '../constant/values.dart';
import '../utils/size_config.dart';

class CustomErrorTab extends StatelessWidget {
  const CustomErrorTab({this.margin = true, Key? key}) : super(key: key);
  final bool margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
      child: Container(
        height: SizeConfig.heightMultiplier * 16.0,
        margin: margin ? const EdgeInsets.only(bottom: padding * 28.0) : null,
        // alignment: Alignment.topCenter,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(colorWhite),
            borderRadius: BorderRadius.circular(radius)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              noDataImg,
              width: SizeConfig.heightMultiplier * 26,
              height: SizeConfig.widthMultiplier * 26,
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
