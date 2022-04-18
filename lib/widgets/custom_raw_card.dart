import 'dart:developer';

import 'package:aviation_met_nepal/constant/colors_properties.dart';
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
  List<String> body = [];
  int hasIndex = 0;

  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    loadMore();
     scrollController = ScrollController();
    //  scrollController.
    scrollController.addListener(() {
      log("message");
      if (scrollController.position.atEdge) {
      bool isTop = scrollController.position.pixels == 0;
      if (isTop) {
        log('At the top');
      } else {
        log('At the bottom');
      }
    }
    });
  }

  loadMore() {
    log("mess");
    body = [
      ...widget.rawBodyText
          .sublist(
            hasIndex,
            widget.rawBodyText.length > hasIndex + 20
                ? hasIndex + 20
                : widget.rawBodyText.length,
          )
          .toList()
    ];
    hasIndex += 20;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 16.h,
        left: 16.w,
        bottom: 16.h,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(colorWhite),
          borderRadius: BorderRadius.circular(6.w)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.rawHeaderText,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: 16.sp),
          ),
          SizedBox(height: 2.h),
          NotificationListener<ScrollEndNotification>(
            onNotification: (scrollEnd) {
              log("at the end");
              return true;
            },
            child: ListView.separated(
              padding: EdgeInsets.zero,
              primary: false,
              controller: scrollController,
              
              itemBuilder: (context, index) =>
                  Html(data: body[index]),
              separatorBuilder: (context, index) => SizedBox(
                height: 2.h,
              ),
              itemCount: body.length,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
