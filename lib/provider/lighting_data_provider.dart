import 'dart:convert';
import 'dart:developer';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:aviation_met_nepal/model/lighting_data_model.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class LightingDataProvider extends ChangeNotifier {
  LightingData? lightingData;
  Set<Marker> markers = {};
  Future fetchLightingData() async {
    try {
      final url = Uri.parse(lightingDataUrl);
      log(url.toString());
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == false) {
          throw jsonDecode(response.body)['message'];
        }
        lightingData = LightingData.fromJson(jsonDecode(response.body));

        final Uint8List markerIcon = await getBytesFromAsset(
            lightingImg, (SizeConfig.imageSizeMultiplier * 10).toInt());

        for (var data in lightingData!.data) {
          for (var eachData in data) {
            markers.add(Marker(
                icon: BitmapDescriptor.fromBytes(markerIcon),
                markerId: MarkerId(eachData.date.toString()),
                infoWindow: InfoWindow(
                    title: DateFormat("yyyy-MM-dd").format(eachData.date)),
                position: LatLng(
                  double.parse(eachData.latitude),
                  double.parse(eachData.longitude),
                )));
          }
        }

        notifyListeners();
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}
