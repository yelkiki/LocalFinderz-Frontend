// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/screens/cart.dart';
import 'package:local_finderzzz/screens/fav.dart';
import 'package:local_finderzzz/screens/home.dart';
import 'package:local_finderzzz/screens/info.dart';
import 'package:local_finderzzz/screens/settings.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _selectedIndex = 2;

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
      
      extendBody: true,
      // backgroundColor: Colors.transparent,
    
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.black,
        color: Colors.black,
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
            color: secondColor,                  
          ),
    
          Icon(
            Icons.favorite,
            color: secondColor,
          ),
    
          Icon(
            Icons.home,
            color: secondColor,
          ),
    
          Icon(
            Icons.settings,
            color: secondColor,
          ),
    
          Icon(
            Icons.shopping_cart,
            color: secondColor,
          ),
    
        ],
        
      ),
    
      body: Stack(
        children: [
          Positioned.fill(
            child: _pages[_selectedIndex],
          ),
          
        ],
      ),
    );
  }
}

