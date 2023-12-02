// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';

class ForgetPassword extends StatelessWidget {

  const ForgetPassword({super.key});

  // Future<void> _resetPassword(BuildContext context) async {
  //   try {
  //     await FirebaseAuth.instance.sendPasswordResetEmail(
  //       email: _emailController.text.trim(),
  //     );
  //     Fluttertoast.showToast(
  //       msg: 'تم إرسال رسالة علي البريد الإلكتروني لإعادة تعيين كلمة المرور. تفقد بريدك الالكتروني من فضلك',
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       backgroundColor: Colors.grey,
  //       textColor: Colors.white,
  //     );
  //   } catch (e) {
      
  //     Fluttertoast.showToast(
  //       msg: 'فشل إرسال البريد الإلكتروني لإعادة التعيين. حاول مرة اخرى',
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //     );
  //   }
  // }

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
              colors: [
                kMainColor,
                thirdColor,
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
                  colors: [
                    kMainColor,
                    thirdColor,
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
                                color: firstColor,
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
                          height: SizeConfig.defaultSize! * 10,
                        ),
                              
                        
                              
                        GestureDetector(
                          // onTap: () {
                          //   _resetPassword(context);
                          // },
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

