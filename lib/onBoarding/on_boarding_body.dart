// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/widgets/constants.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [

            SizedBox(
              height: SizeConfig.defaultSize! * 7,
            ),
    
            Align(
              alignment: Alignment.center,
              child: Container(
                height: SizeConfig.defaultSize! * 50,
                  width: SizeConfig.defaultSize! * 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kMainColor,
                  ),
                  child: Center(
                    child: Text(
                      "henaa el video",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ),
            ),
    
            SizedBox(
              height: SizeConfig.defaultSize! * 12,
            ),
    
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/welcome");
              },
              child: Container(
                height: SizeConfig.defaultSize! * 5,
                width: SizeConfig.defaultSize! * 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: thirdColor,
                ),
                child: Center(
                  child: Text(
                    "---->",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    //////// videooooo w bas yghaaly
  }
}