import 'dart:convert';
import 'dart:developer';
import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:aviation_met_nepal/model/lighting_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LightingDataProvider extends ChangeNotifier {
  LightingData? lightingData;
  fetchLightingData() async {
    try {
      final url = Uri.parse(lightingDataUrl);
      log(url.toString());
      http.Response response = await http.get(url);
      log(response.body);
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == false) {
          throw jsonDecode(response.body)['message'];
        }
        lightingData = LightingData.fromJson(jsonDecode(response.body));
        log(lightingData.toString());
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
