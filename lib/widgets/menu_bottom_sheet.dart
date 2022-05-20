import 'package:aviation_met_nepal/constant/constants.dart';
import 'package:aviation_met_nepal/model/custom_menu.dart';
import 'package:aviation_met_nepal/utils/custom_navigation.dart';
import 'package:aviation_met_nepal/utils/logout_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../constant/colors_properties.dart';
import '../constant/images.dart';
import '../constant/routes.dart';
import '../provider/login_provider.dart';
import '../utils/custom_scroll_behavior.dart';
import '../utils/get_device_size.dart';
import '../utils/open_external_app.dart';
import 'custom_icon_image.dart';
import 'each_text.dart';

class ShowMenuBottomSheet {
  static final List<CustomMenu> menuListData = [
    CustomMenu(
      icon: const CustomIcon(icon: Icons.home),
      title: const EachText(text: "Home"),
      navigateTo: homeRoute,
      isHome: true,
    ),
    CustomMenu(
      icon: const CustomIcon(icon: Icons.notification_add),
      title: const EachText(text: "Notification"),
      navigateTo: notificationRoute,
    ),
    CustomMenu(
        icon: const CustomIcon(icon: Icons.expand_less_outlined),
        title: const EachText(text: "Icing & Turbulence Chart"),
        navigateTo: icingTurbulenceChartRoute,
        needLogin: true),
    CustomMenu(
        icon: const CustomImage(assetName: cameraImg),
        title: const EachText(text: "Weather Camera Images"),
        navigateTo: weatherCameraImagesRoute,
        needLogin: true),
    CustomMenu(
      icon: const CustomImage(assetName: satelliteImg),
      title: const EachText(text: "Satellite Images"),
      navigateTo: satelliteImageDataRoute,
    ),
    CustomMenu(
      icon: const CustomImage(assetName: lightingImg),
      title: const EachText(text: "Lighting Data"),
      navigateTo: lightingDataRoute,
    ),
    CustomMenu(
      icon: const CustomImage(assetName: windImg),
      title: const EachText(text: "Wind Chart"),
      navigateTo: windChartRoute,
      needLogin: true,
    ),
    CustomMenu(
      icon: const CustomImage(assetName: windImg),
      title: const EachText(text: "Wind Chart"),
      navigateTo: windChartRoute,
      needLogin: true,
    ),
    CustomMenu(
      icon: const CustomImage(assetName: chartImg),
      title: const EachText(text: "SIGWX Chart"),
      navigateTo: sigwxChartRoute,
      needLogin: true,
    ),
    CustomMenu(
      icon: const CustomImage(assetName: newsImg),
      title: const EachText(text: "Weather Forecast"),
      navigateTo: weatherForecastRoute,
    ),
    CustomMenu(
      icon: const CustomImage(assetName: newsImg),
      title: const EachText(text: "Airmet Data"),
      navigateTo: airmetDataRoute,
    ),
    CustomMenu(
      icon: const CustomImage(assetName: newsImg),
      title: const EachText(text: "Ashtams Data"),
      navigateTo: ashtamsDataRoute,
    ),
    CustomMenu(
      icon: const CustomImage(assetName: newsImg),
      title: const EachText(text: "Gamet Data"),
      navigateTo: gametDataRoute,
    ),
    CustomMenu(
      icon: const CustomImage(assetName: newsImg),
      title: const EachText(text: "Opmet Data"),
      navigateTo: opmetDataRoute,
    ),
    CustomMenu(
      icon: const CustomIcon(icon: Icons.contacts_outlined),
      title: const EachText(text: "Contact Us"),
      navigateTo: contactRoute,
    ),
    CustomMenu(
        icon: const CustomIcon(icon: Icons.message),
        title: const EachText(text: "Feedback"),
        navigateTo: getEmailUrl(email: feedbackEmail),
        needToOpenUrl: true),
  ];

  static void showFabSheet({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return DraggableScrollableSheet(
          expand: false,
          maxChildSize: 0.95,
          initialChildSize: 0.7,
          builder: (_, controller) {
            return Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.apps_sharp,
                            color: const Color(colorDarkBlue),
                            size: 32.w,
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          Text(
                            "Menu",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
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
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Provider.of<LoginProvider>(context, listen: true).loginName !=
                          null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 4.w,
                                ),
                                CircleAvatar(
                                  backgroundColor: const Color(bgColor),
                                  radius: 11.w,
                                  child: Icon(
                                    Icons.person,
                                    color: const Color(colorDarkBlue),
                                    size: 16.w,
                                  ),
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        Provider.of<LoginProvider>(context,
                                                listen: true)
                                            .loginName
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!),
                                    SizedBox(height: 4.h),
                                    Text(
                                      Provider.of<LoginProvider>(context,
                                              listen: true)
                                          .userId
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                            fontSize: 14.sp,
                                          ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 5.3.w),
                              height: 20.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.w),
                                color: const Color(bgColor),
                              ),
                              child: GestureDetector(
                                child: Icon(
                                  Icons.logout,
                                  size: 16.w,
                                  color: const Color(colorDarkBlue),
                                ),
                                onTap: () async {
                                  showLogoutAlertDialog(context);
                                },
                              ),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ]),
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                            height: DeviceUtil.isMobile ? 14.h : 16.h,
                          ),
                      controller: controller,
                      itemCount: menuListData.length,
                      itemBuilder: (c, i) {
                        return GestureDetector(
                          onTap: () {
                            CustomMenu menu = menuListData[i];
                            if (menu.needToOpenUrl) {
                              launchUrl(menu.navigateTo);
                            } else {
                              checkInternetLoginAndNavigate(context, menu);
                            }
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width: 12.w,
                              ),
                              menuListData[i].icon,
                              SizedBox(
                                width: DeviceUtil.isMobile ? 24.w : 14.w,
                              ),
                              menuListData[i].title
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ]);
          },
        );
      },
    );
  }
}
