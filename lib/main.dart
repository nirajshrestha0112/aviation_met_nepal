import 'package:aviation_met_nepal/constant/colors.dart';
import 'package:aviation_met_nepal/constant/routes.dart';
import 'package:aviation_met_nepal/provider/airmet_data_provider.dart';
import 'package:aviation_met_nepal/provider/airport_list_provider.dart';
import 'package:aviation_met_nepal/provider/connectivity_provider.dart';
import 'package:aviation_met_nepal/provider/login_provider.dart';
import 'package:aviation_met_nepal/provider/metar_data_provider.dart';
import 'package:aviation_met_nepal/provider/sigmets_data_provider.dart';
import 'package:aviation_met_nepal/provider/tafs_provider.dart';
import 'package:aviation_met_nepal/screens/contact_us_screen.dart';
import 'package:aviation_met_nepal/screens/feedback_screen.dart';
import 'package:aviation_met_nepal/screens/custom_screen.dart';
import 'package:aviation_met_nepal/screens/home_screen.dart';
import 'package:aviation_met_nepal/screens/lighting_screen.dart';
import 'package:aviation_met_nepal/screens/login_screen.dart';
import 'package:aviation_met_nepal/screens/details_screen.dart';
import 'package:aviation_met_nepal/screens/satellite_screen.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'provider/ashtams_data_provider.dart';
import 'provider/gamet_data_provider.dart';
import 'provider/lighting_data_provider.dart';
import 'provider/opmet_data_provider.dart';
import 'provider/satellite_image_provider.dart';
import 'screens/internet_connection_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AirportListProvider(),
        ),
        ChangeNotifierProvider(create: (_) => ConnectivityProvider()),
        ChangeNotifierProvider(create: (_) => TafsDataProvider()),
        ChangeNotifierProvider(create: (_) => MetarDataProvider()),
        ChangeNotifierProvider(create: (_) => SigmetsDataProvider()),
        ChangeNotifierProvider(create: (_) => AirmetDataProvider()),
        ChangeNotifierProvider(create: (_) => GametDataProvider()),
        ChangeNotifierProvider(create: (_) => OpmetDataProvider()),
        ChangeNotifierProvider(create: (_) => AshtamsDataProvider()),
        ChangeNotifierProvider(create: (_) => SatelliteImageProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => LightingDataProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    // Provider.of<AviationProvider>(context, listen: false).fetchData();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: iconColor.withOpacity(0.8)),
    );
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        final checkProvider = Provider.of<ConnectivityProvider>(context);

        SizeConfig().init(constraints, orientation);
        return MaterialApp(
          theme: ThemeData(),
          debugShowCheckedModeBanner: false,
          title: 'Aviation Met Nepal',
          initialRoute: loginScreen,
          /*  home: checkProvider.isConnected
              ? const SplashScreen()
              : const InternetConnectionScreen(), */
          routes: {
            homeScreen: (context) => const HomeScreen(),
            nextScreen: (context) => const DetailsScreen(),
            feedbackScreen: (context) => const FeedBack(),
            contactScreen: (context) => const ContactUs(),
            loginScreen: (context) => const LoginPage(),
            lightingDataScreen: (context) => const LightingData(),
            notificationScreen: (context) => const Scaffold(),
            IcingTurbulenceChartScreen: (context) => const Scaffold(),
            weatherCameraImagesScreen: (context) => const Scaffold(),
            SatelliteImageDataScreen: (context) =>
                const SatelliteScreen(screenName: "Satellite Images"),
            windChartScreen: (context) => const Scaffold(),
            sigwxChartScreen: (context) => const Scaffold(),
            weatherForecastScreen: (context) => const Scaffold(),
            AirmetDataScreen: (context) =>
                const CustomScreen(screenName: "Airmet Data"),
            AshtamsDataScreen: (context) =>
                const CustomScreen(screenName: "Ashtams Data"),
            gametDataScreen: (context) =>
                const CustomScreen(screenName: "Gamet Data"),
            opmetDataScreen: (context) =>
                const CustomScreen(screenName: "Opmet Data")
          },
          // theme: ThemeData(),
        );
      });
    });
  }
}
