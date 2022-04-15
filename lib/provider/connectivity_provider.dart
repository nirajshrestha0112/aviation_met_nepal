/* import 'dart:io';

import 'package:flutter/material.dart';

class ConnectivityProvider with ChangeNotifier {
  bool _isConnected = true;

  bool get isConnected => _isConnected;

  ConnectivityProvider() {
    checkInternetConnection();
  }

  Future<void> checkInternetConnection() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');
      if (response.isNotEmpty) {
        _isConnected = true;
      } else {
        _isConnected = false;
      }
    } on SocketException {
      _isConnected = false;
    }
    notifyListeners();
  }
} */

import 'dart:io';

import 'package:aviation_met_nepal/provider/airport_list_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConnectivityProvider extends ChangeNotifier {
  final Connectivity _connectivity = Connectivity();

  bool isOnline = true;

  checkIsOnline() async {
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
    notifyListeners();
  }

  ConnectivityProvider() {
    checkIsOnline();
  }

  monitorConnection(BuildContext context) async {
    _connectivity.onConnectivityChanged.listen((event) async {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi ||
          event == ConnectivityResult.bluetooth) {
        await checkIsOnline();
        if (isOnline) {
          if (Provider.of<AirportListProvider>(context, listen: false)
                  .airportData ==
              null) {
            Provider.of<AirportListProvider>(context, listen: false)
                .fetchAirportList(); 
          }
        }
      } else {
        isOnline = false;
      }
    });
    notifyListeners();
  }
}
