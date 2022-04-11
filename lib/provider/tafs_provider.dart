import 'dart:convert';
import 'dart:developer';

import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:aviation_met_nepal/model/tafs_decoded.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/tafs_raw.dart';

class TafsDataProvider extends ChangeNotifier {
  TafsDataRaw? tafsDataRaw;
  fetchTafsDataRaw({
    required String ident,
  }) async {
    try {
      final url = Uri.parse(tafsRawUrl + ident);
      log(url.toString());
      http.Response response = await http.get(url);
      log(response.body);
      if (response.statusCode == 200) {
        tafsDataRaw = TafsDataRaw.fromJson(jsonDecode(response.body));
        log(tafsDataRaw!.toJson().toString());
        // notifyListeners();
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  late TafsDataDecoded tafsDataDecoded;
  fetchTafsDataDecoded({
    required String ident,
  }) async {
    try {
      final url = Uri.parse(tafsDecodedUrl + ident);
      log(url.toString());
      http.Response response = await http.get(url);
      log(response.body);
      if (response.statusCode == 200) {
        tafsDataDecoded = TafsDataDecoded.fromJson(jsonDecode(response.body));
        log(tafsDataDecoded.toJson().toString());
        // notifyListeners();
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
