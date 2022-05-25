import 'dart:convert';

import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/routes.dart';
import 'package:aviation_met_nepal/provider/login_provider.dart';
import 'package:aviation_met_nepal/utils/custom_scroll_behavior.dart';
import 'package:aviation_met_nepal/utils/validation.dart';
import 'package:aviation_met_nepal/widgets/custom_app_bar.dart';
import 'package:aviation_met_nepal/widgets/custom_snackbar.dart';
import 'package:aviation_met_nepal/widgets/general_text_button.dart';
import 'package:aviation_met_nepal/widgets/general_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../provider/connectivity_provider.dart';
import '../utils/get_device_size.dart';
import '../utils/show_internet_connection_snack_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(text: "Login"),
        body: const LoginScreenBody(),
      ),
    );
  }
}

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
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
                  GeneralTextFormField(
                    hintText: "Username",
                    keyboard: TextInputType.emailAddress,
                    prefixIcons: Icons.person,
                    obscureText: false,
                    controller: _usernameController,
                    validator: (value) => Validations().validateEmail(value!),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  GeneralTextFormField(
                    keyboard: TextInputType.visiblePassword,
                    hintText: "Password",
                    prefixIcons: Icons.lock_open_sharp,
                    obscureText: true,
                    controller: _passwordController,
                    validator: (value) =>
                        Validations().validatePassword(value!),
                  ),
                  SizedBox(height: 20.h),
                  GeneralTextButton(
                    text: "Login",
                    onPressed: () async {
                      if (_formGlobalKey.currentState!.validate()) {
                        if (getIsOnline(context)) {
                          showDialog(
                            context: context,
                            builder: (_) => const Center(
                                child: CircularProgressIndicator.adaptive()),
                          );
                          try {
                            final response = await Provider.of<LoginProvider>(
                                    context,
                                    listen: false)
                                .loginPostApi(context,
                                    userName: _usernameController.text,
                                    password: _passwordController.text);
                            final SnackBar successMessage =
                                CustomSnackBar.customSnackBar(
                                    circleAvatarBgColor: Colors.white,
                                    iconColor: Colors.green,
                                    bgColor: Colors.green,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    message:
                                        jsonDecode(response.body)["message"],
                                    statusText:
                                        jsonDecode(response.body)["status"]
                                            .toString()
                                            .toCapitalized());
                            if (mounted) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(successMessage);

                              Navigator.pushNamedAndRemoveUntil(
                                  context, homeRoute, (route) => false);
                            }
                          } catch (ex) {
                            final SnackBar errorSnackBar =
                                CustomSnackBar.customSnackBar(
                                    message: ex.toString().split(",")[0],
                                    statusText: ex.toString().split(",")[1],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    icon: Icons.close,
                                    bgColor: Colors.red,
                                    circleAvatarBgColor: Colors.white,
                                    iconColor: Colors.red);

                            ScaffoldMessenger.of(context)
                                .showSnackBar(errorSnackBar);
                            Navigator.pop(context);
                          }
                        } else {
                          showInternetConnectionSnackBar(
                              icon: Icons.close,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              bgColor: Colors.red,
                              circleAvatarBgColor: Colors.white,
                              iconColor: Colors.red,
                              statusText: "Error",
                              message: "Server Error...Please Try Again");
                        }
                      }
                    },
                    height: DeviceUtil.isMobile ? 46.h : 56.h,
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
