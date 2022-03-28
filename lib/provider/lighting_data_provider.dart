import 'dart:convert';
import 'dart:developer';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:aviation_met_nepal/model/lighting_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class LightingDataProvider extends ChangeNotifier {
  LightingData? lightingData;

  Set<Marker> markers = {};
  Future fetchLightingData() async {
    try {
      final url = Uri.parse(lightingDataUrl);
      log(url.toString());
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        markers={};
        if (jsonDecode(response.body)['status'] == false) {
          throw jsonDecode(response.body)['message'];
        }
        lightingData = LightingData.fromJson(jsonDecode(response.body));
        final icon = await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(12, 12)), lightingImg);
        for (var data in lightingData!.data) {
          for (var eachData in data) {
            markers.add(
              Marker(
                markerId: MarkerId(eachData.date),
                icon: icon,
                position: LatLng(
                  double.parse(eachData.latitude),
                  double.parse(eachData.longitude),
                ),
              ),
            );
          }
        }
        print("object");
        notifyListeners();
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
