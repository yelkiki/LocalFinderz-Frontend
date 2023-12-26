// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:local_finderzzz/screens/main_pages/cart.dart';
import 'package:local_finderzzz/screens/main_pages/products.dart';
import 'package:local_finderzzz/screens/main_pages/home.dart';
import 'package:local_finderzzz/screens/main_pages/profile.dart';
import 'package:local_finderzzz/screens/main_pages/brands.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  final int _selectedIndex = 2;

  // void _navigateBottomBar (int index){
  //   setState(() {
  //     _selectedIndex = index;
  //   }); 
  // }

  final List<Widget> _pages = [    
    Profile(),
    Products(),
    HomePage(),
    Brands(),
    Cart(),
  ];

  @override
  Widget build(BuildContext context) {
    final token = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      
      
      // backgroundColor: Colors.transparent,
    
      bottomNavigationBar: CurvedNavigationBar(
        
        buttonBackgroundColor: Colors.grey.shade600,
        backgroundColor: Colors.black,
        color: Colors.black,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),   
        height: 70,
        onTap:(index) {
          // _navigateBottomBar(index);
          if (index == 0){
            Navigator.pushNamed(context, "/profile",arguments: token);
          }
          else if (index == 1){
            Navigator.pushNamed(context, "/products",arguments: token);
          }
          else if (index == 2){
            Navigator.pushNamed(context, "/home",arguments: token);
          }
          else if (index == 3){
            Navigator.pushNamed(context, "/brands",arguments: token);
          }
          else if (index == 4){
            Navigator.pushNamed(context, "/cart",arguments: token);
          }
        },
        
        index: _selectedIndex,
        
        items: const [
          
          Icon(
            Icons.person,
            color: secondColor,                  
          ),
    
          Icon(
            Icons.shopping_basket,
            color: secondColor,
          ),
    
          Icon(
            Icons.home,
            color: secondColor,
          ),
    
          Icon(
            Icons.shopping_bag,
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

