// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  // final String imageURL = "https://drive.google.com/uc?export=download&id=12n7EUGdBtbEfdCyEdMZ-WyrFP3KfXLBT";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
             
        extendBody: true,

        appBar: AppBar(
          title: Text(
            "A c c o u n t",
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: "blacklisted",

            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 1.h,
          automaticallyImplyLeading: false,
        ),

        body: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                kMainColor,
                thirdColor,
                kMainColor,
              ]
            ),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              SizedBox(
                height: SizeConfig.defaultSize! * 5,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/settings");
                },
                child: Container(
                  height: SizeConfig.defaultSize! * 7,
                  width: SizeConfig.defaultSize! * 40,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    )
                  ),
                  child: Row(
                    children: [
              
                      SizedBox(
                        width: SizeConfig.defaultSize,
                      ),
              
                      Container(
                        height: SizeConfig.defaultSize! * 6,
                        width: SizeConfig.defaultSize! * 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage("assets/images/Handaaal.png.jpg"),
                            fit: BoxFit.fitWidth,
                          )
                        ),
                        
                      ),
              
                      SizedBox(
                        width: SizeConfig.defaultSize! * 2,
                      ),
              
                      Center(
                        child: Text(
                          "H a n d a a l",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "blacklisted",
                            fontSize: 15.sp,                
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/orders");
                },
                child: Container(
                  height: SizeConfig.defaultSize! * 7,
                  width: SizeConfig.defaultSize! * 40,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    )
                  ),
                  child: Row(
                    children: [
              
                      SizedBox(
                        width: SizeConfig.defaultSize! * 2,
                      ),
              
                      Icon(
                        Icons.book,
                        color: Colors.white,
                        size: SizeConfig.defaultSize! * 3,
                      ),
              
                      SizedBox(
                        width: SizeConfig.defaultSize! * 2,
                      ),
              
                      Center(
                        child: Text(
                          "Y o u r   o r d e r s",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "blacklisted",
                            fontSize: 15.sp,                
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/contactus");
                },
                child: Container(
                  height: SizeConfig.defaultSize! * 7,
                  width: SizeConfig.defaultSize! * 40,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    )
                  ),
                  child: Row(
                    children: [
              
                      SizedBox(
                        width: SizeConfig.defaultSize! * 2,
                      ),
              
                      Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: SizeConfig.defaultSize! * 3,
                      ),
              
                      SizedBox(
                        width: SizeConfig.defaultSize! * 2,
                      ),
              
                      Center(
                        child: Text(
                          "C o n t a c t   u s",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "blacklisted",
                            fontSize: 15.sp,                
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/aboutapp");
                },
                child: Container(
                  height: SizeConfig.defaultSize! * 7,
                  width: SizeConfig.defaultSize! * 40,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    )
                  ),
                  child: Row(
                    children: [
              
                      SizedBox(
                        width: SizeConfig.defaultSize! * 2,
                      ),
              
                      Icon(
                        Icons.info,
                        color: Colors.white,
                        size: SizeConfig.defaultSize! * 3,
                      ),
              
                      SizedBox(
                        width: SizeConfig.defaultSize! * 2,
                      ),
              
                      Center(
                        child: Text(
                          "A b o u t   a p p",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "blacklisted",
                            fontSize: 15.sp,                
                          ),
                        ),
                      ),
                    ],
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