import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:flutter/material.dart';

import '../utils/size_config.dart';
import 'custom_show_sheet.dart';

class CustomFloatingActionBtn extends StatelessWidget {
  const CustomFloatingActionBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.heightMultiplier! * 6.0,
      width: SizeConfig.widthMultiplier! * 12.0,
      child: FloatingActionButton(
        backgroundColor: iconColor,
        child: Icon(
          Icons.apps_sharp,
          size: SizeConfig.imageSizeMultiplier! * 8.0,
        ),
        onPressed: () {
          ShowSheet.showSheet(context: context);
        },
        elevation: 0.0,
      ),
    );
  }
}