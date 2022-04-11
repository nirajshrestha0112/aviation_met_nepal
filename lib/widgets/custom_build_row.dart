import 'package:flutter/material.dart';

import '../constant/colors_properties.dart';
import '../constant/values.dart';
import '../utils/size_config.dart';

Widget buildRow(String label, String value,
    {bool isText = false,
    bool isMetarFor = false,
    bool isClouds = false,
    bool isDecoded = false}) {
  return Container(
    decoration: BoxDecoration(
        color: isText ? Colors.transparent : Colors.white,
        borderRadius: BorderRadius.circular(radius / 3)),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: padding,
              right: padding,
              top: padding / 2,
              bottom: radius / 6),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            isDecoded
                ? Column(children: [
                    SizedBox(
                      height: SizeConfig.heightMultiplier,
                    ),
                    Text(
                      "Decoded",
                      style: TextStyle(
                        fontSize: SizeConfig.textMultiplier * 2.0,
                        fontWeight: FontWeight.w500,
                        color: colorBlue,
                      ),
                    ),
                  ])
                : const SizedBox.shrink(),
            isDecoded
                ? SizedBox(
                    height: SizeConfig.heightMultiplier * 1.5,
                  )
                : const SizedBox.shrink(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                        fontSize: SizeConfig.textMultiplier * 1.8,
                        fontWeight: FontWeight.w500,
                        color: Color(textColor)),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.widthMultiplier * 2.0,
                ),
                Expanded(
                  child: Text(
                    value.trim(),
                    style: TextStyle(
                        fontSize: SizeConfig.textMultiplier * 1.8,
                        color: Color(textColor)),
                  ),
                ),
              ],
            ),
          ]),
        ),
        isText
            ? isMetarFor
                ? isClouds
                    ? const Divider()
                    : const SizedBox.shrink()
                : const SizedBox.shrink()
            : const SizedBox.shrink(),
      ],
    ),
  );
}
