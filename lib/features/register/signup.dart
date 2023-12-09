// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
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
  bool _obscureText = true;
  bool _obscureTextConfirmPassword = true;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();


  Future<void> _register(BuildContext context) async {
    final Uri url = Uri.parse('http://10.0.2.2:3000/auth/signup');

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
          'address': addressController.text,
        }),
      );

      final Map<String, dynamic> decodedBody = json.decode(response.body);
      final int? statusCode = decodedBody['statusCode'];
      final String? message = decodedBody['message'];
      final List<dynamic>? errorMessages = decodedBody['data'] != null
          ? List<String>.from(decodedBody['data'])
          : null;

      if (statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$message')),
        );
      } else {
        if (errorMessages == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$message')),
          );
        } else {
          final combinedErrors = errorMessages.join(', ');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$message: $combinedErrors')),
          );
        }
      }
      
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        body: SingleChildScrollView(
          child: Stack(
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
                          "SIGN UP NOW!",
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
                            controller: firstNameController,
                            textAlign: TextAlign.start,                          
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              hintText: "First Name",
                              hintStyle: TextStyle(
                                color: kMainColor,
                                
                              ),
                              suffixIcon: Icon(
                                Icons.person,
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
                            controller: lastNameController,
                            textAlign: TextAlign.start,                          
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              hintText: "Last Name",
                              hintStyle: TextStyle(
                                color: kMainColor,
                                
                              ),
                              suffixIcon: Icon(
                                Icons.person,
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
                            height: SizeConfig.defaultSize! * 2,
                          ),
          
                          TextFormField(
                            controller: cPasswordController,
                            textAlign: TextAlign.start,
                            obscureText: _obscureTextConfirmPassword,
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
                                  _obscureTextConfirmPassword ? Icons.visibility_off : Icons.visibility,
                                  color: _obscureTextConfirmPassword ? kMainColor : thirdColor,
                                ),
                                
                                onPressed: () {
                                  setState(() {
                                    _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
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
                            height: SizeConfig.defaultSize! * 2,
                          ),
                                
          
                          TextFormField(
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
                            //////////////////// zabat el icon
                            controller: addressController,
                            textAlign: TextAlign.start,                          
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              hintText: "Address",
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
          
                          GestureDetector(
          
                            onTap: ()=>_register(context),
          
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
                                  "S I G N   U P",
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
                                "Do you have an account?",
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
                                  Navigator.pushNamed(context, "/login");
                                },
                                child: Text(
                                  "SIGN IN",
                                  style: TextStyle(
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
          ),
        )
      ),
    );
  }
}
