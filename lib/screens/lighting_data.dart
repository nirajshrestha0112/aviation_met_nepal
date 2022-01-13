import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class LightingData extends StatefulWidget {
  const LightingData({Key? key}) : super(key: key);

  @override
  State<LightingData> createState() => _LightingDataState();
}

class _LightingDataState extends State<LightingData> {
  final MapController _mapcontroller = MapController(
    initMapWithUserPosition: false,
    initPosition: GeoPoint(latitude: 27.700769, longitude: 85.300140),
  );
  @override
  void dispose() {
    _mapcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: SizeConfig.imageSizeMultiplier! * 8.0,
              color: textColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Lighting Data",
          style: TextStyle(
              color: textColor,
              fontSize: SizeConfig.textMultiplier! * 2.5,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: OSMFlutter(
        controller: _mapcontroller,
        trackMyPosition: false,
        initZoom: 12,
        minZoomLevel: 8,
        maxZoomLevel: 19,
        stepZoom: 1.0,
        markerOption: MarkerOption(
            defaultMarker: const MarkerIcon(
          icon: Icon(
            Icons.person_pin_circle,
            color: Colors.blue,
            size: 56,
          ),
        )),
      ),
    );
  }
}
