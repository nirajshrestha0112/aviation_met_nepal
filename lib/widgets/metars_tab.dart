import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:aviation_met_nepal/widgets/custom_sheet.dart';
import 'package:aviation_met_nepal/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant/colors_properties.dart';
import '../model/airport_list_model.dart';
import '../provider/metar_data_provider.dart';
import 'custom_build_row.dart';
import 'custom_raw_card.dart';

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
      padding:
          const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
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
                            .copyWith(fontWeight: FontWeight.normal)
                        // TextStyle(fontSize: SizeConfig.textMultiplier * 2.0),
                        ),
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
                        height: SizeConfig.heightMultiplier * 5.0,
                        width: SizeConfig.widthMultiplier * 20.0,
                        decoration: BoxDecoration(
                            color: const Color(colorPrimary),
                            borderRadius: BorderRadius.circular(radius)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: SizeConfig.widthMultiplier,
                            ),
                            Text("Filter",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(color: const Color(colorWhite))),
                            Icon(Icons.arrow_drop_down,
                                size: SizeConfig.imageSizeMultiplier * 8.0,
                                color: const Color(colorWhite))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3.0,
                ),
                CustomRawCard(
                    rawHeaderText: "Raw",
                    rawBodyText:
                        Provider.of<MetarDataProvider>(context, listen: false)
                            .metarDataRaw!
                            .data!
                            .raw!),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2.0,
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
                                  height: SizeConfig.heightMultiplier / 4.5,
                                ),
                                buildRow(
                                    "Dew Point",
                                    value.metarDataDecoded.data!.decoded
                                        .dewpoint[index]),
                                SizedBox(
                                  height: SizeConfig.heightMultiplier / 4.5,
                                ),
                                buildRow(
                                    "Pressure(altimeter)",
                                    value.metarDataDecoded.data!.decoded
                                        .pressureAltimeter[index]),
                                SizedBox(
                                  height: SizeConfig.heightMultiplier / 4.5,
                                ),
                                buildRow(
                                    "Winds",
                                    value.metarDataDecoded.data!.decoded
                                        .winds[index]),
                                SizedBox(
                                  height: SizeConfig.heightMultiplier / 4.5,
                                ),
                                buildRow(
                                    "Visibility",
                                    value.metarDataDecoded.data!.decoded
                                        .visibility[index]),
                                SizedBox(
                                  height: SizeConfig.heightMultiplier / 4.5,
                                ),
                                buildRow(
                                    "Ceiling",
                                    value.metarDataDecoded.data!.decoded
                                        .ceiling[index]),
                                SizedBox(
                                  height: SizeConfig.heightMultiplier / 4.5,
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
