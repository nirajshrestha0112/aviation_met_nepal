import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:aviation_met_nepal/widgets/custom_show_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant/colors.dart';
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
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Provider.of<MetarDataProvider>(context, listen: false)
                          .metarDataRaw
                          .data!
                          .date![0]
                          .toString()
                          .substring(8),
                      style:
                          TextStyle(fontSize: SizeConfig.textMultiplier! * 2.0),
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
                        height: SizeConfig.heightMultiplier! * 5.0,
                        width: SizeConfig.widthMultiplier! * 20.0,
                        decoration: BoxDecoration(
                            color: iconColor,
                            borderRadius: BorderRadius.circular(radius)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: SizeConfig.widthMultiplier,
                            ),
                            Text(
                              "Filter",
                              style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier! * 1.8,
                                  color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              size: SizeConfig.imageSizeMultiplier! * 8.0,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier! * 3.0,
                ),
                CustomRawCard(
                    rawHeaderText: "Raw",
                    rawBodyText:
                        Provider.of<MetarDataProvider>(context, listen: false)
                            .metarDataRaw
                            .data!
                            .raw!),
                SizedBox(
                  height: SizeConfig.heightMultiplier! * 2.0,
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
                      return ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                                height: SizeConfig.heightMultiplier,
                              ),
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
                                buildRow(
                                    "Dew Point",
                                    value.metarDataDecoded.data!.decoded
                                        .dewpoint[index]),
                                buildRow(
                                    "Pressure(altimeter)",
                                    value.metarDataDecoded.data!.decoded
                                        .pressureAltimeter[index]),
                                buildRow(
                                    "Winds",
                                    value.metarDataDecoded.data!.decoded
                                        .winds[index]),
                                buildRow(
                                    "Visibility",
                                    value.metarDataDecoded.data!.decoded
                                        .visibility[index]),
                                buildRow(
                                    "Ceiling",
                                    value.metarDataDecoded.data!.decoded
                                        .ceiling[index]),
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
