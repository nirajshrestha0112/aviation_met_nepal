import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TestingScreen extends StatelessWidget {
  const TestingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset(cameraImg)),
      // body: Container(
      //   // height: SizeConfig.heightMultiplier * 30,
      //   width: double.infinity,
      //   color: Colors.blue,
      //   child: Column(children: [
      //     Expanded(child: Image.asset(feedbackRocketImg)),

      //     Expanded(child: )
      //     // SizedBox(
      //     //   height: SizeConfig.heightMultiplier * 5,
      //     //   width: SizeConfig.widthMultiplier*10,

      //     //   child: SvgPicture.asset(
      //     //     lightingImg,

      //     //     // height: SizeConfig.heightMultiplier * 5,
      //     //     // width: SizeConfig.widthMultiplier * 5,
      //     //     color: Colors.amber,
      //     //   ),
      //     // )
      //   ]),
      // ),
    );
  }
}
