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
  List<WeatherTemperature> weatherTemperatureList = [];
  List<WindDirection> windDirectionList = [];
  List<WindSpeed> windSpeedList = [];
  List<Humidity> humidityList = [];
  List<Rain> rainList = [];
  // List<WeatherForecast> weatherForecast = [];
  WeatherForecast? weatherForecastData;

  clear() {
    weatherTemperatureList.clear();
    windDirectionList.clear();
    windSpeedList.clear();
    humidityList.clear();
    rainList.clear();
  }

  fetchWeatherForecast({required String id}) async {
    // try {
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
      clear();
      /* final map = jsonDecode(response.body) as Map;
        map.forEach((key, value) {
          weatherForecast.add(WeatherForecast.fromJson(value));
        }); */

      final parsedData = jsonDecode(response.body);
      weatherForecastData = WeatherForecast.fromJson(parsedData);
      log("data1");
      getDynamicValue(dataKey: "t");
      log("data1");
      log("data2");
      getDynamicValue(dataKey: "wd");
      log("data2");
      log("data3");
      getDynamicValue(dataKey: "ws");
      log("data3");
      log("data4");
      getDynamicValue(dataKey: "hu");
      log("data4");
      log("data5");
      getDynamicValue(dataKey: "rain06h");
      log("data5");
      notifyListeners();
    } else {
      throw jsonDecode(response.body)['message'];
    }
    // } catch (e) {
    //   log(e.toString());
    // }
  }

  List<DateTime> dateList = [];
  dynamic getDynamicValue({required String dataKey}) {
    Map<String, dynamic> tempJsonObject =
        weatherForecastData!.data.params[dataKey];
    // tempJsonObject.remove('description');
    // TODO: parse as a date

    tempJsonObject.remove("description");
    log(tempJsonObject.values.toString());
    // List<String> dateList =
    if (dateList.isEmpty) {
      tempJsonObject.keys.toList().forEach(
        (element) {
          var dateTime =
              "${element.substring(0, 4)}-${element.substring(4, 6)}-${element.substring(6, 8)}T${element.substring(8, 10)}:${element.substring(10, 12)}";
          dateList.add(DateTime.parse(dateTime));
        },
      );
    }
    log(dateList.toString());
    log(tempJsonObject.toString());

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
