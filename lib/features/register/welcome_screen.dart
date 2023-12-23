// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                kMainColor,
                thirdColor
              ],
            ),                     
          ),

          child: Column(
            children: [

                SizedBox(
                  height: SizeConfig.defaultSize! * 10,
                ),
    
                Text(
                  "Welcome !",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: "blacklisted",
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "description",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
    
                SizedBox(
                  height: SizeConfig.defaultSize! * 40,
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Container(
                    height: SizeConfig.defaultSize! * 7,
                    width: SizeConfig.defaultSize! * 30,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: const [
                          kMainColor,
                          thirdColor
                        ],
                      ),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      )                     
                    ),
                    child: Center(
                      child: Text(
                        "S I G N   I N",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "blacklisted",
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: SizeConfig.defaultSize! * 2,
                ),
    
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/signup');
                  },
    
                  child: Container(
                    height: SizeConfig.defaultSize! * 7,
                    width: SizeConfig.defaultSize! * 30,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: const [
                          kMainColor,
                          thirdColor
                        ],
                      ),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      )
                    ),
    
                    child: Center(
                      child: Text(
                        "S I G N   U P",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "blacklisted",
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

              ]
          ),
        ),
      ),
    );
  }
}