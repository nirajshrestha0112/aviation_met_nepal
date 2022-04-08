import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/provider/privacy_policy_provider.dart';
import 'package:aviation_met_nepal/utils/custom_scroll_behavior.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_loading_indicator.dart';
import '../widgets/custom_sheet.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  // late Future _future;
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
          color: const Color(colorWhite),
          height: SizeConfig.heightMultiplier * 6.5,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ListTile(
                  title: Text(
                "Contact Us",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: SizeConfig.textMultiplier * 2.2),
              )),
              Positioned(
                top: SizeConfig.heightMultiplier * 2,
                left: SizeConfig.widthMultiplier * 3.5,
                child: GestureDetector(
                  child: Icon(
                    Icons.adaptive.arrow_back,
                    color: const Color(colorDarkBlue),
                    size: SizeConfig.imageSizeMultiplier * 6.0,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 3.0,
        ),
        SvgPicture.asset(locationImg,
            height: SizeConfig.widthMultiplier * 35.0),
        Padding(
          padding: const EdgeInsets.only(
              left: padding, right: padding, top: padding),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: padding, vertical: padding),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(radius)),
              child: Column(
                children: [
                  Image.asset(governmentImg),
                  const Divider(
                    color: Color(bgColor),
                    thickness: 1.0,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: SizeConfig.imageSizeMultiplier * 5.5,
                        color: const Color(colorDarkBlue),
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 2.0,
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
                    height: SizeConfig.heightMultiplier,
                  ),
                  BuildRowWidget(
                      onTap: (() =>
                          launch(getPhoneUrl(phone: "+977144868699"))),
                      getText: "+977144868699"),
                  SizedBox(
                    height: SizeConfig.heightMultiplier,
                  ),
                  BuildRowWidget(
                      onTap: () => ShowFabSheet.launchUrl(
                          ShowFabSheet.getEmailUrl(email: "info@mfd.gov.np")),
                      getText: "info@mfd.gov.np"),
                  SizedBox(
                    height: SizeConfig.heightMultiplier,
                  ),
                  const Divider(
                    color: Color(bgColor),
                    thickness: 1.0,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier,
                  ),
                  Column(
                    children: [
                      Text(
                        "Please Dial And Listen To Us For Notice Board Service",
                        style: Theme.of(context).textTheme.bodyText2!,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 2.5,
                      ),
                      const CustomContactText(
                          leftText: "Kathmandu :",
                          rightText:
                              "1618 07 07 33333(for daily weather updates)"),
                      SizedBox(
                        height: SizeConfig.heightMultiplier,
                      ),
                      const CustomContactText(
                        leftText: "Surkhet :       ",
                        rightText: "1618 083 523519(for daily weather data)",
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier,
                      ),
                      const CustomContactText(
                        leftText: "Pokhara :      ",
                        rightText: "1618 061 465299(for daily weather data)",
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier,
                      ),
                      const CustomContactText(
                        leftText: "Dharan :        ",
                        rightText: "1618 025 520272(for daily weather data)",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier,
                  ),
                  FutureBuilder(
                      future: _future,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CustomLoadingIndicator();
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
                                        ? Text(Provider.of<PrivacyPolicyProvider>(context, listen: false)
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
                                                  fontSize: FontSize(
                                                    SizeConfig.textMultiplier *
                                                        1.8,
                                                  ),
                                                ),
                                              })
                                    : !isViewMore
                                        ?  Html(
                                            data: Provider.of<PrivacyPolicyProvider>(
                                                    context,
                                                    listen: false)
                                                .privacyPolicyData!
                                                .data[0]
                                                .policyDetailsNp,
                                            style: {
                                                "span": Style(
                                                  fontSize: FontSize(
                                                    SizeConfig.textMultiplier *
                                                        1.8,
                                                  ),
                                                ),
                                              })
                                        :
                                        Text(Provider.of<PrivacyPolicyProvider>(
                                                context,
                                                listen: false)
                                            .privacyTitleNp!
                                            .substring(0, 90)), /* Html(
                                            data: Provider.of<PrivacyPolicyProvider>(
                                                    context,
                                                    listen: false)
                                                .privacyPolicyData!
                                                .data[0]
                                                .policyDetailsNp,
                                            style: {
                                                "span": Style(
                                                  fontSize: FontSize(
                                                    SizeConfig.textMultiplier *
                                                        1.8,
                                                  ),
                                                ),
                                              }),
 */                                TxtBtn(
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

class TxtBtn extends StatefulWidget {
  const TxtBtn({Key? key, required this.callback, required this.isViewMore})
      : super(key: key);
  final VoidCallback callback;
  final bool isViewMore;

  @override
  State<TxtBtn> createState() => _TxtBtnState();
}

class _TxtBtnState extends State<TxtBtn> {
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
  const BuildRowWidget({required this.onTap, required this.getText, Key? key})
      : super(key: key);
  final VoidCallback onTap;
  final String getText;
  @override
  State<BuildRowWidget> createState() => _BuildRowWidgetState();
}

class _BuildRowWidgetState extends State<BuildRowWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap,
      child: Row(
        children: [
          Icon(
            Icons.phone,
            size: SizeConfig.imageSizeMultiplier * 5.5,
            color: const Color(colorDarkBlue),
          ),
          SizedBox(
            width: SizeConfig.widthMultiplier * 2.0,
          ),
          Text(widget.getText,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: SizeConfig.textMultiplier * 1.8))
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
// bool isEng = true;

class _EnglishNepaliTapState extends State<EnglishNepaliTap> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.callBack,
      /* () {
        setState(() {
          isEng = !isEng;
        });
      }, */
      child: IntrinsicHeight(
        child: Row(children: [
          Container(
            alignment: Alignment.center,
            height: SizeConfig.heightMultiplier * 3,
            width: SizeConfig.widthMultiplier * 7,
            color: widget.isEng ? const Color(colorDarkBlue) : null,
            child: Text("EN",
                style: TextStyle(
                    color: widget.isEng
                        ? const Color(colorWhite)
                        : const Color(colorDarkBlue),
                    fontSize: SizeConfig.textMultiplier * 2.0)),
          ),
          const VerticalDivider(
            thickness: 1.5,
            color: Color(colorDarkBlue),
          ),
          Container(
            height: SizeConfig.heightMultiplier * 3,
            width: SizeConfig.widthMultiplier * 7,
            color: widget.isEng ? null : const Color(colorDarkBlue),
            alignment: Alignment.center,
            child: Text("NP",
                style: TextStyle(
                    color: widget.isEng
                        ? const Color(colorDarkBlue)
                        : const Color(colorWhite),
                    fontSize: SizeConfig.textMultiplier * 2.0)),
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
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(leftText, style: Theme.of(context).textTheme.bodyText2),
        SizedBox(
          width: SizeConfig.widthMultiplier * 2.0,
        ),
        Expanded(
          child: Text(rightText,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: SizeConfig.textMultiplier * 1.8)),
        ),
      ],
    );
  }
}
