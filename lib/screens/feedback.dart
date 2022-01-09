import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';

class FeedBack extends StatelessWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: SizeConfig.imageSizeMultiplier! * 8.0,
          ),
          onPressed: () {},
        ),
        title: Text(
          "Feedback",
          style: TextStyle(
              fontSize: SizeConfig.textMultiplier! * 2.5, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: SizeConfig.heightMultiplier! * 100,
        color: bgColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: padding, vertical: padding),
          child: Column(
            children: [
              Image.asset(
                sendImg,
                width: SizeConfig.widthMultiplier! * 60,
                height: SizeConfig.widthMultiplier! * 60,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier! * 2.0,
              ),
              TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Your Full Name",
                    prefixIcon: Icon(
                      Icons.person,
                      size: SizeConfig.imageSizeMultiplier! * 7.0,
                    ),
                    // isDense: true,
                    contentPadding: EdgeInsets.zero,
                    hintStyle: TextStyle(
                        color: searchColor,
                        fontSize: SizeConfig.textMultiplier! * 2.0,
                        fontWeight: FontWeight.w400),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: bgColor),
                        borderRadius: BorderRadius.circular(radius)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
