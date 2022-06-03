import 'package:flutter/cupertino.dart';

import '../widgets/menu_bottom_sheet.dart';

class CheckingModalSheet extends ChangeNotifier {
  bool isShowing = true;

  checkingModalSheet(context) {
    if (isShowing) {
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => ShowMenuBottomSheet.showMenuBottomSheet(context: context));
      isShowing = !isShowing;
    }
  }
}
