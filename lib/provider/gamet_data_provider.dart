import 'dart:convert';
import 'dart:developer';
import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/gamet_data_model.dart';

class GametDataProvider extends ChangeNotifier {
   GametData ?gametData;
  fetchGametData() async {
    try {
      final url = Uri.parse(gametDataUrl);
      log(url.toString());
      http.Response response = await http.get(url);
      log(response.body);
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == false) {
          throw jsonDecode(response.body)['message'];
        }
        gametData = GametData.fromJson(jsonDecode(response.body));
        log(gametData.toString());
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
