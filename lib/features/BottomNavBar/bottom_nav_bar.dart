import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:local_finderzzz/screens/cart.dart';
import 'package:local_finderzzz/screens/home.dart';
import 'package:local_finderzzz/screens/info.dart';
import 'package:local_finderzzz/screens/settings.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _selectedIndex = 0;

  void _navigateBottomBar (int index){
    setState(() {
      _selectedIndex = index;
    }); 
  }

  final List<Widget> _pages = [
   const HomePage(),
   const UserInfo(),
   const Settings(),
   const Cart(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: CurvedNavigationBar(             
              backgroundColor: Colors.purple,
              color: Colors.white,
              buttonBackgroundColor: Colors.white,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 300),             
              height: 70,
              onTap: (index) {
                _navigateBottomBar(index);
              },
              items: const [
                Icon(Icons.home),
                Icon(Icons.person),
                Icon(Icons.settings),
                Icon(Icons.shopping_cart),
              ],
            ),
          ),
        ),
    );
  }
}