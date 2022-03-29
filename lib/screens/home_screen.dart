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
              backgroundColor: Colors.white,
              title: Text(
                "Discover",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: const Color(colorDarkBlue),
                    fontSize: SizeConfig.textMultiplier * 2.5,
                    fontWeight: FontWeight.w500),
              ),
            ),
            floatingActionButton: SizedBox(
              height: SizeConfig.heightMultiplier * 6.0,
              width: SizeConfig.widthMultiplier * 12.0,
              child: FloatingActionButton(
                backgroundColor: colorBlue,
                child: Icon(
                  Icons.apps_sharp,
                  size: SizeConfig.imageSizeMultiplier * 8.0,
                ),
                onPressed: () {
                  ShowSheet.showSheet(context: context);
                },
                elevation: 0.0,
              ),
            ),
            backgroundColor: bgColor,
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
        child: TextFormField(
            onTap: () {
              ShowLocationSheet.showLocationSheet(
                  context: context,
                  editingController: _editingController,
                  future: _future);
            },
            decoration: InputDecoration(
                fillColor: const Color(colorWhite),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: padding, vertical: padding / 2.0),
                hintText: "Select Airport",
                hintStyle: TextStyle(
                    color: const Color(colorGrey10),
                    fontSize: SizeConfig.textMultiplier * 2.0,
                    fontWeight: FontWeight.w400),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8.0)),
                suffixIcon: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    ShowLocationSheet.showLocationSheet(
                        context: context,
                        editingController: _editingController,
                        future: _future);
                  },
                  child: IconButton(
                    icon: Icon(
                      Icons.location_on,
                      color: const Color(colorPrimary),
                      size: SizeConfig.widthMultiplier * 7.5,
                    ),
                    onPressed: () {
                      ShowLocationSheet.showLocationSheet(
                          context: context,
                          editingController: _editingController,
                          future: _future);
                    },
                  ),
                ))),
      ),
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
                style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    color: const Color(colorDarkBlue)),
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
