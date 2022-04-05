import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/constant/routes.dart';
import 'package:aviation_met_nepal/provider/airmet_data_provider.dart';
import 'package:aviation_met_nepal/provider/airport_list_provider.dart';
import 'package:aviation_met_nepal/provider/connectivity_provider.dart';
import 'package:aviation_met_nepal/provider/login_provider.dart';
import 'package:aviation_met_nepal/provider/metar_data_provider.dart';
import 'package:aviation_met_nepal/provider/privacy_policy_provider.dart';
import 'package:aviation_met_nepal/provider/sigmets_data_provider.dart';
import 'package:aviation_met_nepal/provider/tafs_provider.dart';
import 'package:aviation_met_nepal/screens/contact_us_screen.dart';
import 'package:aviation_met_nepal/screens/custom_screen.dart';
import 'package:aviation_met_nepal/screens/home_screen.dart';
import 'package:aviation_met_nepal/screens/lighting_screen.dart';
import 'package:aviation_met_nepal/screens/login_screen.dart';
import 'package:aviation_met_nepal/screens/details_screen.dart';
import 'package:aviation_met_nepal/screens/satellite_screen.dart';
import 'package:aviation_met_nepal/theme/theme.dart';
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
        ChangeNotifierProvider(create: (_) => PrivacyPolicyProvider()),
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
      SystemUiOverlayStyle(statusBarColor: colorBlue.withOpacity(0.8)),
    );
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        final checkProvider = Provider.of<ConnectivityProvider>(context);

        SizeConfig().init(constraints, orientation);
        return MaterialApp(
          theme: lightTheme(context),
          debugShowCheckedModeBanner: false,
          title: 'Aviation Met Nepal',
          // initialRoute: homeRoute,
          home: checkProvider.isConnected
              ? const SplashScreen()
              : const InternetConnectionScreen(),
          routes: {
            splashRoute: (context) => const SplashScreen(),
            homeRoute: (context) => const HomeScreen(),
            detailsRoute: (context) => const DetailsScreen(),
            contactRoute: (context) => const ContactUs(),
            loginRoute: (context) => const LoginPage(),
            lightingDataRoute: (context) => const LightingData(),
            notificationRoute: (context) => const Scaffold(),
            icingTurbulenceChartRoute: (context) => const Scaffold(),
            weatherCameraImagesRoute: (context) => const Scaffold(),
            satelliteImageDataRoute: (context) =>
                const SatelliteScreen(screenName: "Satellite Images"),
            windChartRoute: (context) => const Scaffold(),
            sigwxChartRoute: (context) => const Scaffold(),
            weatherForecastRoute: (context) => const Scaffold(),
            airmetDataRoute: (context) =>
                const CustomScreen(screenName: "Airmet Data"),
            ashtamsDataRoute: (context) =>
                const CustomScreen(screenName: "Ashtams Data"),
            gametDataRoute: (context) =>
                const CustomScreen(screenName: "Gamet Data"),
            opmetDataRoute: (context) =>
                const CustomScreen(screenName: "Opmet Data"),
          },
        );
      });
    });
  }
}
