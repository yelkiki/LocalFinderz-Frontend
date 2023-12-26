// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          title: Text(
            "A d m i n",
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
              color: kMainColor,
            ),
          ),
        ),

        body: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            color: kMainColor,
          ),
          child: Column(
            children: [

              SizedBox(
                height: SizeConfig.defaultSize! * 10,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/addbrand");
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
                      "Add brand",
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
                  /////////////////////////////
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
                      "remove brand",
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
                  /////////////////////////////
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
                  /////////////////////////////
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
                  /////////////////////////////
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
                      "delete user",
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