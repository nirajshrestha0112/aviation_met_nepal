import 'dart:developer';

import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/routes.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/provider/login_provider.dart';
import 'package:aviation_met_nepal/utils/custom_scroll_behavior.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:aviation_met_nepal/utils/validation.dart';
import 'package:aviation_met_nepal/widgets/custom_snackbar.dart';
import 'package:aviation_met_nepal/widgets/general_text_button.dart';
import 'package:aviation_met_nepal/widgets/general_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            "Login",
          )),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: padding, horizontal: padding),
            child: SizedBox(
              height: SizeConfig.heightMultiplier * 100.0,
              width: SizeConfig.widthMultiplier * 100.0,
              child: Form(
                key: formGlobalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      logoOnlyImg,
                      width: SizeConfig.widthMultiplier * 30,
                      // height: SizeConfig.widthMultiplier*30,
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 3.0,
                    ),
                    Text(
                      "Aviation Met Nepal",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 3.5,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 5.0,
                    ),
                    Text("Welcome!",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: SizeConfig.textMultiplier * 3.5,
                            )),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2.0,
                    ),
                    Text("Login to your existing account",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontWeight: FontWeight.normal)),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 3.0,
                    ),
                    GeneralTextField(
                      hintText: "Username",
                      keyboard: TextInputType.text,
                      icons: Icons.person,
                      obscureText: false,
                      controller: _usernameController,
                      validator: (value) => Validations().validateEmail(value!),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2.0,
                    ),
                    GeneralTextField(
                      keyboard: TextInputType.visiblePassword,
                      hintText: "Password",
                      icons: Icons.lock_open_sharp,
                      obscureText: true,
                      controller: _passwordController,
                      validator: (value) =>
                          Validations().validatePassword(value!),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 4.0,
                    ),
                    GeneralTextButton(
                      color: false,
                      text: "Login",
                      onPressed: () async {
                        if (formGlobalKey.currentState!.validate()) {
                          const CircularProgressIndicator.adaptive();
                          await Provider.of<LoginProvider>(context,
                                  listen: false)
                              .loginPostApi(context,
                                  userName: _usernameController.text,
                                  password: _passwordController.text);
                        }
                      },
                      height: SizeConfig.heightMultiplier * 6.0,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
