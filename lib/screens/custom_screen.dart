import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/provider/ashtams_data_provider.dart';
import 'package:aviation_met_nepal/widgets/custom_error_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/airmet_data_provider.dart';
import '../provider/gamet_data_provider.dart';
import '../provider/opmet_data_provider.dart';
import '../utils/custom_scroll_behavior.dart';
import '../utils/size_config.dart';
import '../widgets/custom_floating_action_btn.dart';
import '../widgets/custom_loading_indicator.dart';

class CustomScreen extends StatefulWidget {
  const CustomScreen({required this.screenName, Key? key}) : super(key: key);
  final String screenName;
  //

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  @override
  void initState() {
    if (widget.screenName == "Gamet Data") {
      _future = Provider.of<GametDataProvider>(context, listen: false)
          .fetchGametData();
    } else if (widget.screenName == "Airmet Data") {
      _future = Provider.of<AirmetDataProvider>(context, listen: false)
          .fetchAirmetData();
    } else if (widget.screenName == "Opmet Data") {
      _future = Provider.of<OpmetDataProvider>(context, listen: false)
          .fetchOpmetData();
    } else if (widget.screenName == "Ashtams Data") {
      _future = Provider.of<AshtamsDataProvider>(context, listen: false)
          .fetchAshtamsData();
    }

    super.initState();
  }

  late Future _future;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: const CustomFloatingActionBtn(),
          body: ScrollConfiguration(
              behavior: MyBehavior(),
              child: RawScrollbar(
                isAlwaysShown: true,
                minThumbLength: SizeConfig.heightMultiplier,
                thickness: SizeConfig.widthMultiplier,
                thumbColor: Colors.grey,
                child: SingleChildScrollView(
                    child: Column(children: [
                  Container(
                    color: const Color(colorWhite),
                    height: SizeConfig.heightMultiplier * 6.5,
                    width: double.infinity,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ListTile(
                            title: Text(
                          widget.screenName,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: SizeConfig.textMultiplier * 2.2),
                        )),
                        Positioned(
                          top: SizeConfig.heightMultiplier * 2,
                          left: SizeConfig.widthMultiplier * 3.5,
                          child: GestureDetector(
                            child: Icon(
                              Icons.adaptive.arrow_back,
                              color: const Color(colorDarkBlue),
                              size: SizeConfig.imageSizeMultiplier * 6.0,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: padding, vertical: padding),
                    child: FutureBuilder(
                      future: _future,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height / 1.3,
                            child: const CustomLoadingIndicator(),
                          );
                        }

                        return SingleChildScrollView(
                            child: Container(
                          padding: const EdgeInsets.only(
                            top: padding,
                            left: padding,
                            bottom: padding,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(radius)),
                          child: widget.screenName == "Gamet Data"
                              ? Consumer<GametDataProvider>(
                                  builder: (_, value, __) {
                                    return Text(
                                      value.gametData!.data.toString(),
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    );
                                  },
                                )
                              : widget.screenName == "Airmet Data"
                                  ? Consumer<AirmetDataProvider>(
                                      builder: (_, value, __) {
                                      return Text(
                                        value.airmetData!.data.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      );
                                    })
                                  : widget.screenName == "Opmet Data"
                                      ? Consumer<OpmetDataProvider>(
                                          builder: (_, value, __) {
                                          return Text(
                                            value.opmetData!.data.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          );
                                        })
                                      : widget.screenName == "Ashtams Data"
                                          ? Consumer<AshtamsDataProvider>(
                                              builder: (_, value, __) {
                                              return value.ashtamsData?.data ==
                                                      null
                                                  ? const CustomErrorTab(
                                                      margin: false,
                                                    )
                                                  : Text(
                                                      value.ashtamsData!.data
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                    );
                                            })
                                          : const SizedBox.shrink(),
                        ));
                      },
                    ),
                  )
                ])),
              ))),
    );
  }
}
