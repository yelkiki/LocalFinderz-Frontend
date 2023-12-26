// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';
// import 'package:local_finderzzz/utils/size_config.dart';
// import 'package:local_finderzzz/utils/widgets/constants.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        extendBody: true,

        body: CustomScrollView(

          slivers: [

            SliverAppBar(
              scrolledUnderElevation: 10,
              
              automaticallyImplyLeading: false,
              title: Center(
                child: Text(
                  "L o c a l  F i n d e r z",
                  style: TextStyle(
                    fontFamily: "blacklisted",
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: secondColor,
                  ),
                ),
              ),
              elevation: 2.0.h,
              pinned: true,
              backgroundColor: Colors.black,
              expandedHeight: SizeConfig.defaultSize! * 20,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(                  
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                    gradient: LinearGradient(
                      colors: const [
                        kMainColor,
                        thirdColor,
                        kMainColor,
                      ]
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 55, bottom: 20),
                    child: Container(
                      width: SizeConfig.defaultSize! * 10,
                      height: SizeConfig.defaultSize! * 10,
                      child: Image.asset("assets/images/localfinderz-high-resolution-logo-white-transparent.png"),
                    ),
                  ),
                  
                ),
              ),
              
            ),

            

            SliverToBoxAdapter(
              
              child: Container(
                height: SizeConfig.defaultSize! * 120,
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: const [
                      kMainColor,
                      thirdColor,
                      kMainColor,
                    ]
                  ),
                  // color: Colors.black
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    children: [

                      //// search bar 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          Container(
                            height: SizeConfig.defaultSize! * 5,
                            width: SizeConfig.defaultSize! * 30,
                            child: TextFormField(
                                // controller: emailController,
                                textAlign: TextAlign.start,
                                
                                decoration: InputDecoration(
                                  
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  hintText: "Search",

                                  hintStyle: TextStyle(
                                    fontSize: 15.sp,
                                    color: kMainColor,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    
                                  ),
                                  
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: kMainColor,
                                                            
                                  ),
                                  
                                  
                                  border: InputBorder.none,
                                  
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: kMainColor,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: thirdColor,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  
                                ),
                              ),
                          ),

                          Container(
                            height: SizeConfig.defaultSize! * 5,
                            width: SizeConfig.defaultSize! * 5,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.filter_alt_rounded,
                                  size: 25,
                                ),
                                Text(
                                  "Filter",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: SizeConfig.defaultSize! * 3,
                      ),

                      // categories
                      Container(
                        height: SizeConfig.defaultSize! * 15,
                        width: SizeConfig.defaultSize! * 37,
                        color: Colors.transparent,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                Container(
                                  height: SizeConfig.defaultSize! * 8,
                                  width: SizeConfig.defaultSize! * 8,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/Black_Tshirt.png"),
                                      fit: BoxFit.fitWidth
                                    ),
                                  ),
                                ),

                                Text(
                                  "T-S H I R T S",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "blacklisted",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15

                                  ),
                                ),
                              ],
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                Container(
                                  height: SizeConfig.defaultSize! * 8,
                                  width: SizeConfig.defaultSize! * 8,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/Black_pants.png"),
                                      fit: BoxFit.fitWidth
                                    ),
                                  ),
                                ),

                                Text(
                                  "P A N T S",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "blacklisted",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15

                                  ),
                                ),
                              ],
                            ),

                            
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                Container(
                                  height: SizeConfig.defaultSize! * 8,
                                  width: SizeConfig.defaultSize! * 8,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/Black_Set.png"),
                                      fit: BoxFit.fitWidth
                                    ),
                                  ),
                                ),

                                Text(
                                  "S E T S",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "blacklisted",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15

                                  ),
                                ),
                              ],
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                Container(
                                  height: SizeConfig.defaultSize! * 8,
                                  width: SizeConfig.defaultSize! * 8,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/Black_Hoodie.png"),
                                      fit: BoxFit.fitWidth
                                    ),
                                  ),
                                ),

                                Text(
                                  "H O O D I E S",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "blacklisted",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15

                                  ),
                                ),
                              ],
                            ),
                            
                          ],
                        ),
                      ),

                      SizedBox(
                        height: SizeConfig.defaultSize! * 5,
                      ),

                      
                      Container(
                        height: SizeConfig.defaultSize! * 15,
                        width: SizeConfig.defaultSize! * 35,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(4.0.h, 4.0.w),
                              blurRadius: 15.0.w,
                              spreadRadius: 1.0.w,
                            )
                          ],
                          image: DecorationImage(
                            image: AssetImage("assets/images/el-arzaa2-bellaah-high-resolution-logo5.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: SizeConfig.defaultSize! * 5,
                      ),

                      
                      Container(
                        height: SizeConfig.defaultSize! * 15,
                        width: SizeConfig.defaultSize! * 35,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(4.0.h, 4.0.w),
                              blurRadius: 15.0.w,
                              spreadRadius: 1.0.w,
                            )
                          ],
                          image: DecorationImage(
                            image: AssetImage("assets/images/el7erafyeen-high-resolution-logo3.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: SizeConfig.defaultSize! * 5,
                      ),

                      
                      Container(
                        height: SizeConfig.defaultSize! * 15,
                        width: SizeConfig.defaultSize! * 35,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(4.0.h, 4.0.w),
                              blurRadius: 15.0.w,
                              spreadRadius: 1.0.w,
                            )
                          ],
                          image: DecorationImage(
                            image: AssetImage("assets/images/el-arzaa2-bellaah-high-resolution-logo2.png"),
                            fit: BoxFit.cover,
                          ),

                        ),
                      ),

                      SizedBox(
                        height: SizeConfig.defaultSize! * 5,
                      ),

                      
                      Container(
                        height: SizeConfig.defaultSize! * 15,
                        width: SizeConfig.defaultSize! * 35,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(4.0.h, 4.0.w),
                              blurRadius: 15.0.w,
                              spreadRadius: 1.0.w,
                            )
                          ],
                          image: DecorationImage(
                            image: AssetImage("assets/images/logo-color.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),

            

          ],
        ),
      ),
    );
  }
}