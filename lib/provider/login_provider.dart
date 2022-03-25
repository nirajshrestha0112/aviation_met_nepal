/* import 'dart:convert';
import 'dart:developer';

import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:waitress_app/constant/urls.dart';
import 'package:http/http.dart' as http;
import 'package:waitress_app/provider/secure_storage.dart';

String? username;
String? password;

class LoginProvider extends ChangeNotifier {
  /*  String? username;
  static String? password; */

  Future loginPostApi({required String userName, required String password}) async {
    try {
     
      final response = await http.post(
        Uri.parse(loginUrl,body),
       
      );
      if (response.statusCode == 200) {
        // If the server did return a 200 CREATED response,
        // then parse the JSON.
        Future uses =
            SecureStorage.writeSecureData(key: "username", value: userNam);
        log(uses.toString());
        SecureStorage.writeSecureData(key: "password", value: pass);

        username = userNam;
        password = pass;
      } else {
        // If the server did not return a 200 CREATED response,
        // then throw an exception.
        throw Exception('Failed to create load');
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
 */