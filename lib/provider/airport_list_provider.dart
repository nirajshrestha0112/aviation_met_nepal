import 'dart:convert';
import 'dart:developer';

import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:aviation_met_nepal/model/airport_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

/* class AviationProvider extends ChangeNotifier {
  List<String> data = [];
  Future fetchApi() async {
    String userName = "dhm";
    String password = "MfiDHM2021\$";
    String basAuth =
        'Basic ' + base64Encode(utf8.encode('$userName:$password'));
    try {
      http.Response response = await http.get(
          Uri.parse("https://webapiserver.dhm.gov.np/api/cities"),
          headers: <String, String>{'authorization': basAuth});
      //
      if (response.statusCode == 200) {
        // log(jsonDecode(response.body).toString());
        data.add(jsonDecode(response.body).toString());
        // log(data.toString());
        // return data;
      } else {
        throw Exception("Failed to load");
      }
    } catch (e) {
      e.toString();
    }
  }

  List<Airport> airportDataList = [];
  Future fetchData() async {
    if (airportDataList.isNotEmpty) {
      return;
    }
    final url = Uri.parse("https://hydrology.gov.np/gss/api/station");

    final response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      log("Success");
      final parsed = json.decode(response.body);
      airportDataList =
          parsed.map<Airport>((json) => Airport.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load");
    }
  }
} */

class AirportListProvider extends ChangeNotifier {
  List<Data> searchData = [];
  AirportList? airportData;
  fetchAirportList() async {
    try {
      final url = Uri.parse(airporListUrl);
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        airportData = AirportList.fromJson(jsonDecode(response.body));
        searchData = [...?airportData!.data];
        return searchData;
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      searchData = [...?airportData!.data];
    } else {
      searchData = airportData!.data!
          .where((element) =>
              element.name.toLowerCase().contains(
                    query.toLowerCase(),
                  ) ||
              element.ident.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
