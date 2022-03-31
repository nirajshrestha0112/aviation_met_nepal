import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/constant/values.dart';
import 'package:aviation_met_nepal/provider/airport_list_provider.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:aviation_met_nepal/widgets/custom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

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
            appBar: AppBar(
                centerTitle: true,
                elevation: 0.0,
                title: const Text(
                  "Discover",
                  textAlign: TextAlign.center,
                )),
            floatingActionButton: SizedBox(
              height: SizeConfig.heightMultiplier * 6.0,
              width: SizeConfig.widthMultiplier * 12.0,
              child: FloatingActionButton(
                child: Icon(
                  Icons.apps_sharp,
                  size: SizeConfig.imageSizeMultiplier * 8.0,
                ),
                onPressed: () {
                  ShowFabSheet.showFabSheet(context: context);
                },
                elevation: 0.0,
              ),
            ),
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
            onTap: () => ShowLocationSheet.showLocationSheet(
                context: context,
                editingController: _editingController,
                future: _future),
            child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 4.0),
                height: SizeConfig.heightMultiplier * 6.0,
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select Airport",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color:
                                const Color(colorDarkBlue).withOpacity(0.85)),
                      ),
                      Icon(
                        Icons.location_on,
                        size: SizeConfig.widthMultiplier * 7.5,
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
            SvgPicture.asset(controlTowerImg,
                width: SizeConfig.widthMultiplier * 30.0),
            SizedBox(height: SizeConfig.heightMultiplier * 2.0),
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
