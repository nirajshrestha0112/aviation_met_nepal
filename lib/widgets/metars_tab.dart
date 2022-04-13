import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:aviation_met_nepal/widgets/custom_loading_indicator.dart';
import 'package:aviation_met_nepal/widgets/custom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/colors_properties.dart';
import '../model/airport_list.dart';
import '../provider/metar_data_provider.dart';
import 'custom_build_row.dart';
import 'custom_raw_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetarsTab extends StatefulWidget {
  const MetarsTab({required this.metarData, Key? key}) : super(key: key);
  final Data? metarData;

  @override
  State<MetarsTab> createState() => _MetarsTabState();
}

class _MetarsTabState extends State<MetarsTab> {
  @override
  void initState() {
    _future = metarDataRawDecoded("");
    super.initState();
  }

  metarDataRawDecoded(String filteredData) async {
    await Provider.of<MetarDataProvider>(context, listen: false)
        .fetchMetarDataRaw(
            ident: widget.metarData!.ident, filteredData: filteredData);
    await Provider.of<MetarDataProvider>(context, listen: false)
        .fetchMetarDataDecoded(
            ident: widget.metarData!.ident, filteredData: filteredData);
  }

  var filteredValue = "";
  setValue(value) {
    setState(() {
      filteredValue = value;
    });
  }

  late Future _future;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: FutureBuilder(
        future: _future,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CustomLoadingIndicator();
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        Provider.of<MetarDataProvider>(context, listen: false)
                            .metarDataRaw!
                            .data!
                            .date![0]
                            .toString()
                            .substring(8),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontWeight: FontWeight.normal)),
                    InkWell(
                      onTap: () async {
                        final value =
                            await ShowFilterSheet.showFilterSheet(context);
                        if (value != null) {
                          _future = metarDataRawDecoded(value);
                          setState(() {});
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 8.w),
                        height: 36.h,
                        width: 72.w,
                        decoration: BoxDecoration(
                            color: const Color(colorPrimary),
                            borderRadius: BorderRadius.circular(6.w)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Filter",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(color: const Color(colorWhite))),
                            Icon(Icons.arrow_drop_down,
                                size: 25.w, color: const Color(colorWhite))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomRawCard(
                    rawHeaderText: "Raw",
                    rawBodyText:
                        Provider.of<MetarDataProvider>(context, listen: false)
                            .metarDataRaw!
                            .data!
                            .raw!),
                SizedBox(
                  height: 10.h,
                ),
                Column(
                  children: [
                    buildRow(
                      "Metar For",
                      Provider.of<MetarDataProvider>(context, listen: false)
                          .metarDataDecoded
                          .data!
                          .decoded
                          .metarFor
                          .first,
                      isMetarFor: true,
                      isDecoded: true,
                    ),
                    Consumer<MetarDataProvider>(builder: (_, value, __) {
                      return ListView.builder(
                          itemCount:
                              value.metarDataDecoded.data!.decoded.text.length,
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                buildRow(
                                  "Text",
                                  value.metarDataDecoded.data!.decoded
                                      .text[index],
                                  isText: true,
                                ),
                                buildRow(
                                    "Temp.",
                                    value.metarDataDecoded.data!.decoded
                                        .temperature[index]),
                                SizedBox(
                                  height: 1.h,
                                ),
                                buildRow(
                                    "Dew Point",
                                    value.metarDataDecoded.data!.decoded
                                        .dewpoint[index]),
                                SizedBox(
                                  height: 1.h,
                                ),
                                buildRow(
                                    "Pressure(altimeter)",
                                    value.metarDataDecoded.data!.decoded
                                        .pressureAltimeter[index]),
                                SizedBox(
                                  height: 1.h,
                                ),
                                buildRow(
                                    "Winds",
                                    value.metarDataDecoded.data!.decoded
                                        .winds[index]),
                                SizedBox(
                                  height: 1.h,
                                ),
                                buildRow(
                                    "Visibility",
                                    value.metarDataDecoded.data!.decoded
                                        .visibility[index]),
                                SizedBox(
                                  height: 1.h,
                                ),
                                buildRow(
                                    "Ceiling",
                                    value.metarDataDecoded.data!.decoded
                                        .ceiling[index]),
                                SizedBox(
                                  height: 1.h,
                                ),
                                buildRow(
                                    "Clouds",
                                    value.metarDataDecoded.data!.decoded
                                        .clouds[index],
                                    isClouds: true),
                              ],
                            );
                          });
                    })
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
