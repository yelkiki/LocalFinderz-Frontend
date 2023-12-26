// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';

class AddProduct extends StatelessWidget {
  AddProduct({super.key});

  final TextEditingController brandController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        resizeToAvoidBottomInset: false,
        
        appBar: AppBar(
          title: Text(
            "A d d   p r o d u c t",
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "blacklisted"
            ),
          ),
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
                    controller: brandController,
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
                    controller: nameController,
                    textAlign: TextAlign.center,              
                    decoration: InputDecoration(                
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "Enter Product Name",       
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
                    controller: priceController,
                    textAlign: TextAlign.center,              
                    decoration: InputDecoration(                
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "Enter Product Price",       
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
                    controller: sexController,
                    textAlign: TextAlign.center,              
                    decoration: InputDecoration(                
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "Enter Product Sex",       
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
                    controller: imageController,
                    textAlign: TextAlign.center,              
                    decoration: InputDecoration(                
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "Enter Image URL",       
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
                    controller: quantityController,
                    textAlign: TextAlign.center,              
                    decoration: InputDecoration(                
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "Enter Product Quantity",       
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
                    controller: categoryController,
                    textAlign: TextAlign.center,              
                    decoration: InputDecoration(                
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "Enter Product Category",       
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