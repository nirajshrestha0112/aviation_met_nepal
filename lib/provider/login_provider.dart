import 'dart:convert';
import 'dart:developer';
import 'package:aviation_met_nepal/constant/constants.dart';
import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:aviation_met_nepal/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constant/routes.dart';
import '../widgets/custom_snackbar.dart';

class LoginProvider extends ChangeNotifier {
  /*  String? username;
  static String? password; */

  String? loginName;
  String? userId;
  String? token;

  Future loginPostApi(BuildContext context,
      {required String userName, required String password}) async {
    try {
      final url = Uri.parse(loginUrl);
      log(url.toString());
      Map<String, String> _requestBody = <String, String>{
        "USERNAME": userName,
        "PASSWORD": password,
      };
      final http.Response response = await http.post(url, body: _requestBody);
      log(response.body);
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)["status"] == "error") {
          final SnackBar errorSnackBar = CustomSnackBar.customSnackBar(
              message: jsonDecode(response.body)["message"],
              statusText: jsonDecode(response.body)["status"],
              icon: Icons.close,
              bgColor: Colors.red,
              iconColor: Colors.red);

          ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
        } else {
          log(response.body);
          token = jsonDecode(response.body)["token"];

          final data = jsonDecode(response.body)["data"];
          loginName = data["LOGIN_NAME"];
          userId = data["USERID"];
          final SnackBar successMessage = CustomSnackBar.customSnackBar(
              message: jsonDecode(response.body)["message"],
              statusText: jsonDecode(response.body)["status"]);
          ScaffoldMessenger.of(context).showSnackBar(successMessage);
          await SecureStorage.writeSecureData(
              key: SecureStorageConstants.token, value: token!);
          Navigator.pushNamed(context, homeScreen);
        }
      } else {
        final SnackBar errorSnackBar = CustomSnackBar.customSnackBar(
            message: "Server Error!!!", statusText: "500");
        ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);

        throw Exception('Failed to login');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void clearLoginDetails() {
    loginName = null;
    userId = null;
    notifyListeners();
  }
}
