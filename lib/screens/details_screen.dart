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
      // const CustomErrorTab(),
      const CustomErrorTab(),
      /*  const CustomErrorTab(),
      const CustomErrorTab() */
    ];
    super.initState();
  }

  late List<Widget> _views;
  late TabController _tabController;

  final List<Tab> _tabs = [
    // const Tab(child: EachText(text: "METARs")),
    const Tab(
      child: Text("METARS"),
    ),
    const Tab(
      child: Text("TAFS"),
    ),
    const Tab(
      child: Text("SIGMETs"),
    ),
    const Tab(
      child: Text("SPECI"),
    ),
    /*  const Tab(
      child: EachText(
        text: "TAFS",
      ),
    ),
    const Tab(child: EachText(text: "SIGMETs")),
    const Tab(child: EachText(text: "SPECI")) */
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(SizeConfig.heightMultiplier * 13.0),
          child: Theme(
            data: ThemeData(splashColor: Colors.transparent),
            child: AppBar(
              foregroundColor: Colors.blue,
              elevation: 0.0,
              title: Text(
                "${widget.data!.ident} ${widget.data!.name}",
                style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2.0,
                    color: textColor),
              ),
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: textColor,
                ),
              ),
              bottom: TabBar(
                indicatorPadding: const EdgeInsets.symmetric(
                    horizontal: radius, vertical: padding / 3.0),
                indicator: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(radius),
                  color: Colors.red,
                ),
                controller: _tabController,
                labelColor: Colors.white,
                unselectedLabelColor: textColor,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle:
                    const TextStyle(fontStyle: FontStyle.italic),
                tabs: _tabs,
              ),
              backgroundColor: Colors.white,
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
