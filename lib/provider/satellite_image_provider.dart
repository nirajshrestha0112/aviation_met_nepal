import 'dart:convert';
import 'dart:developer';

import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:aviation_met_nepal/model/satellite_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SatelliteImageProvider extends ChangeNotifier {
  SatelliteImageData? satelliteImageData;
  postSatelliteImageDataData() async {
    try {
      final url = Uri.parse(satelliteImageDataUrl);
      Map<String, String> requestBody = <String, String>{
        "satellite": "1",
        "category": "1",
        "sub_category": "1"
      };
      log(url.toString());
      http.Response response = await http.post(url, body: requestBody);
      log(response.body);
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == false) {
          throw jsonDecode(response.body)['message'];
        }
        if (jsonDecode(response.body)['data'] == false) {
          throw jsonDecode(response.body)['message'];
        }
        satelliteImageData =
            SatelliteImageData.fromJson(jsonDecode(response.body));
        log(satelliteImageData.toString());
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
