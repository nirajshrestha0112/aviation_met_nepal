import 'package:aviation_met_nepal/provider/lighting_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:provider/provider.dart';

class LightingData extends StatefulWidget {
  const LightingData({Key? key}) : super(key: key);

  @override
  State<LightingData> createState() => _LightingDataState();
}

class _LightingDataState extends State<LightingData> {
  @override
  void initState() {
    Provider.of<LightingDataProvider>(context, listen: false)
        .fetchLightingData();

    super.initState();
  }

  static const LatLng _center = LatLng(23.7351, 85.3612);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            child: Icon(
              Icons.adaptive.arrow_back,
            ),
            onTap: () {
              Navigator.pop(context);
            }),
        title: const Text(
          "Lighting Data",
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
