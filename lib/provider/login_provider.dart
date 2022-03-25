import 'dart:convert';
import 'dart:developer';
import 'package:aviation_met_nepal/constant/constants.dart';
import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:aviation_met_nepal/utils/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  /*  String? username;
  static String? password; */

  String? loginName;
  String? userId;
  String? token;

  Future loginPostApi(
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

        log(response.body);
        token = jsonDecode(response.body)["token"];

        final data = jsonDecode(response.body)["data"];
        loginName = data["LOGIN_NAME"];
        userId = data["USERID"];

        await SecureStorage.writeSecureData(
            key: SecureStorageConstants.token, value: token!);

        /* 
        Future uses =
            SecureStorage.writeSecureData(key: "username", value: userNam);
        log(uses.toString());
        SecureStorage.writeSecureData(key: "password", value: pass);

        username = userNam;
        password = pass; */
      } else {
        // If the server did not return a 200 CREATED response,
        // then throw an exception.
        throw Exception('Failed to login');
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

void clearLoginDetails(){
  
}