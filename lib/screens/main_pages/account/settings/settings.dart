// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

       
        appBar: AppBar(
          title: Text(
            "S e t t i n g s",
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              SizedBox(
                height: SizeConfig.defaultSize! * 5,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/accountinfo");
                },
                child: Container(
                  height: SizeConfig.defaultSize! * 7,
                  width: SizeConfig.defaultSize! * 40,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: kMainColor,
                      width: 3,
                    )
                  ),
                  child: Row(
                    
                    children: [

                      SizedBox(
                        width: SizeConfig.defaultSize! * 2,
                      ),
                                         
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "A c c o u n t   I n f o",
                          style: TextStyle(
                            color: kMainColor,
                            fontFamily: "blacklisted",
                            fontSize: 15.sp,                
                          ),
                        ),
                      ),

                      SizedBox(
                        width: SizeConfig.defaultSize! * 17.5,
                      ),

                      Icon(
                        Icons.keyboard_arrow_right,
                        color: kMainColor,
                        size: SizeConfig.defaultSize! * 4,
                      ),

                      

                    ],
                  ),
                ),
              ),

              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),

              GestureDetector(
                // onTap: () {
                //   Navigator.pushNamed(context, "/userinfo");
                // },
                child: Container(
                  height: SizeConfig.defaultSize! * 7,
                  width: SizeConfig.defaultSize! * 40,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: kMainColor,
                      width: 3,
                    )
                  ),
                  child: Row(
                    
                    children: [

                      SizedBox(
                        width: SizeConfig.defaultSize! * 2,
                      ),
                                         
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "S a v e d   A d d r e s s e s",
                          style: TextStyle(
                            color: kMainColor,
                            fontFamily: "blacklisted",
                            fontSize: 15.sp,                
                          ),
                        ),
                      ),

                      SizedBox(
                        width: SizeConfig.defaultSize! * 12.8,
                      ),

                      Icon(
                        Icons.keyboard_arrow_right,
                        color: kMainColor,
                        size: SizeConfig.defaultSize! * 4,
                      ),

                      

                    ],
                  ),
                ),
              ),

              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),

              GestureDetector(
                // onTap: () {
                //   Navigator.pushNamed(context, "/userinfo");
                // },
                child: Container(
                  height: SizeConfig.defaultSize! * 7,
                  width: SizeConfig.defaultSize! * 40,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: kMainColor,
                      width: 3,
                    )
                  ),
                  child: Row(
                    
                    children: [

                      SizedBox(
                        width: SizeConfig.defaultSize! * 2,
                      ),
                                         
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "C h a n g e   e-m a i l",
                          style: TextStyle(
                            color: kMainColor,
                            fontFamily: "blacklisted",
                            fontSize: 15.sp,                
                          ),
                        ),
                      ),

                      SizedBox(
                        width: SizeConfig.defaultSize! * 16.8,
                      ),

                      Icon(
                        Icons.keyboard_arrow_right,
                        color: kMainColor,
                        size: SizeConfig.defaultSize! * 4,
                      ),

                      

                    ],
                  ),
                ),
              ),

              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),

              GestureDetector(
                // onTap: () {
                //   Navigator.pushNamed(context, "/userinfo");
                // },
                child: Container(
                  height: SizeConfig.defaultSize! * 7,
                  width: SizeConfig.defaultSize! * 40,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: kMainColor,
                      width: 3,
                    )
                  ),
                  child: Row(
                    
                    children: [

                      SizedBox(
                        width: SizeConfig.defaultSize! * 2,
                      ),
                                         
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "C h a n g e   P a s s w o r d",
                          style: TextStyle(
                            color: kMainColor,
                            fontFamily: "blacklisted",
                            fontSize: 15.sp,                
                          ),
                        ),
                      ),

                      SizedBox(
                        width: SizeConfig.defaultSize! * 12,
                      ),

                      Icon(
                        Icons.keyboard_arrow_right,
                        color: kMainColor,
                        size: SizeConfig.defaultSize! * 4,
                      ),

                    ],
                  ),
                ),
              ),

              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),

              GestureDetector(
                // onTap: () {
                //   Navigator.pushNamed(context, "/userinfo");
                // },
                child: Container(
                  height: SizeConfig.defaultSize! * 7,
                  width: SizeConfig.defaultSize! * 40,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: kMainColor,
                      width: 3,
                    )
                  ),
                  child: Row(
                    
                    children: [

                      SizedBox(
                        width: SizeConfig.defaultSize! * 2,
                      ),
                                         
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "L o g   o u t",
                          style: TextStyle(
                            color: kMainColor,
                            fontFamily: "blacklisted",
                            fontSize: 15.sp,                
                          ),
                        ),
                      ),

                      SizedBox(
                        width: SizeConfig.defaultSize! * 24,
                      ),

                      Icon(
                        Icons.keyboard_arrow_right,
                        color: kMainColor,
                        size: SizeConfig.defaultSize! * 4,
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