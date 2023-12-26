// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          title: Text(
            "A c c o u n t   I n f o",
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: "blacklisted",

            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 1.h,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              
            ),
          ),
        ),
        
      ),
    );
  }
}