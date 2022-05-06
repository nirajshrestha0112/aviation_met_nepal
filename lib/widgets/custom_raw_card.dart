import 'dart:developer';

import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/utils/get_device_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class CustomRawCard extends StatefulWidget {
  const CustomRawCard({
    required this.rawBodyText,
    required this.rawHeaderText,
    Key? key,
  }) : super(key: key);
  final String rawHeaderText;
  final List<String> rawBodyText;

  @override
  State<CustomRawCard> createState() => _CustomRawCardState();
}

class _CustomRawCardState extends State<CustomRawCard> {
  bool isLoadingVertical = false;
  _loadMoreVertical() {
    log("message", name: "at end");
    setState(() {
      isLoadingVertical = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(rawBodyText);
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
                widget.rawHeaderText,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 16.sp),
              ),
            ),
            SizedBox(height: 2.h),
            LazyLoadScrollView(
              isLoading: false,
              // controller
              onEndOfPage: () => _loadMoreVertical(),
              child: Scrollbar(
                child: ListView.separated(
                  padding: EdgeInsets.only(
                      left: DeviceUtil.isMobile ? 8.w : 14.w, bottom: 16.h),
                  primary: false,
                  itemBuilder: (context, index) {
                    // log(rawBodyText.length.toString());
                    return Html(data: widget.rawBodyText[index]);
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 2.h,
                  ),
                  itemCount: widget.rawBodyText.length,
                  shrinkWrap: true,
                ),
              ),
            ),
          ],
        ));
  }
}
