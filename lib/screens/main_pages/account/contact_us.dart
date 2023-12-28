// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        
        appBar: AppBar(
          title: Text(
            "C o n t a c t   u s",
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
        
        body: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),

          child: Column(
            children: [

              SizedBox(
                height: SizeConfig.defaultSize! * 20,
              ),

              Row(
                children: [

                  SizedBox(
                    width: SizeConfig.defaultSize! * 5,
                  ),

                  Text(
                    "Handaal",
                    style: TextStyle(
                      color: kMainColor,
                      fontFamily: "blacklisted",
                      fontSize: 18.sp,
                    ),
                  ),

                  SizedBox(
                    width: SizeConfig.defaultSize! * 2,
                  ),

                  Text(
                    "01029196012",
                    style: TextStyle(
                      color: kMainColor,
                      fontFamily: "blacklisted",
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: SizeConfig.defaultSize! * 5,
              ),

              Row(
                children: [

                  SizedBox(
                    width: SizeConfig.defaultSize! * 5,
                  ),

                  Text(
                    "Elkikiii",
                    style: TextStyle(
                      color: kMainColor,
                      fontFamily: "blacklisted",
                      fontSize: 18.sp,
                    ),
                  ),

                  SizedBox(
                    width: SizeConfig.defaultSize! * 4,
                  ),

                  Text(
                    "01151816234",
                    style: TextStyle(
                      color: kMainColor,
                      fontFamily: "blacklisted",
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: SizeConfig.defaultSize! * 5,
              ),

              Row(
                children: [

                  SizedBox(
                    width: SizeConfig.defaultSize! * 5,
                  ),

                  Text(
                    "Kemiii",
                    style: TextStyle(
                      color: kMainColor,
                      fontFamily: "blacklisted",
                      fontSize: 18.sp,
                    ),
                  ),

                  SizedBox(
                    width: SizeConfig.defaultSize! * 5,
                  ),

                  Text(
                    "01151868730",
                    style: TextStyle(
                      color: kMainColor,
                      fontFamily: "blacklisted",
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),



      ),
    );
  }
}