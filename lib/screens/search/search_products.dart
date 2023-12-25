// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';

class SearchProducts extends StatelessWidget {
  const SearchProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          elevation: SizeConfig.defaultSize,
          toolbarHeight: SizeConfig.defaultSize! * 7,
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Row(
            children: [

              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  
                ),
              ),

              SizedBox(
                width: SizeConfig.defaultSize,
              ),

              Container(
                height: SizeConfig.defaultSize! * 5,
                width: SizeConfig.defaultSize! * 30,
                child: TextFormField(
                  // controller: emailController,
                  textAlign: TextAlign.start,
                  autofocus: true,
                  decoration: InputDecoration(
                    
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    hintText: "Search for products",
                        
                    hintStyle: TextStyle(
                      fontSize: 12.sp,
                      color: kMainColor,
                      fontStyle: FontStyle.italic,
                      // fontWeight: FontWeight.bold,
                      
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
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    
                  ),
                ),
              ),

              SizedBox(
                width: SizeConfig.defaultSize! * 2,
              ),

              Container(

              ),

            ],
          )
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
        ),
    
      ),
    );
  }
}


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