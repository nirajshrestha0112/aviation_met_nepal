import 'package:aviation_met_nepal/provider/tafs_provider.dart';
import 'package:aviation_met_nepal/widgets/custom_error_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/airport_list.dart';
import 'custom_build_row.dart';
import 'custom_loading_indicator.dart';
import 'custom_raw_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TafsTab extends StatefulWidget {
  const TafsTab({required this.tafsData, Key? key}) : super(key: key);
  final Data? tafsData;

  @override
  State<TafsTab> createState() => _TafsTabState();
}

class _TafsTabState extends State<TafsTab> {
  @override
  void initState() {
    _future = tafsDataRawDecoded("");
    super.initState();
  }

  tafsDataRawDecoded(String filteredData) async {
    await Provider.of<TafsDataProvider>(context, listen: false)
        .fetchTafsDataRaw(
      ident: widget.tafsData!.ident,
    );
    await Provider.of<TafsDataProvider>(context, listen: false)
        .fetchTafsDataDecoded(
      ident: widget.tafsData!.ident,
    );
  }

  late Future _future;
  @override
  Widget build(BuildContext context) {
    // log(Provider.of<TafsDataProvider>(context,listen: false).tafsDataDecoded.data!.decoded!.text!.length.toString());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: FutureBuilder(
          future: _future,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CustomLoadingIndicator();
            }
            if (Provider.of<TafsDataProvider>(context, listen: false)
                        .tafsDataRaw !=
                    null &&
                Provider.of<TafsDataProvider>(context, listen: false)
                        .tafsDataDecoded !=
                    null) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Provider.of<TafsDataProvider>(context, listen: false)
                          .tafsDataRaw!
                          .data!
                          .date![0]
                          .toString()
                          .substring(8),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomRawCard(
                        rawHeaderText: "Raw",
                        rawBodyText: Provider.of<TafsDataProvider>(context,
                                listen: false)
                            .tafsDataRaw!
                            .data!
                            .raw!),
                    SizedBox(
                      height: 10.h,
                    ),
                    Column(
                      children: [
                        buildRow(
                          "TAF For",
                          Provider.of<TafsDataProvider>(context, listen: false)
                              .tafsDataDecoded!
                              .data!
                              .decoded!
                              .tAFFor!
                              .first,
                          isMetarFor: true,
                          isDecoded: true,
                        ),
                        Consumer<TafsDataProvider>(builder: (_, value, __) {
                          return ListView.builder(
                              itemCount: value
                                  .tafsDataDecoded!.data!.decoded!.text!.length,
                              primary: false,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    buildRow(
                                      "Text",
                                      value.tafsDataDecoded!.data!.decoded!
                                          .text![index],
                                      isText: true,
                                    ),
                                    buildRow(
                                        "Forecast Period",
                                        value.tafsDataDecoded!.data!.decoded!
                                            .forecastPeriod![index]),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    buildRow(
                                        "Forecast Type",
                                        value.tafsDataDecoded!.data!.decoded!
                                            .forecastType![index]),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    buildRow(
                                        "Winds",
                                        value.tafsDataDecoded!.data!.decoded!
                                            .winds![index]),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    buildRow(
                                        "Visibility",
                                        value.tafsDataDecoded!.data!.decoded!
                                            .visibility![index]),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    buildRow(
                                        "Ceiling",
                                        value.tafsDataDecoded!.data!.decoded!
                                            .ceilings![index]),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    buildRow(
                                        "Clouds",
                                        value.tafsDataDecoded!.data!.decoded!
                                            .clouds![index],
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
            } else {
              return const CustomErrorTab();
            }
          }),
    );
  }
}
