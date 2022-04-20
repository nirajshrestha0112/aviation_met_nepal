import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/constant/routes.dart';
import 'package:aviation_met_nepal/provider/airmet_data_provider.dart';
import 'package:aviation_met_nepal/provider/airport_list_provider.dart';
import 'package:aviation_met_nepal/provider/checking_modal_sheet.dart';
import 'package:aviation_met_nepal/provider/weather_forecast_provider.dart';
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
import 'package:aviation_met_nepal/screens/weather_forecast_screen.dart';
import 'package:aviation_met_nepal/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'provider/ashtams_data_provider.dart';
import 'provider/gamet_data_provider.dart';
import 'provider/lighting_data_provider.dart';
import 'provider/opmet_data_provider.dart';
import 'provider/satellite_image_provider.dart';
import 'screens/splash_screen.dart';


final messengerKey = GlobalKey<ScaffoldMessengerState>();
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
        ChangeNotifierProvider(create: (_) => CitiesProvider()),
        ChangeNotifierProvider(create: (_) => WeatherForecastProvider()),
        ChangeNotifierProvider(create: (_) => CheckingModalSheet()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: colorBlue.withOpacity(0.8)),
    );
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        return ScreenUtilInit(
          designSize: const Size(360, 723),
          builder: () => MaterialApp(
            builder: (context, child) {
              ScreenUtil.setContext(context);
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: child!,
              );
            },
            theme: theme(context),
            scaffoldMessengerKey: messengerKey,
            debugShowCheckedModeBanner: false,
            title: 'Aviation Met Nepal',
            initialRoute: homeRoute,
            // home: const SplashScreen(),
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
                  const SatelliteScreen(),
              windChartRoute: (context) => const Scaffold(),
              sigwxChartRoute: (context) => const Scaffold(),
              airmetDataRoute: (context) =>
                  const CustomScreen(screenName: "Airmet Data"),
              ashtamsDataRoute: (context) =>
                  const CustomScreen(screenName: "Ashtams Data"),
              gametDataRoute: (context) =>
                  const CustomScreen(screenName: "Gamet Data"),
              opmetDataRoute: (context) =>
                  const CustomScreen(screenName: "Opmet Data"),
              weatherForecastRoute: ((context) => const WeatherForecastScreen())
            },
          ),
        );
      });
    });
  }
}
