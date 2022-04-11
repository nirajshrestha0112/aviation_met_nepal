import 'dart:convert';
import 'dart:developer';

import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:aviation_met_nepal/model/sigmets_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SigmetsDataProvider extends ChangeNotifier {
  SigmetsData? sigmetsData;
  // get sigmetsData=>sigmetsData;
  postSigmetsData({
    required String ident,
  }) async {
    try {
      sigmetsData = null;
      final url = Uri.parse(sigmetsDataUrl);
      log(url.toString());
      http.Response response = await http.post(url, body: {'domain': ident});
      log(response.body);
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == false) {
          throw jsonDecode(response.body)['message'];
        }
        sigmetsData = SigmetsData.fromJson(jsonDecode(response.body));
        log(sigmetsData.toString());
        // 2
        // notifyListeners();
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
