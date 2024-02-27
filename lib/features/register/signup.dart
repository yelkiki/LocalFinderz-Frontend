// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, use_build_context_synchronously, sized_box_for_whitespace, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/features/register/toast.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  bool _obscureText1 = true;
  bool _obscureText2 = true;


  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  // final TextEditingController addressController = TextEditingController();


  Future<void> _register(BuildContext context) async {
    final Uri url = Uri.parse('https://localfinderz.onrender.com/auth/signup');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{ 
          'Content-Type': 'application/json; charset=UTF-8', 
        }, 
        body: jsonEncode(<String, dynamic>{
          /////////////// controllers mesh metratebeen ratebhom lama handal yzawedlohom fieelds
          'firstname': firstNameController.text,
          'lastname': lastNameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'cPassword': cPasswordController.text,
          'phone': phoneController.text,
          "address": "ciuskc",
        }),
      );

      final Map<String, dynamic> decodedBody = json.decode(response.body);
      final int? statusCode = decodedBody['statusCode'];
      final String? message = decodedBody['message'];
      final List<dynamic>? errorMessages = decodedBody['data'] != null
          ? List<String>.from(decodedBody['data'])
          : null;

      if (statusCode == 200) {
        showToast(message: "$message");
        Navigator.pushNamed(context, "/login");
      } else {
        if (errorMessages == null) {
          showToast(message: "$message");
        } else {
          final combinedErrors = errorMessages.join(', ');
          showToast(message: "$combinedErrors");
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

        body: Stack(
          children: [
        
            Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    eswed,
                    redColor,
                  ]
                ),
              ),
        
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "SIGN UP NOW!",
                        style: TextStyle(
                            fontSize: 27.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            fontFamily: "blacklisted"
                          ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.only(top: 120.0),
            
              child: Container(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.w),
                    topRight: Radius.circular(40.w)
                  ),
                  color: Colors.white,
                ),
                
                child:  Form(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      SizedBox(
                        height: SizeConfig.defaultSize! * 4,
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Container(
                              width: SizeConfig.defaultSize! * 18,
                              child: TextFormField(
                                controller: firstNameController,
                                textAlign: TextAlign.start,                          
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  hintText: "First Name",
                                  hintStyle: TextStyle(
                                    color: kMainColor,
                                    
                                  ),
                           
                                  border: InputBorder.none,                            
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: kMainColor,
                                    ),
                                    borderRadius: BorderRadius.circular(12.w),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: redColor,
                                    ),
                                    borderRadius: BorderRadius.circular(12.w),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: redColor,
                                    ),
                                    borderRadius: BorderRadius.circular(12.w),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: Container(
                              width: SizeConfig.defaultSize! * 18,
                              child: TextFormField(
                                controller: lastNameController,
                                textAlign: TextAlign.start,                          
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  hintText: "Last Name",
                                  hintStyle: TextStyle(
                                    color: kMainColor,
                                    
                                  ),
                          
                                  border: InputBorder.none,                            
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: kMainColor,
                                    ),
                                    borderRadius: BorderRadius.circular(12.w),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: redColor,
                                    ),
                                    borderRadius: BorderRadius.circular(12.w),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: redColor,
                                    ),
                                    borderRadius: BorderRadius.circular(12.w),
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),

                      SizedBox(
                        height: SizeConfig.defaultSize! * 2,
                      ),
        

                      Padding(
                        padding: const EdgeInsets.only(left: 18.0,right: 18),
                        child: TextFormField(
                          controller: emailController,
                          textAlign: TextAlign.start,                          
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            hintText: "E-mail",
                            hintStyle: TextStyle(
                              color: kMainColor,
                              
                            ),
                            suffixIcon: Icon(
                              Icons.mail,
                              color: kMainColor,                                                      
                            ),                            
                            border: InputBorder.none,                            
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kMainColor,
                              ),
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: redColor,
                              ),
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: redColor,
                              ),
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: SizeConfig.defaultSize! * 2,
                      ),
        

                      
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0,right: 18),
                        child: TextFormField(
                          controller: phoneController,
                          textAlign: TextAlign.start,                          
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            hintText: "Phone Number",
                            hintStyle: TextStyle(
                              color: kMainColor,
                              
                            ),
                            suffixIcon: Icon(
                              Icons.phone,
                              color: kMainColor,                                                      
                            ),                            
                            border: InputBorder.none,                            
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kMainColor,
                              ),
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: redColor,
                              ),
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: redColor,
                              ),
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: SizeConfig.defaultSize! * 2,
                      ),

                            
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0,right: 18),
                        child: TextFormField(
                          controller: passwordController,
                          textAlign: TextAlign.start,
                          obscureText: _obscureText1,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: kMainColor,
                            ),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText1 ? Icons.visibility_off : Icons.visibility,
                                color: _obscureText1 ? kMainColor : redColor,
                              ),
                              
                              onPressed: () {
                                setState(() {
                                  _obscureText1 = !_obscureText1;
                                });
                              },
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kMainColor,
                              ),
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: redColor,
                              ),
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: redColor,
                              ),
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: SizeConfig.defaultSize! * 2,
                      ),
                            
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0,right: 18),
                        child: TextFormField(
                          controller: cPasswordController,
                          textAlign: TextAlign.start,
                          obscureText: _obscureText2,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(
                              color: kMainColor,
                            ),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText2 ? Icons.visibility_off : Icons.visibility,
                                color: _obscureText2 ? kMainColor : redColor,
                              ),
                              
                              onPressed: () {
                                setState(() {
                                  _obscureText2 = !_obscureText2;
                                });
                              },
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kMainColor,
                              ),
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: redColor,
                              ),
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: redColor,
                              ),
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                          ),
                        ),
                      ),
                            
                      
                            
                      SizedBox(
                        height: SizeConfig.defaultSize! * 5,
                      ),
                            
                      GestureDetector(

                        onTap: ()=>_register(context),

                        child: Container(
                          height: SizeConfig.defaultSize! * 6,
                          width: SizeConfig.defaultSize! * 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.w),
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
                              "S I G N   U P",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: "blacklisted",
                                fontSize: 20.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                            
                      SizedBox(
                        height: SizeConfig.defaultSize! * 4,
                      ),
                            
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                                
                          Text(
                            "Do you have an account?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kMainColor,
                              fontSize: 15.sp,
                            ),
                          ),
        
                          SizedBox(
                            width: SizeConfig.defaultSize! * 1,
                          ),
                                
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/login");
                            },
                            child: Text(
                              "SIGN IN",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: redColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
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
