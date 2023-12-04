// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:local_finderzzz/features/BottomNavBar/bottom_nav_bar.dart';
import 'package:local_finderzzz/features/register/forget_password.dart';
import 'package:local_finderzzz/features/register/login.dart';
import 'package:local_finderzzz/features/register/new_password.dart';
import 'package:local_finderzzz/features/register/signup.dart';
import 'package:local_finderzzz/features/register/verify.dart';
import 'package:local_finderzzz/features/register/welcome_screen.dart';
import 'package:local_finderzzz/features/splash/splash_view.dart';
import 'package:local_finderzzz/screens/cart.dart';
import 'package:local_finderzzz/screens/fav.dart';
import 'package:local_finderzzz/screens/home.dart';
import 'package:local_finderzzz/screens/info.dart';
import 'package:local_finderzzz/screens/settings.dart';


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
        '/verify' : (context) => const VerifyToken(),
        '/newpass' : (context) => const NewPassword(),
        '/home' : (context) => const HomePage(),
        '/bottomNavBar' : (context) => const BottomNavBar(),
        '/settings' : (context) => const Settings(),
        '/userInfo' : (context) => const UserInfo(),
        '/cart' : (context) => const Cart(),
        '/fav' : (context) => const Favourite(),
      },
    );
  }
}
