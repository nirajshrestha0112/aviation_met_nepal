import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/custom_scroll_behavior.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';

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
              height: SizeConfig.heightMultiplier! * 3.5,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier! * 6.5,
              width: double.infinity,
              child: Stack(children: [
                Positioned(
                    top: radius / 1.5,
                    left: radius,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: textColor,
                          size: SizeConfig.imageSizeMultiplier! * 8.0,
                        ))),
                ListTile(
                  title: Text(
                    "Contact Us",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: SizeConfig.textMultiplier! * 2.6,
                        color: textColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ]),
            ),
            Container(
              height: SizeConfig.heightMultiplier! * 100,
              width: double.infinity,
              color: bgColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: padding, vertical: padding),
                child: Column(
                  children: [
                    Image.asset(locationImg,
                        width: SizeConfig.widthMultiplier! * 45.0,
                        height: SizeConfig.widthMultiplier! * 45.0),
                    SizedBox(
                      height: SizeConfig.heightMultiplier! * 3.0,
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(logoImg,
                                      width: SizeConfig.widthMultiplier! * 22.0,
                                      height:
                                          SizeConfig.widthMultiplier! * 22.0),
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
                                                  SizeConfig.textMultiplier! *
                                                      1.7,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            "Department of Hydrology and Meterology",
                                            style: TextStyle(
                                                fontSize:
                                                    SizeConfig.textMultiplier! *
                                                        1.7,
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal)),
                                        Text(
                                          "Meteorology Forecasting Division",
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.textMultiplier! *
                                                      2.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 1.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.location_pin,
                                  ),
                                  SizedBox(
                                    width: SizeConfig.widthMultiplier! * 2.0,
                                  ),
                                  const Expanded(
                                      child: Text(
                                          "Gauchar,Tribhuvan International Airport Kathmandu,Nepal"))
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.heightMultiplier,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.phone),
                                  SizedBox(
                                    width: SizeConfig.widthMultiplier! * 2.0,
                                  ),
                                  const Text(
                                    "+977144868699",
                                    style: TextStyle(color: iconColor),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.heightMultiplier,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.mail),
                                  SizedBox(
                                    width: SizeConfig.widthMultiplier! * 2.0,
                                  ),
                                  const Text(
                                    "info@mfd.gov.np",
                                    style: TextStyle(color: iconColor),
                                  )
                                ],
                              )
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