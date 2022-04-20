import 'package:aviation_met_nepal/provider/weather_forecast_provider.dart';
import 'package:aviation_met_nepal/utils/custom_scroll_behavior.dart';
import 'package:aviation_met_nepal/widgets/custom_loading_indicator.dart';
import 'package:aviation_met_nepal/widgets/custom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../constant/colors_properties.dart';
import '../constant/images.dart';
import '../widgets/general_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherForecastScreen extends StatelessWidget {
  const WeatherForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Weather Forecast",
          ),
          leading: const GeneralIcon(),
        ),
        body: const WeatherForecastBody());
  }
}

class WeatherForecastBody extends StatefulWidget {
  const WeatherForecastBody({Key? key}) : super(key: key);

  @override
  State<WeatherForecastBody> createState() => _WeatherForecastBodyState();
}

class _WeatherForecastBodyState extends State<WeatherForecastBody> {
  bool isInit = false;
  bool isLoading = true;

  @override
  void didChangeDependencies() async {
    if (isInit == false) {
      await Provider.of<WeatherForecastProvider>(context, listen: false)
          .fetchWeatherForecast(id: "4991");
      isLoading = false;
      isInit = true;
      setState(() {});
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _future =
        Provider.of<CitiesProvider>(context, listen: false).fetchCitiesData();

    super.initState();
  }

  late Future _future;
  String description = "Kathmandu";
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        height: 230.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(colorWhite),
            borderRadius: BorderRadius.circular(8.w)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (() async {
                var desc =
                    await ShowWeatherForecastCities.showWeatherForecastCities(
                        context: context, future: _future);
                if (desc != null) {
                  description = desc;
                } else {
                  description = "Kathmandu";
                }
                setState(() {});
              }),
              child: Padding(
                padding: EdgeInsets.only(top: 10.h, left: 16.w, right: 16.w),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(description,
                              style: Theme.of(context).textTheme.bodyText2),
                          Icon(
                            Icons.arrow_drop_down,
                            color: const Color(colorDarkBlue),
                            size: 25.w,
                          ),
                        ],
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
                ? const CustomLoadingIndicator()
                : Consumer<WeatherForecastProvider>(builder: (_, value, __) {
                    return Expanded(
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
                                    style:
                                        Theme.of(context).textTheme.bodyText2),
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
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  children: [
                                    index == 0
                                        ? Text("Wind",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2)
                                        : const SizedBox.shrink(),
                                    index == 0
                                        ? SizedBox(
                                            width: 4.w,
                                          )
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
                                        ? Text("Humidity",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2)
                                        : const SizedBox.shrink(),
                                    index == 0
                                        ? SizedBox(
                                            width: 4.w,
                                          )
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
                    );
                  })
          ],
        ),
      ),
    );
  }
}
