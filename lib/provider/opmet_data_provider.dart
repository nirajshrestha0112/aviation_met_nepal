import 'dart:convert';
import 'dart:developer';

import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:aviation_met_nepal/model/opmet_data.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class OpmetDataProvider extends ChangeNotifier {
  OpmetData? opmetData;
  fetchOpmetData() async {
    try {
      final url = Uri.parse(opmetDataUrl);
      log(url.toString());
      // final duration = DateTime.now();
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == false) {
          throw jsonDecode(response.body)['message'];
        }
        opmetData = await compute(parsedOpmetData, response.body);

        // opmetData = OpmetData.fromJson(jsonDecode(response.body));
        // log(DateTime.now().difference(duration).inMilliseconds.toString());
        log(opmetData.toString());
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

OpmetData parsedOpmetData(String response) {
  OpmetData? parsedOpmetData;
  parsedOpmetData = OpmetData.fromJson(jsonDecode(response));
  return parsedOpmetData;
}
