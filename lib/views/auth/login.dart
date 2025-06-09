import 'package:flutter/material.dart';
import 'package:penger/resources/apcolors.dart';
import 'package:penger/resources/appstyles.dart';

class Loginview extends StatefulWidget {
  const Loginview({super.key});

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.bgColor,
      appBar: AppBar(
        backgroundColor: Appcolors.bgColor,
        title: Text('Login',style: Appstyles.bartitle(),),
        centerTitle: true,
      ),
      body: Column(

      ),
    );
  }
}