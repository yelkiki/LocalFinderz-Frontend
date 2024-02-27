// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, duplicate_ignore, unnecessary_string_interpolations

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:local_finderzzz/features/register/toast.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';
import 'package:http/http.dart' as http;

class ForgetPassword extends StatefulWidget {

  const ForgetPassword({super.key});
  @override
  State<ForgetPassword> createState() => _ForgetPageState();
}


class _ForgetPageState extends State<ForgetPassword>{

  final TextEditingController emailController = TextEditingController();
  bool _isLoading = false; // Track loading state

  Future<void> _resetPassword(BuildContext context) async {
    setState(() {
      _isLoading = true; // Set loading state to true when reset password starts
    });

    final Uri url = Uri.parse('https://localfinderz.onrender.com/auth/sendmail');

    final response = await http.post(
      url,
      headers: <String, String>{ 
        'Content-Type': 'application/json; charset=UTF-8', 
      }, 
      body: jsonEncode(<String, String>{
        'email': emailController.text,
      }),
    );
    

    final Map<String, dynamic> decodedBody = json.decode(response.body);
    final int? statusCode = decodedBody['statusCode'];
    final String? message = decodedBody['message'];
    if (statusCode == 200) {
      showToast(message: "$message");
      // hena redirect le page el verify token
      Navigator.pushNamed(context, "/verify");
    }else{
      showToast(message: "$message");
      
      // final List<dynamic>? errorMessages = decodedBody['data'] != null
      //     ? List<String>.from(decodedBody['data'])
      //     : null;
      // if (errorMessages == null) {
      //     showToast(message: "$message");
      //   } else {
      //      final combinedErrors = errorMessages.join(', ');
      //     showToast(message: "$combinedErrors");
      //     }
    }

    setState(() {
      _isLoading = false; // Set loading state to false after password reset process
    });
  
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
    
        resizeToAvoidBottomInset: false,

        appBar: AppBar(
        title: Text(
          "Reset Password",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontFamily: "blacklisted"
          ),
        ),
        elevation: 2.0,
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
                          controller: emailController,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            suffixIcon: Icon(
                              Icons.mail,
                              color: kMainColor,                           
                            ),
                            hintText: "E-mail",
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
                            _resetPassword(context);
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
                                "Reset Password",
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

            if (_isLoading)
              Container(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                color: Colors.grey.withOpacity(0.5),
                child: Center(
                  child: CircularProgressIndicator(
                    // Show loading indicator if _isLoading is true
                    valueColor: AlwaysStoppedAnimation<Color>(eswed),
                  ),
                ),
              ), 

          ],
        )
       
      ),
    );
  }
}