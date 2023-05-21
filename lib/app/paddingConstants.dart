import 'package:flutter/material.dart';

class PaddingConstants {

  static const double designHeight = 852;
  static const double designWidth = 393;

  EdgeInsets onlyLeftMedium = EdgeInsets.only(
    left: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width/(designWidth / 20)
  );

  EdgeInsets verticalSmall = EdgeInsets.symmetric(
    vertical: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height/(designHeight / 10),
  );

  EdgeInsets verticalMedium = EdgeInsets.symmetric(
    vertical: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height/(designHeight / 20),
  );

  EdgeInsets verticalLarge = EdgeInsets.symmetric(
    vertical: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height/(designHeight / 32),
  );



  EdgeInsets horizontalSmall = EdgeInsets.symmetric(
      horizontal: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width/(designWidth / 10)
  );

  EdgeInsets horizontalMedium = EdgeInsets.symmetric(
    horizontal: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width/(designWidth / 20)
  );

  EdgeInsets horizontalLarge = EdgeInsets.symmetric(
      horizontal: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width/(designWidth / 32)
  );

  EdgeInsets allSmall = EdgeInsets.symmetric(
    vertical: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height/(designHeight / 12),
    horizontal: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width/(designWidth / 12)
  );
  EdgeInsets allMedium = EdgeInsets.symmetric(
    vertical: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height/(designHeight / 20),
    horizontal: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width/(designWidth / 20)
  );
  EdgeInsets allLarge = EdgeInsets.symmetric(
    vertical: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height/(designHeight / 24),
    horizontal: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width/(designWidth / 24)
  );

}