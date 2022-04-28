import 'package:aviation_met_nepal/model/airport_list.dart';
import 'package:aviation_met_nepal/utils/custom_scroll_behavior.dart';
import 'package:aviation_met_nepal/utils/get_device_size.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:aviation_met_nepal/widgets/custom_error_tab.dart';
import 'package:aviation_met_nepal/widgets/metars_tab.dart';
import 'package:aviation_met_nepal/widgets/sigmets_tab.dart';
import 'package:aviation_met_nepal/widgets/tafs_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_floating_action_btn.dart';
import '../widgets/general_icon.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({this.data, Key? key}) : super(key: key);
  final Data? data;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _views = [
      MetarsTab(metarData: widget.data),
      TafsTab(tafsData: widget.data),
      SigmetsTab(sigmetsTabData: widget.data),
      CustomErrorTab(
          margin: EdgeInsets.only(bottom: DeviceUtil.isMobile ? 430.h : 350.h)),
    ];
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  late List<Widget> _views;
  late TabController _tabController;
  final List<Tab> _tabs = [
    Tab(
        child: Text(
      "METARS",
      style: TextStyle(fontSize: !DeviceUtil.isMobile ? 14.sp : null),
    )),
    Tab(
      child: Text("TAFS"),
    ),
    Tab(
      child: Text("SIGMETs"),
    ),
    Tab(child: Text("SPECI")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CustomFloatingActionBtn(),
      appBar: AppBar(
        toolbarHeight: 100.h,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            GeneralIcon(isPadding: EdgeInsets.only(right: 18.w)),
            Text(
              "${widget.data!.ident} ${widget.data!.name}",
            ),
          ]),
          SizedBox(
            height: DeviceUtil.isMobile ? 20.h : 50.h,
            child: TabBar(
              unselectedLabelStyle:
                  TextStyle(fontSize: !DeviceUtil.isMobile ? 14.sp : 14.sp),
              indicatorPadding: EdgeInsets.symmetric(
                vertical: DeviceUtil.isMobile
                    ? SizeConfig.heightMultiplier * 0.5
                    : SizeConfig.heightMultiplier * 0.5,
                // horizontal: DeviceUtil.isMobile
                //     ? SizeConfig.widthMultiplier * 2.0
                //     : SizeConfig.widthMultiplier * 4.0),
              ),
              controller: _tabController,
              tabs: _tabs,
            ),
          ),
        ]),
        // leading: GeneralIcon(isPadding: EdgeInsets.only(right: 18.w)),
        // bottom: TabBar(
        //   indicatorPadding: EdgeInsets.symmetric(
        //       vertical: DeviceUtil.isMobile
        //           ? SizeConfig.heightMultiplier * 0.5
        //           : SizeConfig.heightMultiplier * 0.8,
        //       horizontal: DeviceUtil.isMobile
        //           ? SizeConfig.widthMultiplier * 2.0
        //           : SizeConfig.widthMultiplier * 4.0),
        //   controller: _tabController,
        //   tabs: _tabs,
        // ),
      ),
      body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: TabBarView(
            controller: _tabController,
            children: _views,
          )),
    );
  }
}
