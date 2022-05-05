import 'package:auto_size_text/auto_size_text.dart';
import 'package:aviation_met_nepal/model/airport_list.dart';
import 'package:aviation_met_nepal/screens/sigmets_tab_screen.dart';
import 'package:aviation_met_nepal/screens/tafs_tab_screen.dart';
import 'package:aviation_met_nepal/utils/custom_scroll_behavior.dart';
import 'package:aviation_met_nepal/utils/get_device_size.dart';
import 'package:aviation_met_nepal/widgets/custom_error_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_floating_action_btn.dart';
import '../widgets/general_icon.dart';
import 'metars_tab_screen.dart';

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
  final List<Tab> _tabs = const [
    Tab(
        child: Text(
      "METARS",
    )),
    Tab(
      child: Text("TAFS"),
    ),
    Tab(
      child: Text(
        "SIGMETs",
      ),
    ),
    Tab(
        child: Text(
      "SPECI",
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: const CustomFloatingActionBtn(),
        appBar: AppBar(
          leadingWidth: !DeviceUtil.isMobile ? 4.w : 0.0,

          toolbarHeight: !DeviceUtil.isMobile ? 116.h : 88.h,
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              GeneralIcon(isPadding: EdgeInsets.only(right: 18.w)),
              SizedBox(
                width: 300.w,
                child: AutoSizeText(
                  "${widget.data!.ident} ${widget.data!.name}",
                  minFontSize: 14,
                  // maxFontSize: 16.sp,
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                ),
              ),
            ]),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: DeviceUtil.isMobile ? 36.h : 56.h,
              child: TabBar(
                // padding: EdgeInsets.all(2),
                unselectedLabelStyle:
                    TextStyle(fontSize: !DeviceUtil.isMobile ? 14.sp : 11.5.sp),
                indicatorPadding: EdgeInsets.symmetric(
                  vertical: DeviceUtil.isMobile ? 0.h : 4.h,
                  horizontal: DeviceUtil.isMobile ? 0.w : 4.w,
                ),
                // labelStyle: TextStyle(fontSize: 32.sp),

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
      ),
    );
  }
}
