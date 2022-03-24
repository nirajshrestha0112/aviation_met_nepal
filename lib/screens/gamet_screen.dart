import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/airmet_data_provider.dart';
import '../provider/gamet_data_provider.dart';
import '../utils/custom_scroll_behavior.dart';
import '../utils/size_config.dart';

class GametDataScreen extends StatefulWidget {
  const GametDataScreen({this.isGametDataScreen = true, Key? key})
      : super(key: key);
  final bool isGametDataScreen;
  //

  @override
  State<GametDataScreen> createState() => _GametDataScreenState();
}

class _GametDataScreenState extends State<GametDataScreen> {
  @override
  void initState() {
    _future = widget.isGametDataScreen
        ? Provider.of<GametDataProvider>(context, listen: false)
            .fetchGametData()
        : Provider.of<AirmetDataProvider>(context, listen: false)
            .fetchAirmetData();
    super.initState();
  }

  late Future _future;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: bgColor,
          body: ScrollConfiguration(
              behavior: MyBehavior(),
              child: RawScrollbar(
                isAlwaysShown: true,
                thumbColor: Colors.grey,
                child: SingleChildScrollView(
                    child: Column(children: [
                  Container(
                    color: Colors.white,
                    height: SizeConfig.heightMultiplier! * 6.5,
                    width: double.infinity,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ListTile(
                          title: widget.isGametDataScreen
                              ? Text(
                                  // /isGamet/
                                  "Gamet Data",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.textMultiplier! * 2.2,
                                      color: textColor,
                                      fontWeight: FontWeight.w500),
                                )
                              : Text(
                                  // /isGamet/
                                  "Airmet Data",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.textMultiplier! * 2.2,
                                      color: textColor,
                                      fontWeight: FontWeight.w500),
                                ),
                        ),
                        Positioned(
                          top: SizeConfig.heightMultiplier! * 1.2,
                          left: SizeConfig.widthMultiplier,
                          child: GestureDetector(
                            child: Icon(
                              Icons.arrow_back,
                              size: SizeConfig.imageSizeMultiplier! * 7.5,
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
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
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
                              child: widget.isGametDataScreen
                                  ? Consumer<GametDataProvider>(
                                      builder: (_, value, __) {
                                      return Text(
                                        value.gametData!.data.toString(),
                                        style: TextStyle(
                                            fontSize:
                                                SizeConfig.textMultiplier! *
                                                    2.0,
                                            fontWeight: FontWeight.w500,
                                            color: textColor),
                                      );
                                    })
                                  : Consumer<AirmetDataProvider>(
                                      builder: (_, value, __) {
                                      return Text(
                                        value.airmetData!.data.toString(),
                                        style: TextStyle(
                                            fontSize:
                                                SizeConfig.textMultiplier! *
                                                    2.0,
                                            fontWeight: FontWeight.w500,
                                            color: textColor),
                                      );
                                    })),
                        );
                      },
                    ),
                  )
                ])),
              ))),
    );
  }
}
