import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/screens/home_screen.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';

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
    Future.delayed(Duration(seconds: splashtime), () async {
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
    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
        Image.asset(
          splashScreenImg,
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // height: MediaQuery.of(context).size.height * 100,
        ),
        Positioned(
          left: SizeConfig.widthMultiplier * 32.0,
          top: SizeConfig.heightMultiplier * 48.0,
          child: SizedBox(
            height: SizeConfig.heightMultiplier * 10.0,
            width: SizeConfig.widthMultiplier * 40,
            child: Image.asset(
              gifImg,
              height: 20,
              width: 20,
            ),
          ),
        )
      ])),
    );
  }
}
