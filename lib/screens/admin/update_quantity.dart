// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/features/register/toast.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';
import 'package:http/http.dart' as http;

class UpdateQuantity extends StatefulWidget {
  const UpdateQuantity({super.key});

  @override
  State<UpdateQuantity> createState() => _UpdateQuantityState();
}

class _UpdateQuantityState extends State<UpdateQuantity> {

 final TextEditingController prodid = TextEditingController();
 TextEditingController qunatityController = TextEditingController();

  Future<void> _delProduct(BuildContext context) async {
      final token = ModalRoute.of(context)!.settings.arguments as String?; 
      final Uri url = Uri.parse('http://10.0.2.2:3000/admin/UpdateQuantity/${prodid.text}');

      try {
        if (token != null){
          if (qunatityController.text == ""){
            final response = await http.post(
              url,
              headers: <String, String>{ 
                'Content-Type': 'application/json; charset=UTF-8', 
                'authorization':token,
              },
              body: jsonEncode(<String, String>{
                "quantity":"0"
              }),
            );
            final Map<String, dynamic> decodedBody = json.decode(response.body);
            final int? statusCode = decodedBody['statusCode'];
            final String? message = decodedBody['message'];
            if (statusCode == 200) {
              showToast(message: "$message");
              Navigator.pushNamed(context, "/admin",arguments: token);
            } else {
              showToast(message: "$message");
            }
          }else{
            final response = await http.post(
              url,
              headers: <String, String>{ 
                'Content-Type': 'application/json; charset=UTF-8', 
                'authorization':token,
              },
              body: jsonEncode(<String, String>{
                "quantity":qunatityController.text
              }),
            );
            final Map<String, dynamic> decodedBody = json.decode(response.body);
            final int? statusCode = decodedBody['statusCode'];
            final String? message = decodedBody['message'];
            if (statusCode == 200) {
              showToast(message: "$message");
              Navigator.pushNamed(context, "/admin",arguments: token);
            } else {
              showToast(message: "$message");
            }
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

        resizeToAvoidBottomInset: false,
        
        appBar: AppBar(
          title: Text(
            "U p d a t e   Q u a n t i t y",
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
                  height: SizeConfig.defaultSize! * 10,
                ),
          
                Container(
                  height: SizeConfig.defaultSize! * 7,
                  width: SizeConfig.defaultSize! * 30,
                  child: TextFormField(
                    controller: prodid,
                    textAlign: TextAlign.center,              
                    decoration: InputDecoration(                
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "Enter Product ID",       
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
                          color: redColor,
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
                    keyboardType: TextInputType.number,
                    controller: qunatityController,
                    textAlign: TextAlign.center,              
                    decoration: InputDecoration(                
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "New Quantity",       
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
                          color: redColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),                
                    ),
                  ),
                ),

                SizedBox(
                  height: SizeConfig.defaultSize! * 5,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // el func beta3tak
                        _delProduct(context);
                      },
                      child: Container(
                        height: SizeConfig.defaultSize! * 6,
                        width: SizeConfig.defaultSize! * 15,
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
                            "U p d a t e",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "blacklisted",
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        // el func beta3tak
                        _delProduct(context);
                      },
                      child: Container(
                        height: SizeConfig.defaultSize! * 6,
                        width: SizeConfig.defaultSize! * 15,
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
                            "Out of Stock",
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

                
          
                
              ],
            ),
          ),
        ),
        
      ),
    );
  }
}