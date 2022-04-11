import 'dart:convert';
import 'dart:developer';
import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:aviation_met_nepal/model/airmet_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class AirmetDataProvider extends ChangeNotifier {
  AirMetData? airmetData;
  fetchAirmetData() async {
    try {
      final url = Uri.parse(airmetDataUrl);
      log(url.toString());
      http.Response response = await http.get(url);
      log(response.body);
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == false) {
          throw jsonDecode(response.body)['message'];
        }
        airmetData = AirMetData.fromJson(jsonDecode(response.body));
        log(airmetData.toString());
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
