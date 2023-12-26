// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable, use_key_in_widget_constructors, must_be_immutable, unused_local_variable, use_build_context_synchronously, prefer_final_fields, unnecessary_null_comparison, unused_element, unnecessary_string_interpolations

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/features/register/toast.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key}); 

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  

  Future<void> _login(BuildContext context) async {
    final Uri url = Uri.parse('http://10.0.2.2:3000/auth/login');

    // loading circle
    // setState( () {
    //   showDialog(
    //     context: context,
    //     builder: (context) {
    //         return Center(child: CircularProgressIndicator());
    //       }
    //   );}
    // );

    try {
      final response = await http.post(
        url,
        headers: <String, String>{ 
          'Content-Type': 'application/json; charset=UTF-8', 
        }, 
        body: jsonEncode(<String, String>{
          'email': emailController.text,
          'password': passwordController.text,
        }),
      );



      final Map<String, dynamic> decodedBody = json.decode(response.body);
      final int? statusCode = decodedBody['statusCode'];
      final String? message = decodedBody['message'];
      final List<dynamic>? errorMessages = decodedBody['data'] != null
          ? List<String>.from(decodedBody['data'])
          : null;

      if (statusCode == 200) {
        final int? role = decodedBody['role'];
        print(role);
        if (role == 1){
          Navigator.pushNamed(context, "/bottomNavBar");
        }else{
          Navigator.pushNamed(context, "/admin");
        }

        
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
//assets/images/glowing trash bag.png

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        body: Stack(
          children: [
        
            Container(
              height: SizeConfig.defaultSize! * 41,
              width: SizeConfig.screenWidth,
              
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/locaal_moot.png"),
                  fit: BoxFit.fitWidth,
                ),
                // gradient: LinearGradient(
                //   colors: [
                //     kMainColor,
                //     thirdColor,
                //   ]
                // ),
              ),
        
              
            ),
        
            Padding(
              padding: const EdgeInsets.only(top: 350.0),
            
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
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        SizedBox(
                          height: SizeConfig.defaultSize! * 3,
                        ),
                        
                        TextFormField(
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
                          height: SizeConfig.defaultSize! * 2,
                        ),
                              
                        TextFormField(
                          controller: passwordController,
                          textAlign: TextAlign.start,
                          obscureText: _obscureText,
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
                                _obscureText ? Icons.visibility_off : Icons.visibility,
                                color: _obscureText ? kMainColor : redColor,
                              ),
                              
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
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
                          height: SizeConfig.defaultSize! * 3,
                        ),
                              
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/forgetpass");
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                                color: redColor,
                              ),
                            ),
                          ),
                        ),

                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       Navigator.pushNamed(context, "/bottomNavBar");
                        //     },
                        //     child: Text(
                        //       "skip",
                        //       style: TextStyle(
                        //         fontWeight: FontWeight.bold,
                        //         fontSize: 15.sp,
                        //         color: redColor,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                              
                        SizedBox(
                          height: SizeConfig.defaultSize! * 4,
                        ),
                              
                        GestureDetector(

                          /// onTap
                          // onTap: () =>_login(context),

                          onTap: () {
                            _login(context);
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
                                color: secondColor
                              )
                            ),
                                    
                            child: Center(
                              child: Text(
                                "S I G N   I N",
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
                              
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                                  
                            Text(
                              "Don't have an account?",
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
                                Navigator.pushNamed(context, "/signup");
                              },
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(///done login page
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
            ),
          ],
        )
      ),
    );
  }
}