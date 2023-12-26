// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';

class Products extends StatelessWidget {
  Products({super.key});

  final List<String> items = List.generate(20, (index) => 'Product ${index + 1}');

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // extendBody: true,

        appBar: AppBar(
          title: Text(
            "p r o d u c t s",
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: "blacklisted",

            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 1.h,
          automaticallyImplyLeading: false,
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

              //// search bar 
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/searchProducts");
                },
                child: Container(
                  height: SizeConfig.defaultSize! * 5,
                  width: SizeConfig.defaultSize! * 30,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
              
                      SizedBox(
                        width: SizeConfig.defaultSize,
                      ),
              
                      Icon(
                        Icons.search,
                      ),
              
                      SizedBox(
                        width: SizeConfig.defaultSize,
                      ),
              
                      Text(
                        "Search for products",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 12.sp,                               
                        ),
                      ),
              
                    ],
                  ),
                ),
              ),

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

