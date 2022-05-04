import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/provider/privacy_policy_provider.dart';
import 'package:aviation_met_nepal/utils/custom_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../utils/get_device_size.dart';
import '../widgets/custom_sheet.dart';
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

class ContactUsBody extends StatefulWidget {
  const ContactUsBody({
    Key? key,
  }) : super(key: key);

  @override
  State<ContactUsBody> createState() => _ContactUsBodyState();
}

class _ContactUsBodyState extends State<ContactUsBody> {
  @override
  void initState() {
    _future = Provider.of<PrivacyPolicyProvider>(context, listen: false)
        .fetchPrivacyPolicyData();
    super.initState();
  }

  late Future _future;
  bool isViewMore = false;

  toggleViewMore() {
    setState(() {
      isViewMore = !isViewMore;
    });
  }

  bool isEng = true;

  toggleEng() {
    setState(() {
      isEng = !isEng;
    });
  }

  String getPhoneUrl({required String phone}) {
    final Uri params = Uri(
      scheme: 'tel',
      path: phone,
    );
    return params.toString();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
          child: Column(children: [
        Container(
          color: Colors.white,
          // color: Color.fromRGBO(255, 255, 255, 1),
          height: DeviceUtil.isMobile ? 46.h : 56.h,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: DeviceUtil.isMobile ? 8.w : 4.w,
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
          // child: ListTile(
          //     dense: true,
          //     // minVerticalPadding: 8.0.h,
          //     contentPadding: EdgeInsets.only(
          //         left: DeviceUtil.isMobile ? 16.w : 0.w,
          //         right: 42.w,
          //         // bottom: !DeviceUtil.isMobile ? 8.h : 0.h,
          //         top: !DeviceUtil.isMobile ? 8.h : 0.h),
          //     leading: const GeneralIcon(),
          //     title: Text(
          //       "Contact Us",
          //       textAlign: TextAlign.center,
          //       style: Theme.of(context)
          //           .textTheme
          //           .bodyText1!
          //           .copyWith(fontSize: 18.sp),
          //     )),
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
                        "Gauchar, Tribhuvan International Airport Kathmandu, Nepal",
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
                      getText: "+97714486869",
                      onTap: () {
                        ShowFabSheet.launchUrl(
                            getPhoneUrl(phone: "+977144868699"));
                      }),
                  SizedBox(height: 6.h),
                  BuildRowWidget(
                    icon: Icons.email,
                    getText: "info@mfd.gov.np",
                    onTap: () {
                      ShowFabSheet.launchUrl(
                          ShowFabSheet.getEmailUrl(email: "info@mfd.gov.np"));
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
                        "Please Dial And Listen To Us For Notice Board Service",
                        style: Theme.of(context).textTheme.bodyText2!,
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      const CustomContactText(
                          leftText: "Kathmandu :",
                          rightText:
                              "1618 07 07 33333(for daily weather updates)"),
                      SizedBox(
                        height: 4.h,
                      ),
                      const CustomContactText(
                        leftText: "Surkhet :       ",
                        rightText: "1618 083 523519(for daily weather data)",
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      const CustomContactText(
                        leftText: "Pokhara :      ",
                        rightText: "1618 061 465299(for daily weather data)",
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      const CustomContactText(
                        leftText: "Dharan :        ",
                        rightText: "1618 025 520272(for daily weather data)",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  FutureBuilder(
                      future: _future,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator.adaptive());
                        }
                        return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    isEng
                                        ? Provider.of<PrivacyPolicyProvider>(
                                                context)
                                            .privacyPolicyData!
                                            .data[0]
                                            .policyTitle
                                        : Provider.of<PrivacyPolicyProvider>(
                                                context)
                                            .privacyPolicyData!
                                            .data[0]
                                            .policyTitleNp,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                  EnglishNepaliTap(
                                    callBack: toggleEng,
                                    isEng: isEng,
                                  )
                                ],
                              ),
                              Column(children: [
                                isEng
                                    ? isViewMore
                                        ? Text(Provider.of<PrivacyPolicyProvider>(context,
                                                listen: false)
                                            .privacyTitle!
                                            .substring(0, 90))
                                        : Html(
                                            data: Provider.of<PrivacyPolicyProvider>(
                                                    context,
                                                    listen: false)
                                                .privacyPolicyData!
                                                .data[0]
                                                .policyDetails,
                                            style: {
                                                "span": Style(
                                                  fontSize: FontSize(14.sp),
                                                ),
                                              })
                                    : !isViewMore
                                        ? Html(
                                            data: Provider.of<PrivacyPolicyProvider>(
                                                    context,
                                                    listen: false)
                                                .privacyPolicyData!
                                                .data[0]
                                                .policyDetailsNp,
                                            style: {
                                                "span": Style(
                                                  fontSize: FontSize(14.sp),
                                                ),
                                              })
                                        : Text(Provider.of<PrivacyPolicyProvider>(
                                                context,
                                                listen: false)
                                            .privacyTitleNp!
                                            .substring(0, 90)),
                                TextBtn(
                                  callback: toggleViewMore,
                                  isViewMore: isViewMore,
                                )
                              ])
                            ]);
                      }),
                ],
              ),
            ),
          ),
        ),
      ])),
    );
  }
}

class TextBtn extends StatefulWidget {
  const TextBtn({Key? key, required this.callback, required this.isViewMore})
      : super(key: key);
  final VoidCallback callback;
  final bool isViewMore;

  @override
  State<TextBtn> createState() => _TextBtnState();
}

class _TextBtnState extends State<TextBtn> {
  // bool isViewMore = true;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          widget.callback();
        },
        child: Text(
          widget.isViewMore ? "View More" : "View Less",
          style: Theme.of(context).textTheme.bodyText2,
        ));
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

class EnglishNepaliTap extends StatefulWidget {
  const EnglishNepaliTap(
      {required this.callBack, required this.isEng, Key? key})
      : super(key: key);
  final VoidCallback callBack;
  final bool isEng;

  @override
  State<EnglishNepaliTap> createState() => _EnglishNepaliTapState();
}

class _EnglishNepaliTapState extends State<EnglishNepaliTap> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.callBack,
      child: IntrinsicHeight(
        child: Row(children: [
          Container(
            alignment: Alignment.center,
            height: DeviceUtil.isMobile ? 20.h : 28.h,
            width: 24.w,
            color: widget.isEng ? const Color(colorDarkBlue) : null,
            child: Text("EN",
                style: TextStyle(
                    color: widget.isEng
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
            color: widget.isEng ? null : const Color(colorDarkBlue),
            alignment: Alignment.center,
            child: Text("NP",
                style: TextStyle(
                    color: widget.isEng
                        ? const Color(colorDarkBlue)
                        : const Color(colorWhite),
                    fontSize: 16.sp)),
          ),
        ]),
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
