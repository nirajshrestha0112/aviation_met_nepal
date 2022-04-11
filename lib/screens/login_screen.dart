import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/provider/login_provider.dart';
import 'package:aviation_met_nepal/utils/custom_scroll_behavior.dart';
import 'package:aviation_met_nepal/utils/validation.dart';
import 'package:aviation_met_nepal/widgets/general_icon.dart';
import 'package:aviation_met_nepal/widgets/general_text_button.dart';
import 'package:aviation_met_nepal/widgets/general_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_loading_indicator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const GeneralIcon(),
          leadingWidth: 1.w,
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
              height: MediaQuery.of(context).size.height * 100,
              width: MediaQuery.of(context).size.width * 100,
              child: Form(
                key: _formGlobalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      logoOnlyImg,
                      width: 100.w,
                      // height: SizeConfig.widthMultiplier*30,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Aviation Met Nepal",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Welcome!",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 24.sp,
                            )),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Login to your existing account",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontWeight: FontWeight.normal)),
                    SizedBox(
                      height: 20.h,
                    ),
                    GeneralTextField(
                      hintText: "Username",
                      keyboard: TextInputType.emailAddress,
                      icons: Icons.person,
                      obscureText: false,
                      controller: _usernameController,
                      validator: (value) => Validations().validateEmail(value!),
                    ),
                    SizedBox(
                      height: 12.h,
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
                    SizedBox(height: 20.h),
                    GeneralTextButton(
                      color: false,
                      text: "Login",
                      onPressed: () async {
                        if (_formGlobalKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (_) => const CustomLoadingIndicator(),
                          );
                          await Future.delayed(const Duration(seconds: 3));
                          await Provider.of<LoginProvider>(context,
                                  listen: false)
                              .loginPostApi(context,
                                  userName: _usernameController.text,
                                  password: _passwordController.text);
                        }
                      },
                      height: 40.h,
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
