
import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/file_downloader.dart';
import 'package:aviation_met_nepal/screens/sig_wax_chart_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:ftpclient/ftpclient.dart';

import '../widgets/custom_floating_action_btn.dart';
import '../widgets/general_icon.dart';

class SigwxChartScreen extends StatelessWidget {
  const SigwxChartScreen({Key? key, this.path = "SADIS/SIGWX_PNG/"})
      : super(key: key);
  final String? path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GeneralIcon(),
        title: Padding(
          padding: EdgeInsets.only(bottom: 4.h),
          child: const Text(
            "Sigwx Chart Image",
          ),
        ),
      ),
      floatingActionButton: const CustomFloatingActionBtn(),
      body: SigwxChartBody(
        path: path,
      ),
    );
  }
}

class SigwxChartBody extends StatefulWidget {
  const SigwxChartBody({Key? key, required this.path}) : super(key: key);
  final String? path;
  @override
  State<SigwxChartBody> createState() => _SigwxChartBodyState();
}

List sigwxMap = [
  "SWH_PNG/AERA_A",
  "SWH_PNG/AERA_B",
  "SWH_PNG/AERA_B1",
  "SWH_PNG/AERA_C",
  "SWH_PNG/AERA_D",
  "SWH_PNG/AERA_E",
  "SWH_PNG/AERA_F",
  "SWH_PNG/AERA_G",
  "SWH_PNG/AERA_H",
  "SWH_PNG/AERA_I",
  "SWH_PNG/AERA_J",
  "SWH_PNG/AERA_K",
  "SWH_PNG/AERA_M",
  'SWM_PNG/AREA_ASIA_SOUTH',
  'SWM_PNG/AREA_EURO',
  'SWM_PNG/AREA_MID',
  'SWM_PNG/AREA_NAT'
];

class _SigwxChartBodyState extends State<SigwxChartBody> {
  @override
  Widget build(BuildContext context) {
    FileDownloader sigwxFiles = FileDownloader();
    FileDownloader downloadSigwxFile = FileDownloader();

    return ListView.builder(
      itemCount: sigwxMap.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => SigwaxScreen(
                        path: "SADIS/SIGWX_PNG/${sigwxMap[index]}",fileName:"new.png" ,
                      )));
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.folder,
              color: const Color(colorLightYellow),
              size: 38.h,
            ),
            Expanded(
              child: Text(sigwxMap[index].toString().substring(8).toString(),
                  style: TextStyle(fontSize: 20.sp, color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
