import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(colorWhite),
            borderRadius: BorderRadius.circular(6.w)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 16.h,
                left: 16.w,
              ),
              child: Text(
                rawHeaderText,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 16.sp),
              ),
            ),
            SizedBox(height: 2.h),
            ListView.separated(
              padding: EdgeInsets.only(left: 8.w, bottom: 16.h),
              primary: false,
              itemBuilder: (context, index) {
                // log(rawBodyText.length.toString());
                return Html(data: rawBodyText[index]);
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 2.h,
              ),
              itemCount: rawBodyText.length,
              shrinkWrap: true,
            ),
          ],
        ));
  }
}
