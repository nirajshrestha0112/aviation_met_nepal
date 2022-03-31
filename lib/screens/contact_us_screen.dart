import 'dart:developer';

import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/provider/privacy_policy_provider.dart';
import 'package:aviation_met_nepal/utils/custom_scroll_behavior.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_contact_text.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  void initState() {
    _get();
    super.initState();
  }

  Future _get() async {
    await Provider.of<PrivacyPolicyProvider>(context, listen: false)
        .fetchPrivacyPolicyData();
  }

  bool isEng = true;
  // late Future _future;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.heightMultiplier * 3.5,
            ),
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
                        Icons.arrow_back_ios_new_sharp,
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
              height: SizeConfig.heightMultiplier * 100,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: padding, vertical: padding),
                child: Column(
                  children: [
                    SvgPicture.asset(locationImg,
                        height: SizeConfig.widthMultiplier * 35.0),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 3.0,
                    ),
                    Expanded(
                      child: Container(
                        //   width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(radius)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: padding / 2.0, vertical: padding),
                          child: Column(
                            children: [
                              Image.asset(governmentImg),
                              const Divider(
                                color: Color(bgColor),
                                thickness: 1.0,
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
                                        .copyWith(
                                            fontWeight: FontWeight.normal),
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.heightMultiplier,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    size: SizeConfig.imageSizeMultiplier * 5.5,
                                    color: const Color(colorDarkBlue),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.widthMultiplier * 2.0,
                                  ),
                                  Text("+977144868699",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                              fontSize:
                                                  SizeConfig.textMultiplier *
                                                      1.8))
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.heightMultiplier,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.mail,
                                    size: SizeConfig.imageSizeMultiplier * 5.5,
                                    color: const Color(colorDarkBlue),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.widthMultiplier * 2.0,
                                  ),
                                  Text("info@mfd.gov.np",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                              fontSize:
                                                  SizeConfig.textMultiplier *
                                                      1.8))
                                ],
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
                                    style:
                                        Theme.of(context).textTheme.bodyText2!,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier,
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
                                    rightText:
                                        "1618 083 523519(for daily weather data)",
                                  ),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier,
                                  ),
                                  const CustomContactText(
                                    leftText: "Pokhara :      ",
                                    rightText:
                                        "1618 061 465299(for daily weather data)",
                                  ),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier,
                                  ),
                                  const CustomContactText(
                                    leftText: "Dharan :        ",
                                    rightText:
                                        "1618 025 520272(for daily weather data)",
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.heightMultiplier,
                              ),
                              Consumer<PrivacyPolicyProvider>(
                                  builder: (_, value, __) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      value.privacyPolicyData!.data.policyTitle,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isEng = !isEng;
                                        });
                                      },
                                      child: IntrinsicHeight(
                                        child: Row(children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height:
                                                SizeConfig.heightMultiplier * 3,
                                            width:
                                                SizeConfig.widthMultiplier * 7,
                                            color: isEng
                                                ? const Color(colorDarkBlue)
                                                : const Color(colorWhite),
                                            child: Text("EN",
                                                style: TextStyle(
                                                    color: isEng
                                                        ? const Color(
                                                            colorWhite)
                                                        : const Color(
                                                            colorDarkBlue),
                                                    fontSize: SizeConfig
                                                            .textMultiplier *
                                                        2.0)),
                                          ),
                                          const VerticalDivider(
                                            thickness: 1.5,
                                            color: Color(colorDarkBlue),
                                          ),
                                          Container(
                                            height:
                                                SizeConfig.heightMultiplier * 3,
                                            width:
                                                SizeConfig.widthMultiplier * 7,
                                            color: isEng
                                                ? const Color(colorWhite)
                                                : const Color(colorDarkBlue),
                                            alignment: Alignment.center,
                                            child: Text("NP",
                                                style: TextStyle(
                                                    color: isEng
                                                        ? const Color(
                                                            colorDarkBlue)
                                                        : const Color(
                                                            colorWhite),
                                                    fontSize: SizeConfig
                                                            .textMultiplier *
                                                        2.0)),
                                          ),
                                        ]),
                                      ),
                                    )
                                  ],
                                );
                              })
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
