import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/colors_properties.dart';
import '../utils/get_device_size.dart';
import 'general_filter.dart';
import 'general_text_button.dart';

class ShowFilterSheet {
  static Future showFilterSheet(context) async {
    String? value;
    await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, top: 16.h, right: 16.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.filter_alt,
                            color: const Color(colorDarkBlue),
                            size: 22.w,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            "Filter",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(colorDarkBlue)),
                          ),
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
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    // height: 150.h,
                    height: !DeviceUtil.isMobile ? 60.h : null,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      border:
                          Border.all(color: const Color(bgColor), width: 2.0.w),
                    ),
                    child: StatefulBuilder(builder: (context, set) {
                      return DropDownFilter(
                        setValue: (val) {
                          value = val;
                          set(() {});
                        },
                      );
                    }),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  GeneralTextButton(
                      height: DeviceUtil.isMobile ? 46.h : 56.h,
                      text: "Apply",
                      onPressed: () => Navigator.pop(context))
                ],
              ),
            ),
          );
        });
    return value;
  }
}