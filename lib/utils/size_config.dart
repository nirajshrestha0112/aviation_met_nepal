import 'package:flutter/cupertino.dart';

class SizeConfig {
  static double ?_screenWidth;
  static double ?_screenHeight;
  static double _blockSizeHorizontal = 0;
  static double _blockSizeVertical = 0;

  static double ?textMultiplier;
  static double ?imageSizeMultiplier;
  static double ?heightMultiplier;
  static double ?widthMultiplier;
  static bool isPotrait = true;
  static bool isMobilePotrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPotrait = true;
      if (_screenWidth !< 450) {
        isMobilePotrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPotrait = false;
      isMobilePotrait = false;
    }
    _blockSizeHorizontal = _screenWidth! / 100;
    _blockSizeVertical = _screenHeight !/ 100;

    textMultiplier = _blockSizeVertical;
    imageSizeMultiplier = _blockSizeHorizontal;
    heightMultiplier = _blockSizeVertical;
    widthMultiplier = _blockSizeHorizontal;
  }
}
