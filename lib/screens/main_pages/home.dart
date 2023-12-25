// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/screens/main_pages/filter_items.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';
import 'package:popover/popover.dart';
// import 'package:local_finderzzz/utils/size_config.dart';
// import 'package:local_finderzzz/utils/widgets/constants.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');


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
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // CircleAvatar(
                  //   backgroundImage: AssetImage("assets/images/tshirt-favicon-white.png"),
                  //   backgroundColor: Colors.transparent,
                  //   radius: 15,
                  // ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      height: SizeConfig.defaultSize! * 4,
                      width: SizeConfig.defaultSize! * 3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/tshirt-favicon-white.png"),
                          fit: BoxFit.fitWidth,
                        )
                      ),
                    ),
                  ),

                  SizedBox(
                    width: SizeConfig.defaultSize,
                  ),


                  Center(
                    child: Text(
                      "L o c a l  F i n d e r z",
                      style: TextStyle(
                        fontFamily: "blacklisted",
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        color: secondColor,
                      ),
                    ),
                  ),

                ],
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
                  // color: Colors.black
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    children: [

                      //// search bar 
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/searchProducts");
                        },
                        child: Container(
                          height: SizeConfig.defaultSize! * 5,
                          width: SizeConfig.defaultSize! * 30,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                      
                              SizedBox(
                                width: SizeConfig.defaultSize,
                              ),
                      
                              Icon(
                                Icons.search,
                              ),
                      
                              SizedBox(
                                width: SizeConfig.defaultSize,
                              ),
                      
                              Text(
                                "Search for products",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 12.sp,                               
                                ),
                              ),
                      
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: SizeConfig.defaultSize! * 2,
                      ),

                      // categories
                      Container(
                        height: SizeConfig.defaultSize! * 12,
                        width: SizeConfig.defaultSize! * 33,
                        color: Colors.transparent,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/tshirts");
                                  },
                                  child: Container(
                                    height: SizeConfig.defaultSize! * 6,
                                    width: SizeConfig.defaultSize! * 6,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/Black_Tshirt.png"),
                                        fit: BoxFit.fitWidth
                                      ),
                                    ),
                                  ),
                                ),

                                Text(
                                  "T-S H I R T S",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "blacklisted",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp

                                  ),
                                ),
                              ],
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/pants");
                                  },
                                  child: Container(
                                    height: SizeConfig.defaultSize! * 6,
                                    width: SizeConfig.defaultSize! * 6,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/Black_pants.png"),
                                        fit: BoxFit.fitWidth
                                      ),
                                    ),
                                  ),
                                ),

                                Text(
                                  "P A N T S",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "blacklisted",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp

                                  ),
                                ),
                              ],
                            ),

                            
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/sets");
                                  },
                                  child: Container(
                                    height: SizeConfig.defaultSize! * 6,
                                    width: SizeConfig.defaultSize! * 6,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/Black_Set.png"),
                                        fit: BoxFit.fitWidth
                                      ),
                                    ),
                                  ),
                                ),

                                Text(
                                  "S E T S",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "blacklisted",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp

                                  ),
                                ),
                              ],
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/hoodies");
                                  },
                                  child: Container(
                                    height: SizeConfig.defaultSize! * 6,
                                    width: SizeConfig.defaultSize! * 6,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/Black_Hoodie.png"),
                                        fit: BoxFit.fitWidth
                                      ),
                                    ),
                                  ),
                                ),

                                Text(
                                  "H O O D I E S",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "blacklisted",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp

                                  ),
                                ),
                              ],
                            ),
                            
                          ],
                        ),
                      ),


                      
                      ////////////////////////////////////// hena el brands
                                            
                      
                      

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













                          // Container(
                          //   height: SizeConfig.defaultSize! * 5,
                          //   width: SizeConfig.defaultSize! * 5,
                          //   decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     borderRadius: BorderRadius.circular(15),
                          
                          //   ),
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //     children: [
                          //       Icon(
                          //         Icons.filter_alt_rounded,
                          //         size: 25,
                          //       ),
                          //       Text(
                          //         "Filter",
                          //         style: TextStyle(
                          //           fontSize: 12,
                          //           fontWeight: FontWeight.w600,
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // ),

                          // Container(
                          //   width: SizeConfig.defaultSize! * 11,
                            
                          //   child: DropdownButtonFormField(
                          //     decoration: InputDecoration(
                          //       enabledBorder: OutlineInputBorder(
                          //           borderSide: BorderSide(
                          //             color: Colors.white,
                          //             width: 2
                          //           ),
                          //           borderRadius: BorderRadius.circular(10),
                          //         ),
                          //         focusedBorder: OutlineInputBorder(
                          //           borderSide: BorderSide(
                          //             color: thirdColor,
                          //           ),
                          //           borderRadius: BorderRadius.circular(10),
                          //         ),
                          //     ),
                          //     hint: Text(
                          //       "Filter",
                          //       style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold
                          //       ),
                          //     ),
                          //     dropdownColor: Colors.white,
                          //     // isExpanded: true,
                          //     items: const [
                          //       DropdownMenuItem(child: Text("Men"), value: "m",),
                          //       DropdownMenuItem(child: Text("Women"), value: "w",),
                          //       DropdownMenuItem(child: Text("Unisex"), value: "u",),
                          //     ],
                          //     onChanged: null,
                              
                          //   ),
                          // ),



/////////////////////////////////////////////////////////////////// search bar 
                      // Container(
                      //   height: SizeConfig.defaultSize! * 5,
                      //   width: SizeConfig.defaultSize! * 30,
                      //   child: TextFormField(
                      //     // controller: emailController,
                      //     textAlign: TextAlign.start,
                          
                      //     decoration: InputDecoration(
                            
                      //       filled: true,
                      //       fillColor: Colors.grey.shade100,
                      //       hintText: "Search for products",

                      //       hintStyle: TextStyle(
                      //         fontSize: 13.sp,
                      //         color: kMainColor,
                      //         fontStyle: FontStyle.italic,
                      //         // fontWeight: FontWeight.bold,
                              
                      //       ),
                            
                      //       prefixIcon: Icon(
                      //         Icons.search,
                      //         color: kMainColor,
                                              
                      //       ),

                      //       // suffixIcon: Container(
                      //       //   child: GestureDetector(
                      //       //     onTap: () => showPopover(
                      //       //       context: context,
                      //       //       bodyBuilder: (context) => FilterItems(),
                      //       //       width: 100,
                      //       //       height: 50,
                      //       //       direction: PopoverDirection.bottom
                      //       //     ),
                      //       //     child: const Icon(
                      //       //       Icons.filter_alt,
                      //       //     ),
                      //       //   ),
                      //       // ),
                            
                            
                      //       border: InputBorder.none,
                            
                      //       enabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: kMainColor,
                      //         ),
                      //         borderRadius: BorderRadius.circular(30),
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: thirdColor,
                      //         ),
                      //         borderRadius: BorderRadius.circular(30),
                      //       ),
                            
                      //     ),
                      //   ),
                      // ),
