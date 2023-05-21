import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oneloc_use_case/features/home/homePage.dart';
import 'package:oneloc_use_case/features/home/homeProvider.dart';
import 'package:oneloc_use_case/features/login/loginPage.dart';
import 'package:oneloc_use_case/features/onBoard/onBoard.dart';
import 'package:oneloc_use_case/features/login/loginProvider.dart';
import 'package:oneloc_use_case/features/register/registerProvider.dart';
import 'package:oneloc_use_case/features/register/registerPage.dart';
import 'package:oneloc_use_case/features/splash/splashProvider.dart';
import 'package:oneloc_use_case/features/splash/splashScreen.dart';
import 'package:provider/provider.dart';
void main() {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    )
  );

  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => RegisterProvider(),
        ),
        Provider(
          create: (context) => LoginProvider(),
        ),
        Provider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SplashProvider(),
        )
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<SplashProvider>().getTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        '/splash': (context) => SplashScreen(),
        '/onboard': (context) => OnBoard(),
        '/register': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage()
      },
      initialRoute: '/splash',
    );
  }


}