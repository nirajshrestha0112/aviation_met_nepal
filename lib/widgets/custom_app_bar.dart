import 'package:aviation_met_nepal/widgets/general_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/get_device_size.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, required this.text, this.isHome = true})
      : preferredSize = Size.fromHeight(
          DeviceUtil.isMobile ? 44.h : 56.h,
        ),
        super(key: key);
  @override
  final Size preferredSize;
  final String text; // default is 56.0
  final bool isHome;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: DeviceUtil.isMobile ? 44.h : 56.h,
      // leading: GeneralIcon(),
      leading: Visibility(visible: widget.isHome, child: const GeneralIcon()),
      title: Container(
        padding: EdgeInsets.only(
          bottom: DeviceUtil.isMobile ? 4.h : 0.h,
          top: DeviceUtil.isMobile ? 0.h : 0.h,
        ),
        child: Text(widget.text),
      ),
    );
  }
}
