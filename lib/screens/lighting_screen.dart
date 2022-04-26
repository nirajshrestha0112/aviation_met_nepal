import 'package:aviation_met_nepal/provider/lighting_data_provider.dart';
import 'package:aviation_met_nepal/widgets/general_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class LightingData extends StatelessWidget {
  const LightingData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GeneralIcon(),
        title: Padding(
          padding: EdgeInsets.only(bottom: 4.h),
          child: const Text(
            "Lighting Data",
          ),
        ),
      ),
      body: const LightingScreenBody(),
    );
  }
}

class LightingScreenBody extends StatefulWidget {
  const LightingScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  State<LightingScreenBody> createState() => _LightingScreenBodyState();
}

class _LightingScreenBodyState extends State<LightingScreenBody> {
  static const LatLng _center = LatLng(23.7351, 85.3612);

  @override
  void initState() {
    Provider.of<LightingDataProvider>(context, listen: false)
        .fetchLightingData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LightingDataProvider>(builder: (_, value, __) {
      return GoogleMap(
        zoomControlsEnabled: false,
        markers: value.markers,
        myLocationButtonEnabled: false,
        initialCameraPosition: const CameraPosition(
          target: _center,
          zoom: 5.0,
        ),
      );
    });
  }
}
