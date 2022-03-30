import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/colors_properties.dart';
import '../constant/images.dart';
import '../constant/values.dart';
import '../utils/size_config.dart';

class CustomErrorTab extends StatelessWidget {
  const CustomErrorTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: padding, vertical: padding * 2.0),
      child: Column(
        children: [
          Container(
            height: SizeConfig.heightMultiplier * 23.0,
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color(colorWhite),
                borderRadius: BorderRadius.circular(radius)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  noDataImg,
                  width: SizeConfig.heightMultiplier * 30,
                  height: SizeConfig.widthMultiplier * 30,
                ),
                Text("No data Available",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.normal)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
