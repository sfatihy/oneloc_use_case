import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oneloc_use_case/app/imageConstants.dart';
import 'package:oneloc_use_case/features/splash/splashProvider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 2000), () {

      userCheck();

    });
  }

  Future userCheck() async {
    if(await context.read<SplashProvider>().userCheck()) {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    }
    else {
      Navigator.pushNamedAndRemoveUntil(context, '/onboard', (route) => false);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            SvgPicture.asset(ImageConstants.splash_icon),
            const Spacer(),
            SvgPicture.asset(ImageConstants.splash_logo),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
