import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/colors_properties.dart';

class ModalSheetHeader extends StatelessWidget {
  const ModalSheetHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: const Color(colorDarkBlue),
              size: 20.w,
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              "Select Aiport",
              style: Theme.of(context).textTheme.bodyText1,
            )
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close_outlined,
            size: 25.w,
            color: const Color(colorDarkBlue),
          ),
        )
      ],
    );
  }
}