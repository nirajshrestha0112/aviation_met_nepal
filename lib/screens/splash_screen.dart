import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/screens/home_screen.dart';
import 'package:aviation_met_nepal/utils/get_device_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return const HomeScreen();
    }), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(body: SplashScreenBody()),
    );
  }
}

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        splashScreenImg,
        fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
      Positioned(
        left: DeviceUtil.isMobile ? 160.w : 160.w,
        top: DeviceUtil.isMobile ? 370.h : 380.h,
        child: Image.asset(
          gifImg,
          height: 60.h,
          width: 80.w,
        ),
      )
    ]);
  }
}
