// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          title: Text(
            "B r a n d   O w n e r",
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "blacklisted"
            ),
          ),
          automaticallyImplyLeading: false,
          elevation: 2.0.h,
          
          toolbarHeight: SizeConfig.defaultSize! * 7,
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  eswed,
                  redColor,
                  eswed,
                ]
              ),
            ),
          ),
        ),

        body: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                eswed,
                redColor,
                eswed,
              ]
            ),
          ),
          child: Column(
            children: [

              SizedBox(
                height: SizeConfig.defaultSize! * 6,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/addproduct");
                },
                child: Container(
                  height: SizeConfig.defaultSize! * 6,
                  width: SizeConfig.defaultSize! * 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.w),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    )
                  ),
                          
                  child: Center(
                    child: Text(
                      "Add product",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: "blacklisted",
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: SizeConfig.defaultSize! * 3,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/removeproduct");
                },
                child: Container(
                  height: SizeConfig.defaultSize! * 6,
                  width: SizeConfig.defaultSize! * 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.w),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    )
                  ),
                          
                  child: Center(
                    child: Text(
                      "remove product",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: "blacklisted",
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: SizeConfig.defaultSize! * 3,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/updatequantity");
                },
                child: Container(
                  height: SizeConfig.defaultSize! * 6,
                  width: SizeConfig.defaultSize! * 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.w),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    )
                  ),
                          
                  child: Center(
                    child: Text(
                      "update quantity",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: "blacklisted",
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: SizeConfig.defaultSize! * 3,
              ),

              

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/login");
                },
                child: Container(
                  height: SizeConfig.defaultSize! * 6,
                  width: SizeConfig.defaultSize! * 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.w),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    )
                  ),
                          
                  child: Center(
                    child: Text(
                      "Log out",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: "blacklisted",
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}