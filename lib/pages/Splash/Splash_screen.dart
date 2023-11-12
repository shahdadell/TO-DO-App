import 'dart:async';
import 'package:flutter/material.dart';
import 'package:htodo/HomeScreen/HomeScreen.dart';
import 'package:htodo/pages/login/login_view1.dart';

class Splash extends StatelessWidget{
  static const routeName = "Splash";

  const Splash({super.key});
  @override
  Widget build(BuildContext context) {
   Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      Navigator.pushReplacementNamed(context,LoginView.routeName);
    });
    return Scaffold(
      body: Image.asset("assets/images/splash.png"),

    );
  }

}