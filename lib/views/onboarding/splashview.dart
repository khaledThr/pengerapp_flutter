import 'package:flutter/material.dart';
import 'package:penger/resources/apcolors.dart';
import 'package:penger/resources/app_routes.dart';
import 'package:penger/resources/appstyles.dart';

class Splashview extends StatefulWidget {
  const Splashview({super.key});

  @override
  State<Splashview> createState() => _SplashviewState();
}

class _SplashviewState extends State<Splashview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.primaryColor,
      body: Center(
        child: Text(
          'ExpTraker',
          style: Appstyles.titlex(size: 56, color: Colors.white),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, AppRoutes.walkthrought);
    });
  }
}
