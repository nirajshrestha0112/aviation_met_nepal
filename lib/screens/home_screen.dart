import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/provider/airport_list_provider.dart';
import 'package:aviation_met_nepal/provider/connectivity_provider.dart';
import 'package:aviation_met_nepal/utils/is_online_checker.dart';
import 'package:aviation_met_nepal/utils/show_internet_connection_snack_bar.dart';
import 'package:aviation_met_nepal/widgets/custom_floating_action_btn.dart';
import 'package:aviation_met_nepal/widgets/custom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_alert_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
  @override
  void initState() {
    Provider.of<ConnectivityProvider>(context, listen: false)
        .monitorConnection();
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
      Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: padding * 1.2, vertical: padding * 1.5),
          child: InkWell(
            // overlayColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () => getIsOnline(context)
                ? ShowLocationSheet.showLocationSheet(
                    context: context,
                    editingController: _editingController,
                    future: _future)
                : showInternetConnectionSnackBar(
                    icon: Icons.error,
                    
                    // crossAxisAlignment: true,
                    size: 32.w,
                    iconColor: const Color(colorAccent),
                    bgColor: const Color(colorPrimary),
                    statusText: "Attention",
                    message: "No Airport Data Available"),
            child: Container(
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
                            color:
                                const Color(colorDarkBlue).withOpacity(0.65)),
                      ),
                      Icon(
                        Icons.location_on,
                        size: 20.h,
                        color: const Color(colorPrimary),
                      ),
                    ]),
                decoration: BoxDecoration(
                    color: const Color(colorWhite),
                    borderRadius: BorderRadius.circular(radius))),
          )),
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
