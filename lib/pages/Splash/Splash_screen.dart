import 'dart:async';
import 'package:flutter/material.dart';
import 'package:htodo/HomeScreen/HomeScreen.dart';

class Splash extends StatelessWidget{
  static const routeName = "Splash";

  const Splash({super.key});
  @override
  Widget build(BuildContext context) {
   Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Scaffold(
      body: Image.asset("assets/images/splash.png"),

    );
  }

}