import 'package:aviation_met_nepal/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/constants.dart';
import '../constant/routes.dart';
import '../provider/login_provider.dart';
import '../widgets/custom_alert_dialog.dart';

void showLogoutAlertDialog(BuildContext context) async {
  await showDialog(
      context: context,
      builder: (context) => const ShowAlertDialogBox(
            title: logoutText,
            message: loggingOutMessage,
          )).then((value) async{
    if (value) {
      Provider.of<LoginProvider>(context, listen: false).clearLoginDetails();
      SecureStorage.deleteAll().then((value) => 

      Navigator.pushNamedAndRemoveUntil(context, homeRoute, (route) => false));
    } else {
      Navigator.pop(context);
    }
  });
}
