// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/features/register/toast.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';
import 'package:http/http.dart' as http;

class AddProduct extends StatefulWidget {
  AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController brandController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

Future<void> _addProduct(BuildContext context) async {
    final token = ModalRoute.of(context)!.settings.arguments as String?; 
    final Uri url = Uri.parse('https://localfinderz.onrender.com/admin/addProduct');

    try {
      if (token != null){
        final response = await http.post(
          url,
          headers: <String, String>{ 
            'Content-Type': 'application/json; charset=UTF-8', 
            'authorization':token,
          }, 
          body: jsonEncode(<String, String>{  
              "name":nameController.text,  
              "price":priceController.text,  
              "sex":sexController.text,  
              "image":imageController.text,
              "quantity":quantityController.text,  
              "category":categoryController.text,  
              "brand":brandController.text
          }),
        );

        final Map<String, dynamic> decodedBody = json.decode(response.body);
        final int? statusCode = decodedBody['statusCode'];
        final String? message = decodedBody['message'];

        if (statusCode == 200) {
          showToast(message: "$message");
          Navigator.pushNamed(context, '/admin',arguments: token);
        } else {
          showToast(message: "$message");
        }
      }
    } catch (error) {
      showToast(message: "An error occured, please try again!");
    }
  }
  



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        // resizeToAvoidBottomInset: true,
        
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

        body: SingleChildScrollView(
          child: Container(
            height: SizeConfig.screenHeight,
            
            child: Center(
              child: Column(
                children: [
                      
                  SizedBox(
                    height: SizeConfig.defaultSize! * 3,
                  ),
                      
                  Container(
                    height: SizeConfig.defaultSize! * 7,
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
                    height: SizeConfig.defaultSize! * 7,
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
                    height: SizeConfig.defaultSize! * 7,
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
                    height: SizeConfig.defaultSize! * 7,
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
                    height: SizeConfig.defaultSize! * 7,
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
                    height: SizeConfig.defaultSize! * 7,
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
                    height: SizeConfig.defaultSize! * 7,
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

                  SizedBox(
                    height: SizeConfig.defaultSize! * 2,
                  ),

                  GestureDetector(
                    onTap: () {
                      // el func beta3tak
                      _addProduct(context);
                    },
                    child: Container(
                      height: SizeConfig.defaultSize! * 6,
                      width: SizeConfig.defaultSize! * 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            eswed,
                            redColor,                        
                          ]
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "C o n f i r m",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "blacklisted",
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        
      ),
    );
  }
}