import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:aviation_met_nepal/widgets/general_text_button.dart';
import 'package:aviation_met_nepal/widgets/general_textfield.dart';
import 'package:flutter/material.dart';

class FeedBack extends StatelessWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: textColor,
            size: SizeConfig.imageSizeMultiplier! * 8.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Feedback",
          style: TextStyle(
              fontSize: SizeConfig.textMultiplier! * 2.3, color: textColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                const GeneralTextField(
                  obscureText: false,
                  hintText: "Your Full Name",
                  keyboard: TextInputType.text,
                  icons: Icons.person,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier! * 2.0,
                ),
                const GeneralTextField(
                    obscureText: false,
                    hintText: "Email Address",
                    keyboard: TextInputType.emailAddress,
                    icons: Icons.email_outlined),
                SizedBox(
                  height: SizeConfig.heightMultiplier! * 2.0,
                ),
                Container(
                    height: SizeConfig.heightMultiplier! * 30.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius),
                        color: Colors.white),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Your feedback here",
                        hintStyle: TextStyle(
                            color: searchColor,
                            fontSize: SizeConfig.textMultiplier! * 2.3,
                            fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(radius)),
                      ),
                    )),
                SizedBox(
                  height: SizeConfig.heightMultiplier! * 2.0,
                ),
                GeneralTextButton(
                  color: true,
                  onPressed: () {},
                  text: "Submit",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
