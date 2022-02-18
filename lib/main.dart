import 'package:aviation_met_nepal/constant/routes.dart';
import 'package:aviation_met_nepal/provider/connectivity_provider.dart';
import 'package:aviation_met_nepal/screens/contact_us_screen.dart';
import 'package:aviation_met_nepal/screens/feedback_screen.dart';
import 'package:aviation_met_nepal/screens/home_screen.dart';
import 'package:aviation_met_nepal/screens/internet_connection_screen.dart';
import 'package:aviation_met_nepal/screens/lighting_data.dart';
import 'package:aviation_met_nepal/screens/login_screen.dart';
import 'package:aviation_met_nepal/screens/details_screen.dart';
import 'package:aviation_met_nepal/screens/splash_screen.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ConnectivityProvider())
      ],
      child: LayoutBuilder(builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          final checkProvider = Provider.of<ConnectivityProvider>(context);
          SizeConfig().init(constraints, orientation);
          return MaterialApp(
            theme:ThemeData(
              
            ),
            debugShowCheckedModeBanner: false,
            title: 'Aviation Met Nepal',
            //initialRoute: feedbackScreen,
            home: checkProvider.isConnected
                ? const SplashScreen()
                : const InternetConnectionScreen(),
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
      }),
    );
  }
}

/* class InternetConnectivityScreen extends StatefulWidget {
  const InternetConnectivityScreen({Key? key}) : super(key: key);

  @override
  _InternetConnectivityScreenState createState() =>
      _InternetConnectivityScreenState();
}

class _InternetConnectivityScreenState
    extends State<InternetConnectivityScreen> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connectivity example app'),
      ),
      body: Center(
          child: Text('Connection Status: ${_connectionStatus.toString()}')),
    );
  }
} */
