import 'package:aviation_met_nepal/widgets/customized_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../constant/colors_properties.dart';
import '../provider/weather_forecast_provider.dart';

class ShowWeatherForecastCities {
  static Future showWeatherForecastCities(
      {required BuildContext context,
      required Future future,
      required TextEditingController editingController}) async {
    editingController.addListener(() {
      Provider.of<CitiesProvider>(context, listen: false)
          .filterSearchWeatherForecastResults(editingController.text);
    });

    return await ShowCustomizedBottomSheet.showCustomizedBottomSheet(
        context: context,
        editingController: editingController,
        child: getWeatherForecastCitiesWidget(future));
  }

  static getWeatherForecastCitiesWidget(Future future) {
    return Scrollbar(
      child: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }

            return Consumer<CitiesProvider>(builder: (_, value, __) {
              return value.searchWeatherForecastData.isEmpty
                  ? Align(
                      alignment: Alignment.center,
                      child: Text("No Data Found",
                          style: TextStyle(
                              color: const Color(colorGrey20),
                              fontSize: 18.sp)))
                  : ListView.builder(
                      itemCount: value.searchWeatherForecastData.length,
                      itemBuilder: (c, i) {
                        return GestureDetector(
                            onTap: () async {
                              Navigator.pop(
                                  context,
                                  value.searchWeatherForecastData[i]
                                      .description);

                              await Provider.of<WeatherForecastProvider>(
                                      context,
                                      listen: false)
                                  .fetchWeatherForecast(
                                      id: value.searchWeatherForecastData[i].id)
                                  .then((_) {});
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 16.h, left: 4.h),
                              child: Text(
                                  value
                                      .searchWeatherForecastData[i].description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontSize: 18.sp,
                                          color: const Color(colorPrimary))),
                            ));
                      });
            });
          }),
    );
  }
}
