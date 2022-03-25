import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/routes.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:aviation_met_nepal/utils/validation.dart';
import 'package:aviation_met_nepal/widgets/general_text_button.dart';
import 'package:aviation_met_nepal/widgets/general_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
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
                    child: Image.asset(cloudyImg, scale: 6.0),
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
                   GeneralTextField(
                    hintText: "Username",
                    keyboard: TextInputType.text,
                    icons: Icons.person,
                    obscureText: false,
                    controller: _usernameController,
                    validator: (value)=>Validations().validateEmail(value!),
                    
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier! * 2.0,
                  ),
                   GeneralTextField(
                    keyboard: TextInputType.visiblePassword,
                    hintText: "Password",
                    icons: Icons.lock_open_sharp,
                    obscureText: true,
                    controller: _passwordController,
                    validator: (value)=>Validations().validatePassword(value!),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier! * 4.0,
                  ),
                  GeneralTextButton(
                    color: false,
                    text: "Login",
                    onPressed: () {
                      if(formGlobalKey.currentState!.validate()){
                        CircularProgressIndicator.adaptive();
                        
                      }
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
