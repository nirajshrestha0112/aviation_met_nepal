import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/model/airport_list_model.dart';
import 'package:aviation_met_nepal/utils/custom_scroll_behavior.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:aviation_met_nepal/widgets/custom_error_tab.dart';
import 'package:aviation_met_nepal/widgets/metars_tab.dart';
import 'package:aviation_met_nepal/widgets/sigmets_tab.dart';
import 'package:aviation_met_nepal/widgets/tafs_tab.dart';
import 'package:flutter/material.dart';

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
      const CustomErrorTab(),
    ];
    super.initState();
  }

  late List<Widget> _views;
  late TabController _tabController;

  final List<Tab> _tabs = const [
    Tab(
      child: Text(
        "METARS",
      ),
    ),
    Tab(
      child: Text("TAFS"),
    ),
    Tab(
      child: Text("SIGMETs"),
    ),
    Tab(
      child: Text("SPECI"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(SizeConfig.heightMultiplier * 13.0),
          child: AppBar(
            title: Text(
              "${widget.data!.ident} ${widget.data!.name}",
            ),
            leadingWidth: SizeConfig.widthMultiplier * 6.0,
            leading: const GeneralIcon(),
            bottom: TabBar(
              padding: const EdgeInsets.symmetric(horizontal: radius),
              indicatorPadding: const EdgeInsets.symmetric(
                  horizontal: radius, vertical: padding / 3.0),
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
