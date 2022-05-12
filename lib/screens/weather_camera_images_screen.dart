import 'package:aviation_met_nepal/constant/urls.dart';
import 'package:aviation_met_nepal/model/weather_camera_images.dart';
import 'package:aviation_met_nepal/provider/weather_camera_images_provider.dart';
import 'package:aviation_met_nepal/widgets/custom_app_bar.dart';
import 'package:aviation_met_nepal/widgets/custom_error_tab.dart';
import 'package:aviation_met_nepal/widgets/custom_floating_action_btn.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../constant/colors_properties.dart';
import '../utils/get_device_size.dart';
import '../utils/is_online_checker.dart';
import '../utils/show_internet_connection_snack_bar.dart';
import '../widgets/custom_sheet.dart';

class WeatherCameraImagesScreen extends StatelessWidget {
  const WeatherCameraImagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "Weather Camera Images"),
      body: const WeatherCameraImagesBody(),
      floatingActionButton: const CustomFloatingActionBtn(),
    );
  }
}

class WeatherCameraImagesBody extends StatefulWidget {
  const WeatherCameraImagesBody({Key? key}) : super(key: key);

  @override
  State<WeatherCameraImagesBody> createState() =>
      _WeatherCameraImagesBodyState();
}

class _WeatherCameraImagesBodyState extends State<WeatherCameraImagesBody> {
  final TextEditingController _editingController = TextEditingController();
  late Future _future;

  @override
  void initState() {
    _future = Provider.of<WeatherCameraImagesProvider>(context, listen: false)
        .fetchWeatherCameraImagesData();
    _editingController.addListener(() {
      Provider.of<WeatherCameraImagesProvider>(context, listen: false)
          .filterWeatherCameraImages(_editingController.text);
    });
    super.initState();
  }

  Future weatherCameraImagesData() async {
    await Provider.of<WeatherCameraImagesProvider>(context, listen: false)
        .fetchWeatherCameraImagesData();
  }

  WeatherCameraImages? weatherCameraImages;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        onTap: () async {
          if (getIsOnline(context)) {
            final val =
                await ShowWeatherCameraImagesSheet.showWeatherCameraImagesSheet(
                    context: context,
                    editingController: _editingController,
                    future: _future);
            if (val != null) {
              weatherCameraImages = val;
              setState(() {});
            }
          } else {
            showInternetConnectionSnackBar(
                icon: Icons.error,
                size: 32.w,
                iconColor: Colors.white,
                bgColor: const Color(colorPrimary),
                statusText: "Attention",
                message: "No Airport Data Available");
          }
        },
        child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: DeviceUtil.isMobile ? 24.w : 16.w,
              vertical: 16.h * 1.5,
            ),
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            height: DeviceUtil.isMobile ? 46.h : 60.h,
            width: MediaQuery.of(context).size.height,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    weatherCameraImages?.name ?? "Select Airport",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.normal,
                        color: const Color(colorDarkBlue).withOpacity(0.65)),
                  ),
                  Icon(
                    Icons.location_on,
                    size: DeviceUtil.isMobile ? 20.h : 30.h,
                    color: const Color(colorPrimary),
                  ),
                ]),
            decoration: BoxDecoration(
                color: const Color(colorWhite),
                borderRadius: BorderRadius.circular(8.w))),
      ),
      if (weatherCameraImages != null &&
          weatherCameraImages!.files.isNotEmpty &&
          weatherCameraImages!.files.first.source != null)
        CachedNetworkImage(
          height: 250.h,
          width: 330.w,
          fit: BoxFit.cover,
          imageUrl: weatherCameraImagesDetailsUrl +
              weatherCameraImages!.files.first.source!,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator.adaptive()),
          errorWidget: (context, url, error) => CustomErrorTab(
            height: DeviceUtil.isMobile ? 230.h : 300.h,
          ),
        ),
      if (weatherCameraImages != null)
        if (weatherCameraImages!.files.isEmpty ||
            weatherCameraImages!.files.first.source == null)
          CustomErrorTab(
            height: DeviceUtil.isMobile ? 230.h : 300.h,
          )
    ]);
  }
}
