import 'dart:async';
import 'package:flutter/material.dart';
import 'package:htodo/HomeScreen/HomeScreen.dart';
import 'package:htodo/pages/Splash/Splash_screen.dart';
import 'package:htodo/pages/login/login_view1.dart';
import 'package:htodo/pages/register/register.dart';
import 'Theme/Theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return MaterialApp(
      theme: AppTheme.lightTheme,
      routes: {
        Splash.routeName:(context)=> Splash(),
        HomeScreen.routeName:(context)=>  HomeScreen(),
        LoginView.routeName:(context)=>  LoginView(),
        RegisterView.routeName:(context)=>  RegisterView()
      },
      initialRoute: Splash.routeName,

    );
  }
}

