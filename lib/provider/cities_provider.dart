import 'dart:convert';
import 'dart:developer';
import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:aviation_met_nepal/model/cities_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CitiesProvider extends ChangeNotifier {
  List<DatumCities> citiesData = [];
  List<DatumCities> searchWeatherForecastData = [];
  fetchCitiesData() async {
    try {
      const url = "https://webapiserver.dhm.gov.np/api/cities?domain=Nepal";
      log(url);

      http.Response response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'authorization': "Basic ZGhtOk1maURITTIwMjEk",
        },
      );
      log(response.body);
      if (response.statusCode == 200) {
        final map = jsonDecode(response.body) as Map;
        map.forEach((key, value) {
          citiesData.add(DatumCities.fromJson(value));
        });

        log(citiesData.toString());
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void filterSearchWeatherForecastResults(String query) {
    if (query.isEmpty) {
      searchWeatherForecastData = [...citiesData];
    } else {
      searchWeatherForecastData = citiesData
          .where((element) => element.description.toLowerCase().contains(
                query.toLowerCase(),
              ))
          .toList();
    }
    notifyListeners();
  }
}
