import 'package:aviation_met_nepal/provider/connectivity_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

getIsOnline(BuildContext context) {
  return Provider.of<ConnectivityProvider>(context, listen: false).isOnline;
}