import 'package:aviation_met_nepal/constant/images.dart';
import 'package:aviation_met_nepal/provider/login_provider.dart';
import 'package:aviation_met_nepal/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  // duration of splash screen on second
  int splashTime = 3;

  @override
  void initState() {
    Provider.of<LoginProvider>(context, listen: false)
        .readFromSecureStorage()
        .then(
          (value) => Future.delayed(
            Duration(seconds: splashTime),
            () async {
              await navigateToHome();
            },
          ),
        );

    super.initState();
  }

  navigateToHome() async {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return const HomeScreen();
    }), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SplashScreenBody(),
      ),
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
      Column(
        children: [
          Image.asset(
            splashScreenImg,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          Image.asset(
            gifImg,
            height: 60.h,
            width: 80.w,
          ),
          const Spacer(),
          Image.asset(
            governmentImg,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    ]);
  }
}
