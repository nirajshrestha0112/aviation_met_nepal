import 'package:aviation_met_nepal/model/airport_list.dart';
import 'package:aviation_met_nepal/utils/custom_scroll_behavior.dart';
import 'package:aviation_met_nepal/widgets/custom_error_tab.dart';
import 'package:aviation_met_nepal/widgets/metars_tab.dart';
import 'package:aviation_met_nepal/widgets/sigmets_tab.dart';
import 'package:aviation_met_nepal/widgets/tafs_tab.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_floating_action_btn.dart';
import '../widgets/general_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      const CustomErrorTab(),
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
    Tab(child: Text("METARS")),
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
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: AppBar(
            title: Text(
              "${widget.data!.ident} ${widget.data!.name}",
            ),
            leading: GeneralIcon(isPadding: EdgeInsets.only(right: 18.w)),
            bottom: TabBar(
              indicatorPadding:
                  EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.5.w),
              controller: _tabController,
              tabs: _tabs,
            ),
          )),
      body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: TabBarView(
            controller: _tabController,
            children: _views,
          )),
    );
  }
}
