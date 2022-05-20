import 'package:aviation_met_nepal/model/custom_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/routes.dart';
import '../provider/connectivity_provider.dart';
import '../provider/login_provider.dart';
import 'show_internet_connection_snack_bar.dart';

/// method to check internet, is user logged in and navigate to screen if
/// condition is satisfied.
checkInternetLoginAndNavigate(BuildContext context, CustomMenu customMenu) {
  /// checking if user has logined
  bool isUserLoggedIn =
      Provider.of<LoginProvider>(context, listen: false).loginName == null
          ? false
          : true;

  /// checking if menu is home
  if (customMenu.isHome) {
    Navigator.pop(context);
    return;
  }

  /// checking if device is offline then showing error and exiting this function.
  if (!getIsOnline(context)) {
    Navigator.pop(context);
    showInternetConnectionSnackBar(
        icon: Icons.close,
        crossAxisAlignment: CrossAxisAlignment.center,
        bgColor: Colors.red,
        circleAvatarBgColor: Colors.white,
        iconColor: Colors.red,
        statusText: "Error",
        message: 'Cannot get ${customMenu.title}. Please try again');
    return;
  }

  /// checking if this menu user can use this menu without login and exiting this function.
  if (!customMenu.needLogin) {
    Navigator.pushNamed(context, customMenu.navigateTo);
    return;
  }

  /// checking if user is not logged in then navigating to login screen.
  if (!isUserLoggedIn) {
    Navigator.pushNamed(context, loginRoute);
    return;
  }

  /// if device is online, login is required and user has logged in already then
  /// navigation to required page
  Navigator.pushNamed(context, customMenu.navigateTo);
}
