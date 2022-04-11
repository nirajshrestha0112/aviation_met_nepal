import 'dart:developer';

import 'package:aviation_met_nepal/provider/cities_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/colors_properties.dart';
import '../constant/values.dart';
import '../utils/custom_scroll_behavior.dart';
import '../utils/size_config.dart';
import '../widgets/custom_loading_indicator.dart';
import '../widgets/general_icon.dart';

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
          leadingWidth: SizeConfig.widthMultiplier * 6.0,
          leading: const GeneralIcon(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: padding, vertical: padding),
          child: Container(
            height: SizeConfig.heightMultiplier * 20.0,
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color(colorWhite),
                borderRadius: BorderRadius.circular(radius)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.end,
              // mainAxisSize: MainAxisSize.min,
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: padding / 1.5, vertical: padding),
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
                                          size: SizeConfig.imageSizeMultiplier *
                                              5.5,
                                        ),
                                        SizedBox(
                                          width:
                                              SizeConfig.widthMultiplier * 3.0,
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
                                        size: SizeConfig.imageSizeMultiplier *
                                            7.0,
                                        color: const Color(colorDarkBlue),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: SizeConfig.heightMultiplier * 3.0,
                                ),
                                TextFormField(
                                    controller: _editingController,
                                    decoration: InputDecoration(
                                        hintText: "Select Airport",
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(radius)),
                                        suffixIcon: Icon(
                                          Icons.search,
                                          size:
                                              SizeConfig.widthMultiplier * 7.5,
                                        ))),
                                SizedBox(
                                  height: SizeConfig.heightMultiplier * 2.0,
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
                                                        "No Airport Data Found",
                                                        style: TextStyle(
                                                            color: const Color(
                                                                colorGrey20),
                                                            fontSize: SizeConfig
                                                                    .textMultiplier *
                                                                2.5)))
                                                : ListView.builder(
                                                    itemCount: value
                                                        .searchWeatherForecastData
                                                        .length,
                                                    itemBuilder: (c, i) {
                                                      return InkWell(
                                                        onTap: () => Navigator.pop(
                                                            context,
                                                            value
                                                                .searchWeatherForecastData[
                                                                    i]
                                                                .description),
                                                        child: ListTile(
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 4),
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
                        });
                    log(description);
                    setState(() {});
                  }),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text(description,
                                style: Theme.of(context).textTheme.bodyText2),
                            /* SizedBox(
                          width: SizeConfig.widthMultiplier * 3.0,
                        ), */
                            Icon(
                              Icons.arrow_drop_down,
                              color: const Color(colorDarkBlue),
                              size: SizeConfig.imageSizeMultiplier * 7.5,
                            ),
                          ],
                        ),
                        Text(
                          "Sun,21 Jul 2020 17:30 PM",
                          style: Theme.of(context).textTheme.bodyText2,
                        )
                      ]),
                ),
                const Divider(
                  thickness: 1.5,
                ),

                /*   Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: padding / 2, horizontal: padding / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("00:00 AM",
                          style: Theme.of(context).textTheme.bodyText2),
                      Image.asset(
                        governmentImg,
                        height: SizeConfig.heightMultiplier * 3.0,
                      ),
                      Row(
                        children: [
                          Text("Wind",
                              style: Theme.of(context).textTheme.bodyText2),
                          SizedBox(
                            width: SizeConfig.widthMultiplier,
                          ),
                          Text("S 9.26 km/hr",
                              style: Theme.of(context).textTheme.bodyText2),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier,
                      ),
                      Row(
                        children: [
                          Text("Humidity",
                              style: Theme.of(context).textTheme.bodyText2),
                          SizedBox(
                            width: SizeConfig.widthMultiplier,
                          ),
                          Text("65%",
                              style: Theme.of(context).textTheme.bodyText2),
                        ],
                      )
                    ],
                  ),
                )
               */
              ],
            ),
          ),
        ));
  }
}
