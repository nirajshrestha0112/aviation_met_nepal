import 'dart:convert';
import 'dart:developer';
import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:aviation_met_nepal/model/airport_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

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
