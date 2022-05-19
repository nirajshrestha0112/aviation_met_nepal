import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityProvider extends ChangeNotifier {
  final Connectivity _connectivity = Connectivity();

  bool isOnline = true;

  Future<void> checkIsOnline() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');
      if (response.isNotEmpty) {
        isOnline = true;
      } else {
        isOnline = false;
      }
    } on SocketException {
      isOnline = false;
    }
  }

  ConnectivityProvider() {
    checkIsOnline();
  }

  void monitorConnection(BuildContext context) async {
    _connectivity.onConnectivityChanged.listen((event) async {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi ||
          event == ConnectivityResult.bluetooth) {
        await checkIsOnline();

        // if (isOnline) {
        //   if (Provider.of<AirportListProvider>(context, listen: false)
        //           .airportData ==
        //       null) {
        //     Provider.of<AirportListProvider>(context, listen: false)
        //         .fetchAirportList();
        //   }
        // }
        notifyListeners();
      } else {
        isOnline = false;
        notifyListeners();
      }
    });
  }
}
