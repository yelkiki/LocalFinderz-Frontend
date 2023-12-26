
// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';

class Hoodies extends StatelessWidget {
  Hoodies({super.key});

  final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          title: Text(
            "H o o d i e s",
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: "blacklisted",

            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 1.h,
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/bottomNavBar");
            },
            child: Icon(
              Icons.arrow_back_ios,
              
            ),
          ),
        ),

        body: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                kMainColor,
                thirdColor,
                kMainColor,
              ]
            ),
          ),
          child: Column(

            children: [

              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),

              Expanded(
                child: Container(
                  width: SizeConfig.defaultSize! * 35,
                  
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.0,
                      mainAxisSpacing: 10.0,
                    ),                          
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                
                      return Card(
                        child: Center(
                          child: ListTile(
                            title: Text(items[index]),
                            onTap: () {
                              // Handle item tap
                              print('Tapped on: ${items[index]}');
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              
            ],
          ),
        ),
        
      ),
    );
  }
}