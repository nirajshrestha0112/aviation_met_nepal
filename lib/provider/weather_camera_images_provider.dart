import 'dart:convert';
import 'dart:developer';

import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/weather_camera_images.dart';

class WeatherCameraImagesProvider extends ChangeNotifier {
  List<WeatherCameraImages> weatherCameraImagesData = [];
  List<WeatherCameraImages> searchWeatherCameraImagesData = [];
  WeatherCameraImages? weatherCameraImagesDetails;

  fetchWeatherCameraImagesData() async {
    if (weatherCameraImagesData.isEmpty) {
      try {
        // debugger()
;        final url = Uri.parse(weatherCameraImagesUrl);
        log(url.toString());
        http.Response response = await http.get(url);

        if (response.statusCode == 200) {
          final obj = jsonDecode(response.body);

          for (var i in obj) {
            weatherCameraImagesData.add(WeatherCameraImages.fromJson(i));
          }
        // debugger();

          log( weatherCameraImagesData.toString());
          searchWeatherCameraImagesData = [...weatherCameraImagesData];
        } else {
          throw Exception("Failed to load data");
        }
      } catch (e) {
        rethrow;
      }
    } else {
      searchWeatherCameraImagesData.clear();
      searchWeatherCameraImagesData = [...weatherCameraImagesData];
    }
  }

  void filterWeatherCameraImages(String query) {
    // searchWeatherCameraImagesData.clear();

    if (query.isEmpty) {
      searchWeatherCameraImagesData = [...weatherCameraImagesData];
      log(searchWeatherCameraImagesData.toString());
    } else {
      searchWeatherCameraImagesData = weatherCameraImagesData
          .where((element) =>
              element.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
