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
import 'package:local_finderzzz/screens/admin/delete_user.dart';
import 'package:local_finderzzz/screens/admin/remove_brand.dart';
import 'package:local_finderzzz/screens/admin/remove_product.dart';
import 'package:local_finderzzz/screens/admin/update_quantity.dart';
import 'package:local_finderzzz/screens/main_pages/account/about_app.dart';
import 'package:local_finderzzz/screens/main_pages/account/settings/account_settings/account_info.dart';
import 'package:local_finderzzz/screens/admin/add_brand.dart';
import 'package:local_finderzzz/screens/admin/add_product.dart';
import 'package:local_finderzzz/screens/main_pages/account/contact_us.dart';
import 'package:local_finderzzz/screens/main_pages/account/orders.dart';
import 'package:local_finderzzz/screens/main_pages/account/settings/settings.dart';
import 'package:local_finderzzz/screens/admin/admin.dart';
import 'package:local_finderzzz/screens/main_pages/brands/brand_view.dart';
import 'package:local_finderzzz/screens/main_pages/cart/cart.dart';
import 'package:local_finderzzz/screens/main_pages/categories/hoodies.dart';
import 'package:local_finderzzz/screens/main_pages/categories/pants.dart';
import 'package:local_finderzzz/screens/main_pages/categories/sets.dart';
import 'package:local_finderzzz/screens/main_pages/categories/tshirts.dart';
import 'package:local_finderzzz/screens/main_pages/products/product_view.dart';
import 'package:local_finderzzz/screens/main_pages/products/products.dart';
import 'package:local_finderzzz/screens/main_pages/home.dart';
import 'package:local_finderzzz/screens/main_pages/account/profile.dart';
import 'package:local_finderzzz/screens/main_pages/brands/brands.dart';
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
            '/profile' : (context) => const Profile(),
            '/cart' : (context) => const Cart(),
            '/products' : (context) =>  Products(),
            '/admin' : (context) => const AdminPage(),
            '/tshirts' : (context) =>  Tshirts(),
            '/pants' : (context) =>  Pants(),
            '/sets' : (context) =>  Sets(),
            '/hoodies' : (context) =>  Hoodies(),
            '/searchProducts' : (context) => const SearchProducts(),
            '/searchBrands' : (context) => const SearchBrands(),
            '/aboutapp' : (context) => const AboutApp(),
            '/settings' : (context) => const Settings(),
            '/orders' : (context) => const Orders(),
            '/contactus' : (context) => const ContactUs(),
            '/productview' : (context) => const ProductView(),
            '/brandview' : (context) => const BrandView(),
            '/accountinfo' : (context) => const AccountInfo(),
            '/addproduct' : (context) => AddProduct(),
            '/addbrand' : (context) => AddBrand(),
            '/removeproduct' : (context) => RemoveProduct(),
            '/updatequantity' : (context) => UpdateQuantity(),
            '/deleteuser' : (context) => DeleteUser(),
            '/removebrand' : (context) => RemoveBrand(),
          },
        );
      }
    );
  }
}


