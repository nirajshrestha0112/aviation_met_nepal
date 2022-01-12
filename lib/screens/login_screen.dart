import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/routes.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:aviation_met_nepal/widgets/general_text_button.dart';
import 'package:aviation_met_nepal/widgets/general_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back,
              size: SizeConfig.imageSizeMultiplier! * 8.0, color: textColor),
        ),
        title: Text(
          "Login",
          style: TextStyle(
              fontSize: SizeConfig.textMultiplier! * 2.3, color: textColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: padding, horizontal: padding),
          child: SizedBox(
            height: SizeConfig.heightMultiplier! * 100.0,
            width: SizeConfig.widthMultiplier! * 100.0,
            child: Form(
              key: formGlobalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: SizeConfig.heightMultiplier! * 16.0,
                    width: SizeConfig.widthMultiplier! * 35.0,
                    color: Colors.white,
                    child: Image.asset(cloudyImg, scale: 6),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier! * 3.0,
                  ),
                  Text(
                    "Aviation Met Nepal",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: SizeConfig.textMultiplier! * 3.5,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier! * 5.0,
                  ),
                  Text(
                    "Welcome!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: SizeConfig.textMultiplier! * 3.5,
                        color: textColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier! * 2.0,
                  ),
                  Text(
                    "Login to your existing account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: SizeConfig.textMultiplier! * 2.0,
                        color: searchColor,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier! * 3.0,
                  ),
                  const GeneralTextField(
                    hintText: "Username",
                    icons: Icons.person,
                    obscureText: false,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier! * 2.0,
                  ),
                  const GeneralTextField(
                    hintText: "Password",
                    icons: Icons.lock_open_sharp,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier! * 4.0,
                  ),
                  GeneralTextButton(
                    color: false,
                    text: "Login",
                    onPressed: () {
                      Navigator.pushNamed(context, homeScreen);
                    },
                    height: SizeConfig.heightMultiplier! * 6.0,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
