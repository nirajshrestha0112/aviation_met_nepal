import 'dart:async';

import 'package:aviation_met_nepal/constant/colors_properties.dart';
import 'package:aviation_met_nepal/provider/connectivity_provider.dart';
import 'package:aviation_met_nepal/screens/splash_screen.dart';
import 'package:aviation_met_nepal/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InternetConnectionScreen extends StatefulWidget {
  const InternetConnectionScreen({Key? key}) : super(key: key);

  @override
  _InternetConnectionScreenState createState() =>
      _InternetConnectionScreenState();
}

class _InternetConnectionScreenState extends State<InternetConnectionScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ConnectivityProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "No internet connection",
              style: TextStyle(
                color: const Color(textColor),
                fontSize: SizeConfig.textMultiplier * 2.5,
              ),
            ),
            Text(
              "Please retry to connect",
              style: TextStyle(
                color: colorBlue,
                fontSize: SizeConfig.textMultiplier * 2,
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: colorBlue,
              ),
              onPressed: () {
                provider.checkInternetConnection();
                if (provider.isConnected) {
                  Timer(const Duration(seconds: 0), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SplashScreen()),
                    );
                  });
                }
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
