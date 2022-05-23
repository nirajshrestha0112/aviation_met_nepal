import 'dart:convert';
import 'dart:developer';

import 'package:aviation_met_nepal/constant/constants.dart';
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
          'authorization': accessToken,
        },
      );
      if (response.statusCode == 200) {
        final map = jsonDecode(response.body) as Map;
        map.forEach((key, value) {
          citiesData.add(DatumCities.fromJson(value));

          log(citiesData.toString());
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
  List<WeatherTemperature> weatherTemperatureList = [];
  List<WindDirection> windDirectionList = [];
  List<WindSpeed> windSpeedList = [];
  List<Humidity> humidityList = [];
  List<Rain> rainList = [];
  WeatherForecast? weatherForecastData;

  clear() {
    weatherTemperatureList.clear();
    windDirectionList.clear();
    windSpeedList.clear();
    humidityList.clear();
    rainList.clear();
  }

  Future fetchWeatherForecast({required String id}) async {
    try {
      final url = "$baseUrlCitiesById/$id";
      log(url);

      http.Response response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'authorization': accessToken,
        },
      );
      log(response.body);
      if (response.statusCode == 200) {
        clear();
        final parsedData = jsonDecode(response.body);
        weatherForecastData = WeatherForecast.fromJson(parsedData);

        getDynamicValue(dataKey: "t");

        getDynamicValue(dataKey: "wd");

        getDynamicValue(dataKey: "ws");

        getDynamicValue(dataKey: "hu");

        getDynamicValue(dataKey: "rain06h");

        notifyListeners();
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      log(e.toString());
    }
  }

  List<DateTime> dateList = [];
  dynamic getDynamicValue({required String dataKey}) {
    Map<String, dynamic> tempJsonObject =
        weatherForecastData!.data.params[dataKey];

    tempJsonObject.remove("description");
    log(tempJsonObject.values.toString());
    if (dateList.isEmpty) {
      tempJsonObject.keys.toList().forEach(
        (element) {
          var dateTime =
              "${element.substring(0, 4)}-${element.substring(4, 6)}-${element.substring(6, 8)}T${element.substring(8, 10)}:${element.substring(10, 12)}";
          dateList.add(DateTime.parse(dateTime));
        },
      );
    }

    switch (dataKey) {
      case "wd":
        log("wd");
        for (var value in tempJsonObject.values) {
          windDirectionList.add(WindDirection.fromJson(value));
        }
        break;
      case "t":
        log("t");
        for (var value in tempJsonObject.values) {
          weatherTemperatureList.add(WeatherTemperature.fromJson(value));
        }
        break;
      case 'ws':
        log("ws");
        for (var value in tempJsonObject.values) {
          windSpeedList.add(WindSpeed.fromJson(value));
        }
        break;
      case 'hu':
        log("hu");
        for (var value in tempJsonObject.values) {
          humidityList.add(Humidity.fromJson(value));
        }
        break;
      case 'rain06h':
        log("rain06h");
        for (var value in tempJsonObject.values) {
          rainList.add(Rain.fromJson(value));
        }
        break;
      default:
    }
  }
}
