// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable, use_key_in_widget_constructors, must_be_immutable, unused_local_variable, use_build_context_synchronously, prefer_final_fields, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/widgets/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key}); 

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

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
                    kMainColor,
                    thirdColor,
                  ]
                ),
              ),
        
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "SIGN IN NOW!",
                        style: TextStyle(
                            fontSize: 30,
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
                                color: thirdColor,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                              
                        SizedBox(
                          height: SizeConfig.defaultSize! * 2,
                        ),
                              
                        TextFormField(
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
                                color: _obscureText ? kMainColor : thirdColor,
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
                                color: thirdColor,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
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
                                fontSize: 17,
                                color: kMainColor,
                              ),
                            ),
                          ),
                        ),
                              
                        SizedBox(
                          height: SizeConfig.defaultSize! * 7,
                        ),
                              
                        GestureDetector(

                          /// onTap

                          child: Container(
                            height: SizeConfig.defaultSize! * 6,
                            width: SizeConfig.defaultSize! * 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                colors: [
                                  kMainColor,
                                  thirdColor,
                                ]
                              ),
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
                              
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                                  
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: thirdColor,
                                fontSize: 17,
                              ),
                            ),
        
                            SizedBox(
                              height: SizeConfig.defaultSize! * 1,
                            ),
                                  
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "/signup");
                              },
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(///done login page
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: kMainColor,
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