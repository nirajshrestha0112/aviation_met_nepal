import 'package:aviation_met_nepal/constant/constants.dart';
import 'package:aviation_met_nepal/widgets/customized_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../constant/colors_properties.dart';
import '../provider/airport_list_provider.dart';
import '../screens/details_screen.dart';
import '../utils/get_device_size.dart';

class ShowLocationSheet {
  static Future showLocationSheet({
    required BuildContext context,
    required Future future,
    required TextEditingController editingController,
  }) async {
    return await ShowCustomizedBottomSheet.showCustomizedBottomSheet(
        context: context,
        editingController: editingController,
        child: getShowLocationWidget(future));
  }

  static getShowLocationWidget(Future future) {
    return Scrollbar(
      child: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            return Consumer<AirportListProvider>(builder: (_, value, __) {
              return value.searchData.isEmpty
                  ? Align(
                      alignment: Alignment.center,
                      child: Text(noDataFound,
                          style: TextStyle(
                              color: const Color(colorGrey20),
                              fontSize: 20.sp)))
                  : ListView.builder(
                      itemCount: value.searchData.length,
                      itemBuilder: (c, i) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                        data: value.searchData[i])));
                          },
                          child: ListTile(
                            contentPadding: EdgeInsets.only(
                              left: 4.w,
                              right: 8.w,
                            ),
                            minVerticalPadding:
                                DeviceUtil.isMobile ? 0.h : 28.h,
                            leading: Container(
                              margin: EdgeInsets.only(
                                bottom: DeviceUtil.isMobile ? 8.h : 0.h,
                              ),
                              height: 100.h,
                              child: Text(
                                value.searchData[i].ident,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 18.sp,
                                        color: const Color(colorPrimary)),
                              ),
                            ),
                            trailing: Container(
                              margin: EdgeInsets.only(
                                bottom: DeviceUtil.isMobile ? 8.h : 0.h,
                              ),
                              height: 100.h,
                              width: 180.w,
                              child: Text(
                                value.searchData[i].name,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: const Color(colorNavy50),
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ),
                        );
                      });
            });
          }),
    );
  }
}

