import 'dart:convert';
import 'dart:developer';

import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:aviation_met_nepal/model/cities.dart';
import 'package:aviation_met_nepal/model/weather_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CitiesProvider extends ChangeNotifier {
  List<DatumCities> citiesData = [];
  List<DatumCities> searchWeatherForecastData = [];

  fetchCitiesData() async {
    try {
      final url = Uri.parse(baseUrlCities);
      log(url.toString());
      http.Response response = await http.get(
        url,
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
        searchWeatherForecastData = [...citiesData];
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

class WeatherForecastProvider extends ChangeNotifier {
  List<WeatherForecast> weatherForecastList = [];
  List<WindDirection> windDirectionList = [];
  // List<WeatherForecast> weatherForecast = [];
  WeatherForecast? weatherForecastData;
  fetchWeatherForecast({required String id}) async {
    try {
      final url = "http://webapiserver.dhm.gov.np/api/forecastbypoi/id/$id";
      log(url);

      http.Response response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'authorization': "Basic ZGhtOk1maURITTIwMjEk",
        },
      );
      log(response.body);
      if (response.statusCode == 200) {
        /* final map = jsonDecode(response.body) as Map;
        map.forEach((key, value) {
          weatherForecast.add(WeatherForecast.fromJson(value));
        }); */
        final parsedData = jsonDecode(response.body);
        weatherForecastData = WeatherForecast.fromJson(parsedData);
        weatherForecastList = getDynamicValue(dataKey: "t");
        windDirectionList = getDynamicValue(dataKey: "wd");
        log(weatherForecastData.toString());
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      log(e.toString());
    }
  }

  List<String>? dateList;
  getDynamicValue({required String dataKey}) {
    Map<String, dynamic> tempJsonObject =
        weatherForecastData!.data.params[dataKey];
    // tempJsonObject.remove('description');
    // TODO: parse as a date
    tempJsonObject.remove("description");
    List<String> dateList = tempJsonObject.keys.toList();

    switch (dataKey) {
      case "wd":
        return tempJsonObject.entries.map((entry) {
          return WindDirection.fromJson(entry.value);
        }).toList();
      case "t":
        return tempJsonObject.entries.map((entry) {
          return WeatherForecast.fromJson(entry.value);
        }).toList();

      default:
    }

    print(dateList.last);
  }
}
