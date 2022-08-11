import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'provider/airmet_data_provider.dart';
import 'provider/airport_list_provider.dart';
import 'provider/ashtams_data_provider.dart';
import 'provider/checking_modal_sheet.dart';
import 'provider/connectivity_provider.dart';
import 'provider/gamet_data_provider.dart';
import 'provider/lighting_data_provider.dart';
import 'provider/login_provider.dart';
import 'provider/metar_data_provider.dart';
import 'provider/opmet_data_provider.dart';
import 'provider/privacy_policy_provider.dart';
import 'provider/satellite_image_provider.dart';
import 'provider/sigmets_data_provider.dart';
import 'provider/tafs_provider.dart';
import 'provider/weather_camera_images_provider.dart';
import 'provider/weather_forecast_provider.dart';

final List<SingleChildWidget> listOfProviders=<SingleChildWidget> [
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
        ChangeNotifierProvider(create: (_) => WeatherCameraImagesProvider()),
      ];