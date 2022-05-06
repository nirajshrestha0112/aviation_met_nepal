import 'package:aviation_met_nepal/widgets/custom_error_tab.dart';
import 'package:aviation_met_nepal/widgets/file_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/get_device_size.dart';
import '../widgets/custom_floating_action_btn.dart';
import '../widgets/general_icon.dart';

class WindChartScreen extends StatelessWidget {
  const WindChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: const GeneralIcon(),
            title: Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: const Text(
                "Wind Chart",
              ),
            ),
          ),
          floatingActionButton: const CustomFloatingActionBtn(),
          body: const WindChartScreenBody()),
    );
  }
}

class WindChartScreenBody extends StatefulWidget {
  const WindChartScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  State<WindChartScreenBody> createState() => _WindChartScreenBodyState();
}

class _WindChartScreenBodyState extends State<WindChartScreenBody> {
  /*  Future<void> _pulltoRefresh() async {
    setState(() {});
  } */
  /*  void initState() {
    _future = Provider.of<SatelliteImageProvider>(context, listen: false)
        .postSatelliteImageDataData();
    super.initState();
  } */

  // late Future _future;

  @override
  Widget build(BuildContext context) {
    FileDownloader windFiles = FileDownloader();
    return FutureBuilder(
        future: windFiles.downloadFileWindChart(
            filename: "windcharts.gif",
            ftpFilename:
                "Meteorological Forecasting Division/WIND AND TEMPERATURE CHARTS"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return InteractiveViewer(
                // panEnabled: false, // Set it to false
                boundaryMargin: EdgeInsets.all(100.w),
                minScale: 0.5,
                maxScale: 2.5,
                child: SizedBox(
                    height: MediaQuery.of(context).size.height / 1.2,
                    child: Image.file(windFiles.file!)),
              );
            }
            return CustomErrorTab(
              height: DeviceUtil.isMobile ? 230.h : 300.h,
            );
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        });
  }
}
