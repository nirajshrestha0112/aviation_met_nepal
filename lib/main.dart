import 'package:aviation_met_nepal/constant/routes.dart';
import 'package:aviation_met_nepal/screens/contact_us_screen.dart';
import 'package:aviation_met_nepal/screens/feedback_screen.dart';
import 'package:aviation_met_nepal/screens/home_screen.dart';
import 'package:aviation_met_nepal/screens/lighting_data.dart';
import 'package:aviation_met_nepal/screens/login_screen.dart';
import 'package:aviation_met_nepal/screens/details_screen.dart';
import 'package:aviation_met_nepal/screens/splash_screen.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Aviation Met Nepal',
          initialRoute: feedbackScreen,
          // home: const SplashScreen(),
          routes: {
            homeScreen: (context) => const HomeScreen(),
            nextScreen: (context) => const NextScreen(),
            feedbackScreen: (context) => const FeedBack(),
            contactScreen: (context) => const ContactUs(),
            loginScreen: (context) => const LoginPage(),
            lightingDataScreen: (context) => const LightingData(),
            notificationScreen: (context) => const Scaffold(),
            IcingTurbulenceChartScreen: (context) => const Scaffold(),
            weatherCameraImagesScreen: (context) => const Scaffold(),
            satelliteImagesScreen: (context) => const Scaffold(),
            windChartScreen: (context) => const Scaffold(),
            sigwxChartScreen: (context) => const Scaffold(),
            weatherForecastScreen: (context) => const Scaffold(),
            AirmetDataScreen: (context) => const Scaffold(),
            AshtamsDataScreen: (context) => const Scaffold(),
            gametDataScreen: (context) => const Scaffold(),
            opmetDataScreen: (context) => const Scaffold()
          },
   // theme: ThemeData(),
        );
      });
    });
  }
}
