// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:local_finderzzz/features/register/toast.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {

  bool _obscureText1 = true;
  bool _obscureText2 = true;

  final TextEditingController passController = TextEditingController();
  final TextEditingController confPassController = TextEditingController();

  Future<void> _newPassword(BuildContext context) async {
    final Uri url = Uri.parse('http://10.0.2.2:3000/auth/changePass');
    final userID = ModalRoute.of(context)!.settings.arguments as int?; // gebto mel file elfat
    final response = await http.post(
      url,
      headers: <String, String>{ 
        'Content-Type': 'application/json; charset=UTF-8', 
      }, 
      body: jsonEncode(<String, dynamic>{
        "id": userID,
        'newPassword': passController.text,
        'cPassword': confPassController.text,
      }),
    );
    

    final Map<String, dynamic> decodedBody = json.decode(response.body);
    final int? statusCode = decodedBody['statusCode'];
    final String? message = decodedBody['message'];
    final List<dynamic>? data = decodedBody['data'] != null
        ? List<String>.from(decodedBody['data'])
        : null;
    if (statusCode == 200) {
      showToast(message: "$message");
      // redirect lel login b2a
      Navigator.pushNamed(context, "/login");
    }else{
      if (data == null) {
          showToast(message: "$message");
        } else {
           final combinedErrors = data.join(', ');
          showToast(message: "$combinedErrors");
        }
    }

  }




@override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
    
        resizeToAvoidBottomInset: false,

        appBar: AppBar(
        title: Text(
          "New Password",
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
                          controller: passController,
                          textAlign: TextAlign.start,
                          obscureText: _obscureText1,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            
                            hintText: "New Password",
                            hintStyle: TextStyle(
                              color: kMainColor,
                            ),
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
                          controller: confPassController,
                          textAlign: TextAlign.start,
                          obscureText: _obscureText2,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(
                              color: kMainColor,
                            ),
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
                            _newPassword(context);
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
          ],
        )
       
      ),
    );
  }

}