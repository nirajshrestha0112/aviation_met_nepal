import 'dart:developer';

import 'package:aviation_met_nepal/constant/constants.dart';
import 'package:aviation_met_nepal/provider/weather_forecast_provider.dart';
import 'package:aviation_met_nepal/utils/custom_scroll_behavior.dart';
import 'package:aviation_met_nepal/utils/get_device_size.dart';
import 'package:aviation_met_nepal/widgets/custom_app_bar.dart';
import 'package:aviation_met_nepal/widgets/custom_error_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../constant/colors_properties.dart';
import '../constant/images.dart';
import '../widgets/weatherforecast_bottom_sheet.dart';

class WeatherForecastScreen extends StatelessWidget {
  const WeatherForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(text: "Weather Forecast"),
          body: const WeatherForecastBody()),
    );
  }
}

class WeatherForecastBody extends StatefulWidget {
  const WeatherForecastBody({Key? key}) : super(key: key);

  @override
  State<WeatherForecastBody> createState() => _WeatherForecastBodyState();
}

class _WeatherForecastBodyState extends State<WeatherForecastBody> {
  bool isLoading = true;
  late Future _future;
  String selectedCityName = kathmanduText;
  final TextEditingController _editingController = TextEditingController();

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    // debugger();
    _future =
        Provider.of<CitiesProvider>(context, listen: false).fetchCitiesData();
    await Provider.of<WeatherForecastProvider>(context, listen: false)
        .fetchWeatherForecast(id: kathmanduCityId);

    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      height: DeviceUtil.isMobile ? 240.h : 280.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(colorWhite),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: isLoMainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (() async {
              selectedCityName =
                  await ShowWeatherForecastCities.showWeatherForecastCities(
                          context: context,
                          future: _future,
                          editingController: _editingController) ??
                      kathmanduText;
              setState(() {});
            }),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 10.h, left: 16.w, right: 16.w),
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('$selectedCityName \u{25BC} ',
                        style: Theme.of(context).textTheme.bodyText2),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      DateFormat("EEE dd MMM yyy, hh:mm a")
                          .format(DateTime.now()),
                      style: Theme.of(context).textTheme.bodyText2,
                    )
                  ]),
            ),
          ),
          const Divider(
            thickness: 1.5,
          ),
          isLoading
              ? Padding(
                  padding: EdgeInsets.only(top: 60.h),
                  child:
                      const Center(child: CircularProgressIndicator.adaptive()),
                )
              : Consumer<WeatherForecastProvider>(
                  builder: (_, value, __) {
                    if (value.dateList.first.day != DateTime.now().day) {
                      return const CustomErrorTab();
                    } else {
                      return ScrollConfiguration(
                        behavior: MyBehavior(),
                        child: Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: value.dateList.length,
                            itemBuilder: (context, int index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.h, horizontal: 16.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        DateFormat("hh:mm a")
                                            .format(value.dateList[index]),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Image.asset(
                                      weatherIconImg,
                                      height: 40.h,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                      "${value.weatherTemperatureList[index].c}\u2103",
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Row(
                                      children: [
                                        index == 0
                                            ? Text("Wind ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2)
                                            : const SizedBox.shrink(),
                                        Text(
                                            "${value.windSpeedList[index].kph} km/hr",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Row(
                                      children: [
                                        index == 0
                                            ? Text("Humidity ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2)
                                            : const SizedBox.shrink(),
                                        Text(
                                            "${value.humidityList[index].percentage}%",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }
                  },
                ),
        ],
      ),
    );
  }
}
