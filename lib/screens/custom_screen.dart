import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/provider/ashtams_data_provider.dart';
import 'package:aviation_met_nepal/theme/theme.dart';
import 'package:aviation_met_nepal/widgets/custom_error_tab.dart';
import 'package:aviation_met_nepal/widgets/general_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/airmet_data_provider.dart';
import '../provider/gamet_data_provider.dart';
import '../provider/opmet_data_provider.dart';
import '../theme/theme.dart';
import '../utils/custom_scroll_behavior.dart';
import '../utils/get_device_size.dart';
import '../widgets/custom_floating_action_btn.dart';
import '../widgets/custom_loading_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomScreen extends StatelessWidget {
  const CustomScreen({Key? key, required this.screenName}) : super(key: key);
  final String screenName;

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: const CustomFloatingActionBtn(),
          body: CustomScreenBody(screenName: screenName)),
    );
  }
}

class CustomScreenBody extends StatefulWidget {
  const CustomScreenBody({
    Key? key,
    required this.screenName,
  }) : super(key: key);
  final String screenName;

  @override
  State<CustomScreenBody> createState() => _CustomScreenBodyState();
}

class _CustomScreenBodyState extends State<CustomScreenBody> {
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
    return ScrollConfiguration(
        behavior: MyBehavior(),
        child: Theme(
          data: theme(context).copyWith(highlightColor: Colors.grey),
          child: Scrollbar(
            isAlwaysShown: true,
            child: SingleChildScrollView(
                child: Column(children: [
              Container(
                color: const Color(colorWhite),
                height: DeviceUtil.isMobile?44.h:56.h,
                width: double.infinity,
                child: ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.only(left: 16.w, right: 42.w),
                    leading: const GeneralIcon(),
                    title: Padding(
                      padding: EdgeInsets.zero,
                      child: Text(
                        widget.screenName,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 18.sp),
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: FutureBuilder(
                  future: _future,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 1.3,
                        child: const CustomLoadingIndicator(),
                      );
                    }

                    return SingleChildScrollView(
                        child: Container(
                      padding: EdgeInsets.only(
                        top: 16.h,
                        left: 16.w,
                        bottom: 16.h,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.w)),
                      child: widget.screenName == "Gamet Data"
                          ? Consumer<GametDataProvider>(
                              builder: (_, value, __) {
                                return value.gametData?.data != null
                                    ? Text(
                                        value.gametData!.data.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      )
                                    : const CustomErrorTab();
                              },
                            )
                          : widget.screenName == "Airmet Data"
                              ? Consumer<AirmetDataProvider>(
                                  builder: (_, value, __) {
                                  return value.airmetData?.data != null
                                      ? Text(
                                          value.airmetData!.data.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        )
                                      : const CustomErrorTab();
                                })
                              : widget.screenName == "Opmet Data"
                                  ? Consumer<OpmetDataProvider>(
                                      builder: (_, value, __) {
                                      return value.opmetData?.data != null
                                          ? Text(
                                              value.opmetData!.data.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2,
                                            )
                                          : const CustomErrorTab();
                                    })
                                  : widget.screenName == "Ashtams Data"
                                      ? Consumer<AshtamsDataProvider>(
                                          builder: (_, value, __) {
                                          return value.ashtamsData?.data == null
                                              ? const CustomErrorTab()
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
          ),
        ));
  }
}
