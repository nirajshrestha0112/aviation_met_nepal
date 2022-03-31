import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/custom_scroll_behavior.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/custom_contact_text.dart';
import '../widgets/each_text.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

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
                      title: EachText(
                    text: "Contact Us",
                    textAlign: TextAlign.center,
                    fontSize: SizeConfig.textMultiplier * 2.2,
                    color: const Color(textColor),
                    fontWeight: FontWeight.w500,
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
                        width: SizeConfig.widthMultiplier * 45.0,
                        height: SizeConfig.widthMultiplier * 45.0),
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
                              /*    Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(logoImg,
                                      width: SizeConfig.widthMultiplier * 22.0,
                                      height:
                                          SizeConfig.widthMultiplier * 22.0),
                                  SizedBox(
                                    width: SizeConfig.widthMultiplier,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Government of Nepal",
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.textMultiplier *
                                                      1.7,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            "Department of Hydrology and Meterology",
                                            style: TextStyle(
                                                fontSize:
                                                    SizeConfig.textMultiplier *
                                                        1.7,
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal)),
                                        Text(
                                          "Meteorology Forecasting Division",
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.textMultiplier *
                                                      2.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              */
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
                                    "Gauchar,Tribhuvan International Airport Kathmandu,Nepal",
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
