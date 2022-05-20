import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/constant/constants.dart';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/provider/privacy_policy_provider.dart';
import 'package:aviation_met_nepal/utils/custom_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../utils/get_device_size.dart';
import '../utils/open_external_app.dart';
import '../widgets/general_icon.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(body: ContactUsBody()),
    );
  }
}

class ContactUsBody extends StatelessWidget {
  const ContactUsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
          child: Column(children: [
        Container(
          color: Colors.white,
          height: DeviceUtil.isMobile ? 46.h : 56.h,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: DeviceUtil.isMobile ? 12.w : 4.w,
              ),
              const GeneralIcon(),
              SizedBox(
                width: 120.w,
              ),
              Text(
                "Contact Us",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 18.sp),
              )
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        SvgPicture.asset(locationImg, height: 100.h),
        Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.w)),
              child: Column(
                children: [
                  Image.asset(governmentImg),
                  const Divider(
                    color: Color(bgColor),
                    thickness: 1.0,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: 22.w,
                        color: const Color(colorDarkBlue),
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Expanded(
                          child: Text(
                        dhmLocation,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontWeight: FontWeight.normal),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  BuildRowWidget(
                      icon: Icons.phone,
                      getText: dhmPhoneNumber,
                      onTap: () {
                        launchUrl(getPhoneUrl(phone: dhmPhoneNumber));
                      }),
                  SizedBox(height: 6.h),
                  BuildRowWidget(
                    icon: Icons.email,
                    getText: dhmEmail,
                    onTap: () {
                      launchUrl(getEmailUrl(email: dhmEmail));
                    },
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  const Divider(
                    color: Color(bgColor),
                    thickness: 1.0,
                  ),
                  SizedBox(height: 6.h),
                  Column(
                    children: [
                      Text(
                        dhmRequestText,
                        style: Theme.of(context).textTheme.bodyText2!,
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      const CustomContactText(
                          leftText: "$kathmanduText :",
                          rightText: kathmanduContactDetail),
                      SizedBox(
                        height: 4.h,
                      ),
                      const CustomContactText(
                        leftText: "$surkhetText :       ",
                        rightText: surkhetContactDetail,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      const CustomContactText(
                        leftText: "$pokharaText :      ",
                        rightText: pokharaContactDetail,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      const CustomContactText(
                        leftText: "$dharanText :        ",
                        rightText: dharanContactDetail,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const Divider(),
                  SizedBox(
                    height: 8.h,
                  ),
                  const ClickAbleContain()
                ],
              ),
            ),
          ),
        ),
      ])),
    );
  }
}

class ClickAbleContain extends StatefulWidget {
  const ClickAbleContain({Key? key}) : super(key: key);

  @override
  State<ClickAbleContain> createState() => _ClickAbleContainState();
}

class _ClickAbleContainState extends State<ClickAbleContain> {
  @override
  void initState() {
    _future = Provider.of<PrivacyPolicyProvider>(context, listen: false)
        .fetchPrivacyPolicyData();
    super.initState();
  }

  late Future _future;
  bool isViewMore = false;
  bool isEng = true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          return Consumer<PrivacyPolicyProvider>(builder: (context, value, _) {
            return Column(mainAxisSize: MainAxisSize.min, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isEng
                        ? value.privacyPolicyData!.data[0].policyTitle
                        : value.privacyPolicyData!.data[0].policyTitleNp,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(
                        () => isEng = !isEng,
                      );
                    },
                    child: IntrinsicHeight(
                      child: Row(children: [
                        Container(
                          alignment: Alignment.center,
                          height: DeviceUtil.isMobile ? 20.h : 28.h,
                          width: 24.w,
                          color: isEng ? const Color(colorDarkBlue) : null,
                          child: Text("EN",
                              style: TextStyle(
                                  color: isEng
                                      ? const Color(colorWhite)
                                      : const Color(colorDarkBlue),
                                  fontSize: 16.sp)),
                        ),
                        const VerticalDivider(
                          thickness: 1.5,
                          color: Color(colorDarkBlue),
                        ),
                        Container(
                          height: DeviceUtil.isMobile ? 20.h : 28.h,
                          width: 24.w,
                          color: isEng ? null : const Color(colorDarkBlue),
                          alignment: Alignment.center,
                          child: Text("NP",
                              style: TextStyle(
                                  color: isEng
                                      ? const Color(colorDarkBlue)
                                      : const Color(colorWhite),
                                  fontSize: 16.sp)),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Column(children: [
                isEng
                    ? isViewMore
                        ? Text(value.privacyTitle!.substring(0, 90))
                        : Html(
                            data:
                                value.privacyPolicyData!.data[0].policyDetails,
                            style: {
                                "span": Style(
                                  fontSize: FontSize(14.sp),
                                ),
                              })
                    : !isViewMore
                        ? Html(
                            data: value
                                .privacyPolicyData!.data[0].policyDetailsNp,
                            style: {
                                "span": Style(
                                  fontSize: FontSize(14.sp),
                                ),
                              })
                        : Text(value.privacyTitleNp!.substring(0, 90)),
                TextButton(
                    onPressed: () {
                      setState(() {
                        isViewMore = !isViewMore;
                      });
                    },
                    child: Text(
                      isViewMore ? "View More" : "View Less",
                      style: Theme.of(context).textTheme.bodyText2,
                    ))
              ])
            ]);
          });
        });
  }
}

class BuildRowWidget extends StatefulWidget {
  const BuildRowWidget(
      {required this.onTap,
      required this.getText,
      Key? key,
      required this.icon})
      : super(key: key);
  final void Function() onTap;
  final String getText;
  final IconData icon;

  @override
  State<BuildRowWidget> createState() => _BuildRowWidgetState();
}

class _BuildRowWidgetState extends State<BuildRowWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Row(
        children: [
          Icon(
            widget.icon,
            size: 22.w,
            color: const Color(colorDarkBlue),
          ),
          SizedBox(
            width: 4.w,
          ),
          Text(widget.getText,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: 14.sp))
        ],
      ),
    );
  }
}

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(leftText, style: Theme.of(context).textTheme.bodyText2),
        SizedBox(
          width: 6.h,
        ),
        Expanded(
          child: Text(rightText,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: 14.sp)),
        ),
      ],
    );
  }
}
