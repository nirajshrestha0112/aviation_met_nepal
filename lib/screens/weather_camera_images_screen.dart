import 'package:aviation_met_nepal/widgets/custom_floating_action_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/general_icon.dart';

class WeatherCameraImagesScreen extends StatelessWidget {
  const WeatherCameraImagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GeneralIcon(),
        title: Padding(
          padding: EdgeInsets.only(bottom: 4.h),
          child: const Text(
            "Weather Camera Images",
          ),
        ),
      ),
      body: const WeatherCameraImagesBody(),
      floatingActionButton: const CustomFloatingActionBtn(),
    );
  }
}

class WeatherCameraImagesBody extends StatelessWidget {
  const WeatherCameraImagesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
