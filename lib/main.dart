// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:local_finderzzz/register/forget_password.dart';
import 'package:local_finderzzz/register/login.dart';
import 'package:local_finderzzz/register/signup.dart';
import 'package:local_finderzzz/register/welcome_screen.dart';
import 'package:local_finderzzz/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
      routes: {
        '/login' : (context) => LoginPage(),
        '/signup' : (context) => SignUpPage(),
        '/welcome' : (context) => const WelcomeScreen(),
        '/forgetpass' : (context) => ForgetPassword(),
      },
    );
  }
}
