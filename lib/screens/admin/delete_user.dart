// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/features/register/toast.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';
import 'package:http/http.dart' as http;

class DeleteUser extends StatefulWidget {
  const DeleteUser({super.key});

  @override
  State<DeleteUser> createState() => _DeleteUserState();
}

class _DeleteUserState extends State<DeleteUser> {
  final TextEditingController emailController = TextEditingController();

  Future<void> _delUser(BuildContext context) async {
      final token = ModalRoute.of(context)!.settings.arguments as String?; 
      final Uri url = Uri.parse('https://localfinderz.onrender.com/admin/DeleteUser');

      try {
        if (token != null){
          final response = await http.delete(
            url,
            headers: <String, String>{ 
              'Content-Type': 'application/json; charset=UTF-8', 
              'authorization':token,
            }, 
            body: jsonEncode(<String, String>{
              "email":emailController.text,
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
            "D e l e t e   U s e r",
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
                    controller: emailController,
                    textAlign: TextAlign.center,              
                    decoration: InputDecoration(                
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "Enter User E-mail",       
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

                GestureDetector(
                    onTap: () {
                      // el func beta3tak
                      _delUser(context);
                    },
                    child: Container(
                      height: SizeConfig.defaultSize! * 5,
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
                          "D e l e t e",
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
    );
  }
}