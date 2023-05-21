import 'package:flutter/material.dart';
import 'package:oneloc_use_case/features/splash/splashProvider.dart';
import 'package:provider/provider.dart';

Switch CustomSwitchTheme(BuildContext context) {
  return Switch(
    value: context.watch<SplashProvider>().getThemeBoolean,
    //activeThumbImage: const AssetImage("assets/logo.png"),
    activeColor: Theme.of(context).colorScheme.primary,
    activeTrackColor: Colors.white,
    //inactiveThumbImage: const AssetImage("assets/rainRight.png"),
    inactiveThumbColor: Theme.of(context).colorScheme.primary,
    inactiveTrackColor: Theme.of(context).colorScheme.surface,
    onChanged: (newValue) {
      context.read<SplashProvider>().toggleTheme();
    },
  );
}