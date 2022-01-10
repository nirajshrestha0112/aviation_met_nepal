import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/routes.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:aviation_met_nepal/widgets/reusable_text.dart';
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
          onPressed: () {
            Navigator.popAndPushNamed(context, homeScreen);
          },
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
              Image.asset(sendImg,
                  width: SizeConfig.widthMultiplier! * 50.0,
                  height: SizeConfig.widthMultiplier! * 50.0),
              SizedBox(
                height: SizeConfig.heightMultiplier! * 2.0,
              ),
              EachTextFormField(
                hintText: "Your Full Name",
                icons: Icons.person,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier! * 2.0,
              ),
               EachTextFormField(
                  hintText: "Email Address", icons: Icons.email_outlined),
              SizedBox(
                height: SizeConfig.heightMultiplier! * 2.0,
              ),
              Container(
                padding: const EdgeInsets.only(left: radius, top: radius),
                height: SizeConfig.heightMultiplier! * 30.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius),
                    color: Colors.white),
                child: Text(
                  "Your feedbacks here",
                  style: TextStyle(
                      fontSize: SizeConfig.textMultiplier! * 2.8,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier! * 2.0,
              ),
              
              Bttn(
                onPressed: (){},
                text: "Submit",
              )
            ],
          ),
        ),
      ),
    );
  }
}




