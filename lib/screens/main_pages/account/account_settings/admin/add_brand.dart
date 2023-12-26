// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';

class AddBrand extends StatelessWidget {
  AddBrand({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController logoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        resizeToAvoidBottomInset: false,
        
        appBar: AppBar(
          title: Text(
            "A d d   b r a n d",
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "blacklisted"
            ),
          ),
          automaticallyImplyLeading: false,
          elevation: 2.0.h,
          toolbarHeight: SizeConfig.defaultSize! * 6,
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: kMainColor,
            ),
          ),
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
          
          child: Center(
            child: Column(
              children: [
          
                SizedBox(
                  height: SizeConfig.defaultSize! * 5,
                ),
          
                Container(
                  height: SizeConfig.defaultSize! * 5,
                  width: SizeConfig.defaultSize! * 30,
                  child: TextFormField(
                    controller: nameController,
                    textAlign: TextAlign.center,              
                    decoration: InputDecoration(                
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "Enter Brand Name",       
                      hintStyle: TextStyle(
                        fontSize: 13.sp,
                        color: kMainColor,
                        fontStyle: FontStyle.italic,
                      ),        
                      border: InputBorder.none,                
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kMainColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),                
                    ),
                  ),
                ),
          
                SizedBox(
                  height: SizeConfig.defaultSize! * 2,
                ),
          
                Container(
                  height: SizeConfig.defaultSize! * 5,
                  width: SizeConfig.defaultSize! * 30,
                  child: TextFormField(
                    controller: emailController,
                    textAlign: TextAlign.center,              
                    decoration: InputDecoration(                
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "Enter Brand E-mail",       
                      hintStyle: TextStyle(
                        fontSize: 13.sp,
                        color: kMainColor,
                        fontStyle: FontStyle.italic,
                      ),        
                      border: InputBorder.none,                
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kMainColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),                
                    ),
                  ),
                ),
          
                SizedBox(
                  height: SizeConfig.defaultSize! * 2,
                ),
          
                Container(
                  height: SizeConfig.defaultSize! * 5,
                  width: SizeConfig.defaultSize! * 30,
                  child: TextFormField(
                    controller: addressController,
                    textAlign: TextAlign.center,              
                    decoration: InputDecoration(                
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "Enter Brand Address",       
                      hintStyle: TextStyle(
                        fontSize: 13.sp,
                        color: kMainColor,
                        fontStyle: FontStyle.italic,
                      ),        
                      border: InputBorder.none,                
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kMainColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),                
                    ),
                  ),
                ),
          
                SizedBox(
                  height: SizeConfig.defaultSize! * 2,
                ),
          
                Container(
                  height: SizeConfig.defaultSize! * 5,
                  width: SizeConfig.defaultSize! * 30,
                  child: TextFormField(
                    controller: phoneController,
                    textAlign: TextAlign.center,              
                    decoration: InputDecoration(                
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "Enter Brand Phone",       
                      hintStyle: TextStyle(
                        fontSize: 13.sp,
                        color: kMainColor,
                        fontStyle: FontStyle.italic,
                      ),        
                      border: InputBorder.none,                
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kMainColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),                
                    ),
                  ),
                ),
          
                SizedBox(
                  height: SizeConfig.defaultSize! * 2,
                ),
          
                Container(
                  height: SizeConfig.defaultSize! * 5,
                  width: SizeConfig.defaultSize! * 30,
                  child: TextFormField(
                    controller: logoController,
                    textAlign: TextAlign.center,              
                    decoration: InputDecoration(                
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "Enter Logo URL",       
                      hintStyle: TextStyle(
                        fontSize: 13.sp,
                        color: kMainColor,
                        fontStyle: FontStyle.italic,
                      ),        
                      border: InputBorder.none,                
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kMainColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),                
                    ),
                  ),
                ),
          
                
              ],
            ),
          ),
        ),
        
      ),
    );
  }
}