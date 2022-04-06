import 'package:flutter/material.dart';

import '../constant/colors_properties.dart';
import '../constant/values.dart';
import '../utils/size_config.dart';

class GeneralIcon extends StatelessWidget {
  const GeneralIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: padding / 1.5),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.adaptive.arrow_back,
          color: const Color(colorDarkBlue),
          size: SizeConfig.imageSizeMultiplier * 6.0,
        ),
      ),
    );
  }
}
