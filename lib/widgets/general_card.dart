import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/custom_scroll_behavior.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';

class GeneralCard extends StatelessWidget {
  final String text;
  final Widget child;
  const GeneralCard({required this.text, Key? key, required this.child})
      : super(key: key);

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
              SizedBox(
                height: SizeConfig.heightMultiplier * 6.5,
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
                            color: Color(textColor),
                            size: SizeConfig.imageSizeMultiplier * 8.0,
                          ))),
                  ListTile(
                    title: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 2.6,
                          color: Color(textColor),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ]),
              ),
              Container(
                  height: SizeConfig.heightMultiplier * 100,
                  width: double.infinity,
                  color: Color(bgColor),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: padding, vertical: padding),
                    child: Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(radius)),
                        child: child,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
