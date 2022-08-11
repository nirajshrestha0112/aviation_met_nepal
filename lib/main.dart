import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/constant/routes.dart';
import 'package:aviation_met_nepal/providers.dart';
import 'package:aviation_met_nepal/screens/contact_us_screen.dart';
import 'package:aviation_met_nepal/screens/custom_screen.dart';
import 'package:aviation_met_nepal/screens/details_screen.dart';
import 'package:aviation_met_nepal/screens/home_screen.dart';
import 'package:aviation_met_nepal/screens/icing_turbulence_screen.dart';
import 'package:aviation_met_nepal/screens/lighting_screen.dart';
import 'package:aviation_met_nepal/screens/login_screen.dart';
import 'package:aviation_met_nepal/screens/notifications_screen.dart';
import 'package:aviation_met_nepal/screens/satellite_screen.dart';
import 'package:aviation_met_nepal/screens/sigwx_chart_screen.dart';
import 'package:aviation_met_nepal/screens/weather_camera_images_screen.dart';
import 'package:aviation_met_nepal/screens/weather_forecast_screen.dart';
import 'package:aviation_met_nepal/screens/wind_chart_screen.dart';
import 'package:aviation_met_nepal/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'screens/splash_screen.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: listOfProviders,
      child: const MyApp(),
    ),
  );
}

final messengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: colorBlue.withOpacity(0.8)),
    );
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        return ScreenUtilInit(
            splitScreenMode: true,
            designSize: const Size(375, 812),
            builder: (BuildContext context, Widget? child) {
              return MaterialApp(
                scaffoldMessengerKey: messengerKey,
                builder: (BuildContext context, Widget? child) {
                  return MediaQuery(
                      data:
                          MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: child!);
                },
                theme: theme(context),
                debugShowCheckedModeBanner: false,
                title: 'Aviation Met Nepal',
                initialRoute: splashRoute,
                routes: {
                  splashRoute: (context) => const SplashScreen(),
                  sigwxChartRoute: (context) => const SigwxChartScreen(),
                  homeRoute: (context) => const HomeScreen(),
                  detailsRoute: (context) => const DetailsScreen(),
                  contactRoute: (context) => const ContactUs(),
                  loginRoute: (context) => const LoginPage(),
                  lightingDataRoute: (context) => const LightingData(),
                  notificationRoute: (context) => const NotificationScreen(),
                  icingTurbulenceChartRoute: (context) =>
                      const IcingTurbulenceScreen(),
                  weatherCameraImagesRoute: (context) =>
                      const WeatherCameraImagesScreen(),
                  satelliteImageDataRoute: (context) => const SatelliteScreen(),
                  windChartRoute: (context) => const WindChartScreen(),
                  airmetDataRoute: (context) =>
                      const CustomScreen(screenName: "Airmet Data"),
                  ashtamsDataRoute: (context) =>
                      const CustomScreen(screenName: "Ashtams Data"),
                  gametDataRoute: (context) =>
                      const CustomScreen(screenName: "Gamet Data"),
                  opmetDataRoute: (context) =>
                      const CustomScreen(screenName: "Opmet Data"),
                  weatherForecastRoute: ((context) =>
                      const WeatherForecastScreen())
                },
              );
            });
      });
    });
  }
}
