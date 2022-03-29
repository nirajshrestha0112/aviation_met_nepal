import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/provider/lighting_data_provider.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class LightingData extends StatefulWidget {
  const LightingData({Key? key}) : super(key: key);

  @override
  State<LightingData> createState() => _LightingDataState();
}

class _LightingDataState extends State<LightingData> {
//   final MapController _mapcontroller = MapController(
//     initMapWithUserPosition: false,
//     initPosition:
//  GeoPoint(latitude: 27.700769, longitude: 85.300140),
//   );
  @override
  void initState() {
    Provider.of<LightingDataProvider>(context, listen: false)
        .fetchLightingData();

    super.initState();
  }

  @override
  void dispose() {
    // _mapcontroller.dispose();
    super.dispose();
  }

  static const LatLng _center = LatLng(23.7351, 85.3612);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: SizeConfig.imageSizeMultiplier * 8.0,
              color: textColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Lighting Data",
          style: TextStyle(
              color: textColor,
              fontSize: SizeConfig.textMultiplier * 2.5,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Consumer<LightingDataProvider>(builder: (_, value, __) {
        return GoogleMap(
          
          zoomControlsEnabled: false,
          markers: value.markers,
          
          initialCameraPosition: const CameraPosition(

            target: _center,
            zoom: 5.0,
          ),
        );
      }),
    );
  }
}
