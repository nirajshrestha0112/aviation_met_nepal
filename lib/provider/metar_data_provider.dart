import 'dart:convert';
import 'dart:developer';
import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/matar_data_raw_model.dart';
import '../model/metar_data_decoded_model.dart';

class MetarDataProvider extends ChangeNotifier {
  late MetarDataRaw metarDataRaw;
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
        log(metarDataRaw.toJson().toString());
        notifyListeners();
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  late MetarDataDecoded metarDataDecoded;
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
        metarDataDecoded = MetarDataDecoded.fromJson(jsonDecode(response.body));
        log(metarDataDecoded.toJson().toString());
        notifyListeners();
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      log(e.toString());
    }
  }
}