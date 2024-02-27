// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, non_constant_identifier_names, unused_local_variable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/features/register/toast.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
export "verify.dart";

class VerifyToken extends StatefulWidget {
  const VerifyToken({super.key});

  @override
  State<VerifyToken> createState() => _VerifyTokenState();
}

class _VerifyTokenState extends State<VerifyToken> {
    final TextEditingController tokenController = TextEditingController();
  Future<void> _verifyToken(BuildContext context) async {
    final Uri url = Uri.parse('https://localfinderz.onrender.com/auth/verifyToken');

    final response = await http.post(
      url,
      headers: <String, String>{ 
        'Content-Type': 'application/json; charset=UTF-8', 
      }, 
      body: jsonEncode(<String, String>{
        'token': tokenController.text,
      }),
    );
    

    final Map<String, dynamic> decodedBody = json.decode(response.body);
    final int? statusCode = decodedBody['statusCode'];
    final String? message = decodedBody['message'];
    // final List<int>? USERID = decodedBody['data'];
    // print(USERID?[0]);
    print(statusCode);
    print(message);
    if (statusCode == 200) {
      showToast(message: "$message");
      // eb3at el data lel page elgya
      final int? USERID = decodedBody['data'];

      Navigator.pushNamed(context, "/newpass",arguments: USERID);
      
    }else{
      showToast(message: "Invalid Token");
    }
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
    
        resizeToAvoidBottomInset: false,

        appBar: AppBar(
          title: Text(
            "verification",
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "blacklisted"
            ),
          ),
          elevation: 2.0.h,
          toolbarHeight: SizeConfig.defaultSize! * 8,
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  eswed,
                  redColor,
                ]
              ),
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
    
        body: Stack(
          children: [
    
            Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: const [
                    eswed,
                    redColor,
                  ]
                ),
              ),
            ),
    
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
            
              child: Container(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)
                  ),
                  color: Colors.white,
                ),
                
                child:  Padding(
                  padding: const EdgeInsets.only(left: 18.0,right: 18),
            
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        TextFormField(
                          controller: tokenController,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade100,
                          
                            hintText: "Enter the verification code ",
                            hintStyle: TextStyle(
                              color: kMainColor,
                            ),
                            
                            border: InputBorder.none,
                            
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kMainColor,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: redColor,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: redColor,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                              
                        SizedBox(
                          height: SizeConfig.defaultSize! * 10,
                        ),
                              
                                                    
                        GestureDetector(
                          onTap: () {
                            
                            _verifyToken(context);
                            
                            
                          },
                          child: Container(
                            height: SizeConfig.defaultSize! * 6,
                            width: SizeConfig.defaultSize! * 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                colors: [
                                  eswed,
                                  redColor,
                                ]
                              ),
                              border: Border.all(
                                color: secondColor,
                              )
                            ),
                                    
                            child: Center(
                              child: Text(
                                "Confirm",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "blacklisted",
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                              
                        SizedBox(
                          height: SizeConfig.defaultSize! * 3,
                        ),
                              
                        
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
       
      ),
    );
  }
}