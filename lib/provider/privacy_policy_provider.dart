import 'dart:convert';
import 'dart:developer';
import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:aviation_met_nepal/model/privacy_policy_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

class PrivacyPolicyProvider extends ChangeNotifier {
  PrivacyPolicy? privacyPolicyData;
  String? privacyTitle;
  String? privacyTitleNp;
  fetchPrivacyPolicyData() async {
    try {
      final url = Uri.parse(privacyPolicyUrl);
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == false) {
          throw jsonDecode(response.body)['message'];
        }
        privacyPolicyData = PrivacyPolicy.fromJson(jsonDecode(response.body));
        privacyTitle =
            parseHtmlString(privacyPolicyData!.data[0].policyDetails);
        privacyTitleNp =
            parseHtmlString(privacyPolicyData!.data[0].policyDetailsNp);
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      log(e.toString());
    }
  }

  String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;
    return parsedString;
  }
}
