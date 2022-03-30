import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class CustomRawCard extends StatelessWidget {
  const CustomRawCard({
    required this.rawBodyText,
    required this.rawHeaderText,
    Key? key,
  }) : super(key: key);
  final String rawHeaderText;
  final List<String> rawBodyText;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
          top: padding,
          left: padding,
          bottom: padding,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(colorWhite),
            borderRadius: BorderRadius.circular(radius)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              rawHeaderText,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: SizeConfig.textMultiplier * 2.0),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 1.5),
            ListView.separated(
              padding: EdgeInsets.zero,
              primary: false,
              itemBuilder: (context, index) => Html(data: rawBodyText[index]),
              separatorBuilder: (context, index) => SizedBox(
                height: SizeConfig.heightMultiplier * 1.5,
              ),
              itemCount: rawBodyText.length,
              shrinkWrap: true,
            ),
          ],
        ));
  }
}
