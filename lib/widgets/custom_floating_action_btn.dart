import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/get_device_size.dart';
import 'menu_bottom_sheet.dart';

class CustomFloatingActionBtn extends StatelessWidget {
  const CustomFloatingActionBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceUtil.isMobile ? 45.h : 60.h,
      width: DeviceUtil.isMobile ? 50.w : 60.w,
      child: FloatingActionButton(
        backgroundColor: colorBlue,
        onPressed: () {
          ShowMenuBottomSheet.showMenuBottomSheet(context: context);
        },
        elevation: 0.0,
        child: Icon(
          Icons.apps_sharp,
          size: 30.w,
        ),
      ),
    );
  }
}
