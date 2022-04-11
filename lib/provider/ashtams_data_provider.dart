import 'dart:convert';
import 'dart:developer';

import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/ashtams_data.dart';

class AshtamsDataProvider extends ChangeNotifier {
  AshtamsData? ashtamsData;
  fetchAshtamsData() async {
    try {
      final url = Uri.parse(ashtamsDataUrl);
      log(url.toString());
      http.Response response = await http.get(url);
      log(response.body);
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == false) {
          throw jsonDecode(response.body)['message'];
        }
        ashtamsData = AshtamsData.fromJson(jsonDecode(response.body));
        log(ashtamsData.toString());
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
