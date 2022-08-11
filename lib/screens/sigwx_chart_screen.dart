import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/utils/custom_scroll_behavior.dart';
import 'package:aviation_met_nepal/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_floating_action_btn.dart';
import 'sigwx_details_screen.dart';

class SigwxChartScreen extends StatelessWidget {
  const SigwxChartScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(text: "SIGWX Chart"),
        floatingActionButton: const CustomFloatingActionBtn(),
        body: const SigwxChartBody(),
      ),
    );
  }
}

class SigwxChartBody extends StatefulWidget {
  const SigwxChartBody({
    Key? key,
  }) : super(key: key);
  @override
  State<SigwxChartBody> createState() => _SigwxChartBodyState();
}

List sigwxMap = [
  "SWH_PNG/AREA_A",
  "SWH_PNG/AREA_B",
  "SWH_PNG/AREA_B1",
  "SWH_PNG/AREA_C",
  "SWH_PNG/AREA_D",
  "SWH_PNG/AREA_E",
  "SWH_PNG/AREA_F",
  "SWH_PNG/AREA_G",
  "SWH_PNG/AREA_H",
  "SWH_PNG/AREA_I",
  "SWH_PNG/AREA_J",
  "SWH_PNG/AREA_K",
  "SWH_PNG/AREA_M",
  'SWM_PNG/AREA_ASIA_SOUTH ',
  'SWM_PNG/AREA_EURO',
  'SWM_PNG/AREA_MID',
  'SWM_PNG/AREA_NAT'
];

class _SigwxChartBodyState extends State<SigwxChartBody> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: ListView.builder(
        itemCount: sigwxMap.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => SigwaxDetailsScreen(
                          path: "SADIS/SIGWX_PNG/${sigwxMap[index]}",
                          fileName: "new.png",
                        )));
          },
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, top: 8.h),
            child: Row(
              children: [
                Icon(
                  Icons.folder,
                  color: const Color(colorLightYellow),
                  size: 38.h,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6.h),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .75,
                    child: Text(
                        sigwxMap[index].toString().substring(8).toString() ,
                        style: TextStyle(fontSize: 22.sp, color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
