import 'package:flutter/cupertino.dart';
import '../widgets/custom_sheet.dart';

class CheckingModalSheet extends ChangeNotifier {
  bool isShowing = true;

  checkingModalSheet(context) {
    if (isShowing) {
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => ShowFabSheet.showFabSheet(context: context));
      isShowing = !isShowing;
    }
  }
}
