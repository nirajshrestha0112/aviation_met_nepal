import 'package:aviation_met_nepal/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant/colors_properties.dart';
import '../utils/custom_scroll_behavior.dart';
import '../utils/get_device_size.dart';
import 'general_text_form_field.dart';
import 'modal_sheet_header.dart';

class ShowCustomizedBottomSheet {
  static showCustomizedBottomSheet({
    required BuildContext context,
    required TextEditingController editingController,
    required Widget child,
  }) async {
    return await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (_) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.7,
            color: const Color(colorWhite),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.w / 1.5, vertical: 16.h),
              child: Column(children: [
                const ModalSheetHeader(),
                SizedBox(
                  height: DeviceUtil.isMobile ? 8.h : 16.h,
                ),
                GeneralTextFormField(
                  suffixIconsSize: 25.w,
                  contextPadding: EdgeInsets.only(
                    left: 5.w,
                  ),
                  prefixIconsPadding: false,
                  suffixIcons: Icons.search,
                  hintText: "Search Airport",
                  obscureText: false,
                  controller: editingController,
                ),
                SizedBox(
                  height: DeviceUtil.isMobile ? 8.h : 16.h,
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: Theme(
                        data: theme(context)
                            .copyWith(highlightColor: const Color(bgColor)),
                        child: child),
                  ),
                )
              ]),
            ),
          );
        });
  }
}
