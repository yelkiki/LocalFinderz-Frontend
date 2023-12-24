// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:local_finderzzz/features/BottomNavBar/bottom_nav_bar.dart';
import 'package:local_finderzzz/features/register/forget_password.dart';
import 'package:local_finderzzz/features/register/login.dart';
import 'package:local_finderzzz/features/register/new_password.dart';
import 'package:local_finderzzz/features/register/signup.dart';
import 'package:local_finderzzz/features/register/verify.dart';
import 'package:local_finderzzz/features/register/welcome_screen.dart';
import 'package:local_finderzzz/features/splash/splash_view.dart';
import 'package:local_finderzzz/screens/main_pages/admin.dart';
import 'package:local_finderzzz/screens/main_pages/cart.dart';
import 'package:local_finderzzz/screens/categories/hoodies.dart';
import 'package:local_finderzzz/screens/categories/pants.dart';
import 'package:local_finderzzz/screens/categories/sets.dart';
import 'package:local_finderzzz/screens/categories/tshirts.dart';
import 'package:local_finderzzz/screens/main_pages/products.dart';
import 'package:local_finderzzz/screens/main_pages/home.dart';
import 'package:local_finderzzz/screens/main_pages/info.dart';
import 'package:local_finderzzz/screens/main_pages/brands.dart';
import 'package:local_finderzzz/screens/search/search_brands.dart';
import 'package:local_finderzzz/screens/search/search_products.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
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
            '/home' : (context) =>  HomePage(),
            '/bottomNavBar' : (context) => const BottomNavBar(),
            '/brands' : (context) => Brands(),
            '/userInfo' : (context) => const UserInfo(),
            '/cart' : (context) => const Cart(),
            '/products' : (context) =>  Products(),
            '/admin' : (context) => const AdminPage(),
            '/tshirts' : (context) =>  Tshirts(),
            '/pants' : (context) =>  Pants(),
            '/sets' : (context) =>  Sets(),
            '/hoodies' : (context) =>  Hoodies(),
            '/searchProducts' : (context) => const SearchProducts(),
            '/searchBrands' : (context) => const SearchBrands(),
          },
        );
      }
    );
  }
}


