// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:local_finderzzz/screens/cart.dart';
import 'package:local_finderzzz/screens/fav.dart';
import 'package:local_finderzzz/screens/home.dart';
import 'package:local_finderzzz/screens/info.dart';
import 'package:local_finderzzz/screens/settings.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _selectedIndex = 2;

  // final navigationKey = GlobalKey<CurvedNavigationBarState>();

  void _navigateBottomBar (int index){
    setState(() {
      _selectedIndex = index;
    }); 
  }

  final List<Widget> _pages = [    
    UserInfo(),
    Favourite(),
    HomePage(),
    Settings(),
    Cart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      backgroundColor: Colors.transparent,
      
      bottomNavigationBar: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            
            padding: const EdgeInsets.only(bottom: 30),

            child: CurvedNavigationBar(

              // key: navigationKey,
              backgroundColor: Colors.deepPurple,
              color: Colors.deepPurple.shade200,              
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 300),             
              height: 70,
              onTap:(index) {
                _navigateBottomBar(index);
              },
              
              index: _selectedIndex,
              
              items: const [
                
                Icon(
                  Icons.person,
                  color: Colors.white,                  
                ),

                Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),

                Icon(
                  Icons.home,
                  color: Colors.white,
                ),

                Icon(
                  Icons.settings,
                  color: Colors.white,
                ),

                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),

              ],
              
            ),
          ),
        ),
    );
  }
}