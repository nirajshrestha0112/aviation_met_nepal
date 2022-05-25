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
  String? loginName;
  String? userId;
  String? token;

  Future loginPostApi(BuildContext context,
      {required String userName, required String password}) async {
    try {
      final url = Uri.parse(loginUrl);
      log(url.toString());
      Map<String, String> requestBody = <String, String>{
        "USERNAME": userName,
        "PASSWORD": password,
      };
      final http.Response response = await http.post(url, body: requestBody);
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)["status"] == "error") {
          throw jsonDecode(response.body)["message"] +
              " ," +
              jsonDecode(response.body)["status"].toString().toCapitalized();
        } else {
          log(response.body);
          token = jsonDecode(response.body)["token"];

          final data = jsonDecode(response.body)["data"];
          loginName = data["LOGIN_NAME"];
          userId = data["USERID"];

          await writeInSecureStorage(userId ?? "", loginName ?? "");
          return response;
        }
      } else {
        throw 'Server Error!!!, 500';
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  writeInSecureStorage(
    String userId,
    String loginName,
  ) async {
    await SecureStorage.writeSecureData(
        key: SecureStorageConstants.token, value: token!);
    await SecureStorage.writeSecureData(
        key: SecureStorageConstants.userId, value: userId);
    await SecureStorage.writeSecureData(
        key: SecureStorageConstants.loginName, value: loginName);
  }

  removeFromSecureStorage() async {
    await SecureStorage.deleteAll();
  }

  Future<void> readFromSecureStorage() async {
    if (await SecureStorage.containsSecureData(
        key: SecureStorageConstants.token)) {
      loginName = await SecureStorage.readSecureData(
          key: SecureStorageConstants.loginName);
      userId = await SecureStorage.readSecureData(
          key: SecureStorageConstants.userId);
      token =
          await SecureStorage.readSecureData(key: SecureStorageConstants.token);
    }
    notifyListeners();
  }

  void clearLoginDetails() async {
    loginName = null;
    userId = null;
    notifyListeners();
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
