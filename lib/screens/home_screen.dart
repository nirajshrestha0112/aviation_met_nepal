import 'dart:developer';

import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/provider/airport_list_provider.dart';
import 'package:aviation_met_nepal/provider/checking_modal_sheet.dart';
import 'package:aviation_met_nepal/provider/connectivity_provider.dart';
import 'package:aviation_met_nepal/utils/is_online_checker.dart';
import 'package:aviation_met_nepal/utils/show_internet_connection_snack_bar.dart';
import 'package:aviation_met_nepal/widgets/custom_floating_action_btn.dart';
import 'package:aviation_met_nepal/widgets/custom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:html/dom_parsing.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_alert_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // bool isShowing = true;
  @override
  Widget build(BuildContext context) {

    Provider.of<CheckingModalSheet>(context,listen: false).checkingModalSheet(context);
    // if (isShowing == true) {
    //   WidgetsBinding.instance?.addPostFrameCallback(
    //       (_) => ShowFabSheet.showFabSheet(context: context));
    //   setState(() {
    //     isShowing = !isShowing;
    //   });
    // }
    /*  WidgetsBinding.instance?.addPostFrameCallback(
        (_) => ShowFabSheet.showFabSheet(context: context)); */
    return WillPopScope(
      onWillPop: () async => await showDialog(
          context: context, builder: (context) => const ShowAlertDialogBox()),
      child: SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(42.h),
              child: AppBar(
                  title: const Text(
                "Discover",
              )),
            ),
            floatingActionButton: const CustomFloatingActionBtn(),
            body: const HomeScreenBody()),
      ),
    );
  }
}

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  late final ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    Provider.of<ConnectivityProvider>(context, listen: false)
        .monitorConnection(context);
    _future = Provider.of<AirportListProvider>(context, listen: false)
        .fetchAirportList();
    _editingController.addListener(() {
      Provider.of<AirportListProvider>(context, listen: false)
          .filterSearchResults(_editingController.text);
    });
    super.initState();
  }

  final _editingController = TextEditingController();
  late Future _future;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        onTap: () => getIsOnline(context)
            ? ShowLocationSheet.showLocationSheet(
                scrollController: scrollController,
                context: context,
                editingController: _editingController,
                future: _future)
            : showInternetConnectionSnackBar(
                icon: Icons.error,
                size: 32.w,
                iconColor: Colors.white,
                bgColor: const Color(colorPrimary),
                statusText: "Attention",
                message: "No Airport Data Available"),
        child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 16.h * 1.5,
            ),
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            height: 42.h,
            width: double.infinity,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select Airport",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.normal,
                        color: const Color(colorDarkBlue).withOpacity(0.65)),
                  ),
                  Icon(
                    Icons.location_on,
                    size: 20.h,
                    color: const Color(colorPrimary),
                  ),
                ]),
            decoration: BoxDecoration(
                color: const Color(colorWhite),
                borderRadius: BorderRadius.circular(8.w))),
      ),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              controlTowerImg,
              height: 90.h,
            ),
            SizedBox(height: 20.h),
            RichText(
              text: TextSpan(
                text: 'Please select the airport first ',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.w400),
                children: const <TextSpan>[
                  TextSpan(
                    text: '\n    to view detail readings',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
