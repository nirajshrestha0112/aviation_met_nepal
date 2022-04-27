import 'dart:convert';
import 'dart:developer';

import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:aviation_met_nepal/model/tafs_decoded.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/tafs_raw.dart';

class TafsDataProvider extends ChangeNotifier {
  TafsDataRaw? tafsDataRaw;
  late String id;
  fetchTafsDataRaw({
    required String ident,
  }) async {
    if (tafsDataRaw == null) {
      id = ident;
      await addTafsRawData(ident: ident);
    } else if (id != ident) {
      id = ident;
      await addTafsRawData(ident: id);
    }
  }

  addTafsRawData({
    required String ident,
  }) async {
    try {
      final url = Uri.parse(tafsRawUrl + ident);
      log(url.toString());
      http.Response response = await http.get(url);
      log(response.body);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == 'error') {
          throw jsonDecode(response.body)['message'];
        }
        tafsDataRaw = TafsDataRaw.fromJson(jsonDecode(response.body));
        log(tafsDataRaw!.toJson().toString());
        // notifyListeners();
      } else {
        throw jsonDecode(response.body)['messsage'];
      }
    } catch (e) {
      log(e.toString());
    }
  }

  TafsDataDecoded? tafsDataDecoded;
  fetchTafsDataDecoded({required String ident}) async {
    if (tafsDataDecoded == null) {
      id = ident;
      await addTafsDecodedData(ident: ident);
    } else if (id != ident) {
      id = ident;
      await addTafsRawData(ident: id);
    }
  }

  addTafsDecodedData({required String ident}) async {
    try {
      final url = Uri.parse(tafsDecodedUrl + ident);
      log(url.toString());
      http.Response response = await http.get(url);
      log(response.body);
      if (response.statusCode == 200) {
        tafsDataDecoded = TafsDataDecoded.fromJson(jsonDecode(response.body));
        log(tafsDataDecoded!.toJson().toString());
        // notifyListeners();
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
