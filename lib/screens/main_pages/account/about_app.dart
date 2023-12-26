// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        
        appBar: AppBar(
          title: Text(
            "A b o u t   A p p",
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: "blacklisted",

            ),
          ),
          centerTitle: true,
          backgroundColor: kMainColor,
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
        
        body: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),

          child: Center(
            child: Text(
              "Application  Description",
              style: TextStyle(
                color: kMainColor,
                fontFamily: "blacklisted",
                fontSize: 18.sp,
              ),
            ),
          ),
        ),



      ),
    );
  }
}