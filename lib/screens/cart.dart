// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: Colors.transparent,
        // extendBody: true,
        body: Center(
          child: Text(
            "cart",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),



      ),
    );
  }
}