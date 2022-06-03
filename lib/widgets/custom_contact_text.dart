import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContactText extends StatelessWidget {
  const CustomContactText({
    Key? key,
    required this.leftText,
    required this.rightText,
  }) : super(key: key);
  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(leftText, style: Theme.of(context).textTheme.bodyText2),
        SizedBox(
          width: 6.h,
        ),
        Expanded(
          child: Text(rightText,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: 14.sp)),
        ),
      ],
    );
  }
}