import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/colors_properties.dart';

class BuildRowWidget extends StatefulWidget {
  const BuildRowWidget(
      {required this.onTap,
      required this.getText,
      Key? key,
      required this.icon})
      : super(key: key);
  final void Function() onTap;
  final String getText;
  final IconData icon;

  @override
  State<BuildRowWidget> createState() => _BuildRowWidgetState();
}

class _BuildRowWidgetState extends State<BuildRowWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Row(
        children: [
          Icon(
            widget.icon,
            size: 22.w,
            color: const Color(colorDarkBlue),
          ),
          SizedBox(
            width: 4.w,
          ),
          Text(widget.getText,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: 14.sp))
        ],
      ),
    );
  }
}
