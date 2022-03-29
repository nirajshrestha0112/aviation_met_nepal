import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/screens/home_screen.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  int splashtime = 3;
  // duration of splash screen on second

  @override
  void initState() {
    Future.delayed(Duration(minutes: splashtime), () async {
      await fetchDatas();
    });

    super.initState();
  }

  fetchDatas() async {
    // await Provider.of<AviationProvider>(context, listen: false).fetchData();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const HomeScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image.asset(splashScreenImg),
      Positioned(
        left: SizeConfig.widthMultiplier * 32.0,
        top: SizeConfig.heightMultiplier * 46.0,
        child: SizedBox(
          height: SizeConfig.heightMultiplier * 10.0,
          width: SizeConfig.widthMultiplier * 40,
          child: SvgPicture.asset(
            controlTowerImg,
            height: 20,
            width: 20,
          ),
        ),
      )
    ]));
  }
}
         /* Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: padding * 10.0),
            child: Column(
              children: [
                Image.asset(
                  cloudyImg,
                  width: SizeConfig.imageSizeMultiplier * 50.0,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3.0,
                ),
                Text(
                  "Aviation MET Nepal",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: SizeConfig.textMultiplier * 3.5,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 10.0,
                  width: SizeConfig.widthMultiplier * 40,
                  child: Image.asset(
                    splashImg,
                    scale: 1.5,
                    width: SizeConfig.widthMultiplier * 5.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 5.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: padding * 1.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(logoImg,
                    width: SizeConfig.widthMultiplier * 22.0,
                    height: SizeConfig.widthMultiplier * 22.0),
                SizedBox(
                  width: SizeConfig.widthMultiplier,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Government of Nepal",
                      style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 1.7,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("Department of Hydrology and Meterology",
                        style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 1.7,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                    Text(
                      "Meteorology Forecasting Division",
                      style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 2.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]) */
  

