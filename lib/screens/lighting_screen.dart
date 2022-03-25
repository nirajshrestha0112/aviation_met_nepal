import 'package:aviation_met_nepal/constant/colors.dart';
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
  final Completer<GoogleMapController> _controller = Completer();
  final MapController _mapcontroller = MapController(
    initMapWithUserPosition: false,
    initPosition: GeoPoint(latitude: 27.700769, longitude: 85.300140),
  );

  @override
  void initState() {
    Provider.of<LightingDataProvider>(context, listen: false)
        .fetchLightingData();
    super.initState();
  }

  @override
  void dispose() {
    _mapcontroller.dispose();
    super.dispose();
  }

  static const LatLng _center = const LatLng(23.7351, 85.3612);

  final Set<Marker> _markers = {};

  LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;

  /*  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  } */

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
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
      body: GoogleMap(
        // onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: _center,
          zoom: 5.0,
        ),
        // mapType: _currentMapType,
        /* markers: _markers,
        onCameraMove: _onCameraMove, */
      ),

      /* OSMFlutter(
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
      ), */
    );
  }
}
