import 'dart:convert';
import 'dart:developer';

import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/matar_data_raw.dart';
import '../model/metar_data_decoded.dart';

class MetarDataProvider extends ChangeNotifier {
  MetarDataRaw? metarDataRaw;
  fetchMetarDataRaw({
    required String ident,
    required String filteredData,
  }) async {
    try {
      final url = Uri.parse(metaDataRawUrl + ident + "/" + filteredData);
      log(url.toString());
      http.Response response = await http.get(url);
      log(response.body);
      if (response.statusCode == 200) {
        metarDataRaw = MetarDataRaw.fromJson(jsonDecode(response.body));
        log(metarDataRaw!.toJson().toString());
        notifyListeners();
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      log(e.toString());
    }
  }

   MetarDataDecoded? metarDataDecoded;
  fetchMetarDataDecoded({
    required String ident,
    required String filteredData,
  }) async {
    try {
      final url = Uri.parse(metaDataDecodedUrl + ident + "/" + filteredData);
      log(url.toString());
      http.Response response = await http.get(url);
      log(response.body);
      
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == 'error') {
          jsonDecode(response.body)['message'];
        }
        metarDataDecoded = MetarDataDecoded.fromJson(jsonDecode(response.body));
        log(metarDataDecoded!.toJson().toString());
        notifyListeners();
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
