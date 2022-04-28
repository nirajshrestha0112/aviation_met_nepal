import 'dart:convert';
import 'dart:developer';

import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/metar_data_raw.dart';
import '../model/metar_data_decoded.dart';
/* 
MetarDataRaw parsedMetarDataRaw(String response) {
  log("message");
  // MetarDataRaw _parsedMetaDataRaw;
  MetarDataRaw _parsedMetaDataRaw = MetarDataRaw.fromJson(jsonDecode(response));
  return _parsedMetaDataRaw;
}

MetarDataDecoded parsedMetaDataDecoded(String response) {
  log("decoded");

  // MetarDataDecoded? _parsedMetarDataDecoded;
  MetarDataDecoded _parsedMetarDataDecoded =
      MetarDataDecoded.fromJson(jsonDecode(response));
  return _parsedMetarDataDecoded;
} */

class MetarDataProvider extends ChangeNotifier {
  MetarDataRaw? metarDataRaw;
  late String rawId;
  late String decodedId;
  fetchMetarDataRaw(
      {required String ident,
      required String filteredData,
      bool shouldLoadRaw = false}) async {
    if (metarDataRaw == null) {
      rawId = ident;
      // id = id
      await addRawData(ident: ident, filteredData: filteredData);
    } else if (shouldLoadRaw) {
      await addRawData(ident: ident, filteredData: filteredData);
    } else if (rawId != ident) {
      rawId = ident;
      await addRawData(ident: rawId, filteredData: filteredData);
    }
    //
  }

  addRawData({
    required String ident,
    required String filteredData,
  }) async {
    try {
      final url = Uri.parse(metaDataRawUrl + ident + "/" + filteredData);
      log(url.toString());
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        // metarDataRaw = await compute(parsedMetarDataRaw, response.body);
        metarDataRaw = MetarDataRaw.fromJson(jsonDecode(response.body));
        log((metarDataRaw?.data?.raw?.length ?? 0).toString());

        notifyListeners();
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      // log(e.toString());
      metarDataRaw = null;
    }
  }

  MetarDataDecoded? metarDataDecoded;
  fetchMetarDataDecoded(
      {required String ident,
      required String filteredData,
      bool shouldLoadDecoded = false}) async {
    // log(ident + "is ident");
    if (metarDataDecoded == null) {
      decodedId = ident;
      await addDecodedData(ident: ident, filteredData: filteredData);
      // log("add empty data");
    } else if (shouldLoadDecoded) {
      log("true");
      await addDecodedData(ident: ident, filteredData: filteredData);
      // log("added filter dataa");
    } else if (decodedId != ident) {
      decodedId = ident;
      await addDecodedData(ident: decodedId, filteredData: filteredData);
      /* log(decodedId);
      log("out of metartab"); */
    }
  }

  addDecodedData({
    required String ident,
    required String filteredData,
  }) async {
    try {
      final url = Uri.parse(metaDataDecodedUrl + ident + "/" + filteredData);
      log(url.toString());
      http.Response response = await http.get(url);
// debugger();
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == 'error') {
          jsonDecode(response.body)['message'];
        }
        // metarDataDecoded = await compute(parsedMetaDataDecoded, response.body);
        metarDataDecoded = MetarDataDecoded.fromJson(jsonDecode(response.body));
        notifyListeners();
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      log(e.toString());
      metarDataDecoded = null;
    }
  }
}
