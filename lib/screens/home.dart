// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        

        body: ListView(
          children: [

            SizedBox(
              height: SizeConfig.defaultSize! * 5,
            ),

            Container(
              height: SizeConfig.defaultSize! * 15,
              width: SizeConfig.defaultSize! * 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kMainColor,
              ),
            ),

            SizedBox(
              height: SizeConfig.defaultSize! * 3,
            ),
            
            Container(
              height: SizeConfig.defaultSize! * 15,
              width: SizeConfig.defaultSize! * 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kMainColor,
              ),
            ),

            SizedBox(
              height: SizeConfig.defaultSize! * 3,
            ),
            
            Container(
              height: SizeConfig.defaultSize! * 15,
              width: SizeConfig.defaultSize! * 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kMainColor,
              ),
            ),

          ],
        ),



      ),
    );
  }
}