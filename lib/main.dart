import 'package:flutter/material.dart';
import 'package:penger/resources/apcolors.dart';
import 'package:penger/resources/app_routes.dart';
import 'package:penger/views/auth/login.dart';
import 'package:penger/views/auth/signup.dart';
import 'package:penger/views/onboarding/splashview.dart';
import 'package:penger/views/onboarding/walkthrought.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpTracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Manrope',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16),
          bodyMedium: TextStyle(fontSize: 14),
          labelLarge: TextStyle(fontWeight: FontWeight.w600),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Appcolors.primaryColor),
      ),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => Splashview(),
        AppRoutes.walkthrought: (context) => Walkthrought(),
        AppRoutes.signup:(context) => Signupview(),
        AppRoutes.login:(context)=> Loginview(),
      },
    );
  }
}
