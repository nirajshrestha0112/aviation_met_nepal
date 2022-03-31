import 'package:flutter/material.dart';

import '../utils/size_config.dart';

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
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(leftText, style: Theme.of(context).textTheme.bodyText2),
        SizedBox(
          width: SizeConfig.widthMultiplier * 2.0,
        ),
        Expanded(
          child: Text(rightText,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: SizeConfig.textMultiplier * 1.8)),
        ),
      ],
    );
  }
}
