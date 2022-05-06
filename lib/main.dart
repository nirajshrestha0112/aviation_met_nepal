import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/constant/routes.dart';
import 'package:aviation_met_nepal/provider/airmet_data_provider.dart';
import 'package:aviation_met_nepal/provider/airport_list_provider.dart';
import 'package:aviation_met_nepal/provider/checking_modal_sheet.dart';
import 'package:aviation_met_nepal/provider/connectivity_provider.dart';
import 'package:aviation_met_nepal/provider/login_provider.dart';
import 'package:aviation_met_nepal/provider/metar_data_provider.dart';
import 'package:aviation_met_nepal/provider/privacy_policy_provider.dart';
import 'package:aviation_met_nepal/provider/sigmets_data_provider.dart';
import 'package:aviation_met_nepal/provider/tafs_provider.dart';
import 'package:aviation_met_nepal/provider/weather_forecast_provider.dart';
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
import 'package:aviation_met_nepal/utils/size_config.dart';
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
void main() async {
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
        SizeConfig().init(constraints, orientation);
        return ScreenUtilInit(
          // splitScreenMode: false,
          designSize: const Size(375, 812),
          builder: (_) => MaterialApp(
            scaffoldMessengerKey: messengerKey,
            builder: (BuildContext context, Widget? child) {
              ScreenUtil.init(context);
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: child!,
              );
            },
            theme: theme(context),
            debugShowCheckedModeBanner: false,
            title: 'Aviation Met Nepal',
            initialRoute: splashRoute,
            routes: {
              splashRoute: (context) => const SplashScreen(),
              '/sigwx': (context) => const SigwxChartScreen(),
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
              sigwxChartRoute: (context) => const SigwxChartScreen(),
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

// Future<void> downloadFileFTP(FTPConnect ftpConnect) async{
//     try {
//       bool bRes = await ftpConnect.connect();
//       _fileMock('/Meteorological Forecasting Division');
//       await ftpConnect!.downloadFileWithRetry('FL 390.gif', file!, pRetryCount: 1);
//       print('path2 : ${file!.path}');
//       await ftpConnect!.disconnect();

//       print('file Name : ${file!}');
//     }catch(e){
//       print('Error : ${e.toString()}');
//     }
// }
