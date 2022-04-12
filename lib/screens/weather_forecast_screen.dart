import 'dart:developer';

import 'package:aviation_met_nepal/model/weather_detail.dart';
import 'package:aviation_met_nepal/provider/weather_forecast_provider.dart';
import 'package:aviation_met_nepal/widgets/custom_error_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../constant/colors_properties.dart';
import '../constant/images.dart';
import '../constant/values.dart';
import '../utils/custom_scroll_behavior.dart';
import '../utils/size_config.dart';
import '../widgets/custom_loading_indicator.dart';
import '../widgets/general_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key? key}) : super(key: key);

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  @override
  void initState() {
    _future =
        Provider.of<CitiesProvider>(context, listen: false).fetchCitiesData();
    super.initState();
    _editingController.addListener(() {
      Provider.of<CitiesProvider>(context, listen: false)
          .filterSearchWeatherForecastResults(_editingController.text);
    });
  }

  late Future _future;
  String description = "Kathmandu";
  late final TextEditingController _editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Weather Forecast",
          ),
          leading: const GeneralIcon(),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          height: 200.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: const Color(colorWhite),
              borderRadius: BorderRadius.circular(8.w)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: (() async {
                  description = await showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          isScrollControlled: true,
                          builder: (_) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              color: const Color(colorWhite),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 16.h),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: const Color(colorDarkBlue),
                                            size: 20.w,
                                          ),
                                          SizedBox(
                                            width: SizeConfig.widthMultiplier *
                                                3.0,
                                          ),
                                          Text(
                                            "Select Aiport",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          )
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(
                                          Icons.close_outlined,
                                          size: 25.w,
                                          color: const Color(colorDarkBlue),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  TextFormField(
                                      controller: _editingController,
                                      decoration: InputDecoration(
                                          hintText: "Select Airport",
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(8.w)),
                                          suffixIcon: Icon(
                                            Icons.search,
                                            size: 24.w,
                                          ))),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  Expanded(
                                      child: ScrollConfiguration(
                                    behavior: MyBehavior(),
                                    child: RawScrollbar(
                                      isAlwaysShown: true,
                                      thumbColor: const Color(bgColor),
                                      child: FutureBuilder(
                                          future: _future,
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return const CustomLoadingIndicator();
                                            }
                                            return Consumer<CitiesProvider>(
                                                builder: (_, value, __) {
                                              return value
                                                      .searchWeatherForecastData
                                                      .isEmpty
                                                  ? Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: Text(
                                                          "No Data Found",
                                                          style: TextStyle(
                                                              color: const Color(
                                                                  colorGrey20),
                                                              fontSize: 18.sp)))
                                                  : ListView.builder(
                                                      itemCount: value
                                                          .searchWeatherForecastData
                                                          .length,
                                                      itemBuilder: (c, i) {
                                                        return InkWell(
                                                          onTap: () async {
                                                            await Provider.of<
                                                                        WeatherForecastProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .fetchWeatherForecast(
                                                                    id: value
                                                                        .searchWeatherForecastData[
                                                                            i]
                                                                        .id);
                                                            Navigator.pop(
                                                                context,
                                                                value
                                                                    .searchWeatherForecastData[
                                                                        i]
                                                                    .description);
                                                          },
                                                          child: ListTile(
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    left: 4.w),
                                                            leading: Text(
                                                              value
                                                                  .searchWeatherForecastData[
                                                                      i]
                                                                  .description,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyText1!
                                                                  .copyWith(
                                                                      color: const Color(
                                                                          colorPrimary)),
                                                            ),
                                                          ),
                                                        );
                                                      });
                                            });
                                          }),
                                    ),
                                  ))
                                ]),
                              ),
                            );
                          }) ??
                      "Kathmandu";
                  log(description);
                  setState(() {});
                }),
                child: Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              Consumer<WeatherForecastProvider>(builder: (_, value, __) {
                return value.dateList.isEmpty
                    ? const CustomErrorTab(
                        margin: false,
                      )
                    : Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: value.dateList.length,
                          itemBuilder: (context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.h, horizontal: 8.w),
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
                                    height: 4.h,
                                  ),
                                  Image.asset(
                                    weatherIconImg,
                                    height: 40.h,
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text(
                                    "${value.weatherTemperatureList[index].c}\u2103",
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Row(
                                    children: [
                                      index == 0
                                          ? Text("Wind",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2)
                                          : const SizedBox.shrink(),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text(
                                          "${value.windSpeedList[index].kph} km/hr",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Row(
                                    children: [
                                      index == 0
                                          ? Text("Humidity",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2)
                                          : const SizedBox.shrink(),
                                      SizedBox(
                                        width: 4.h,
                                      ),
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
        ));
  }
}
