// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';

class Products extends StatelessWidget {
  Products({super.key});

  final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');

  

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

              Container(
                height: SizeConfig.defaultSize! * 5,
                width: SizeConfig.defaultSize! * 30,
                child: TextFormField(
                    // controller: ,
                    textAlign: TextAlign.start,                  
                    decoration: InputDecoration(                   
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "Search all products",    
                      hintStyle: TextStyle(
                        fontSize: 13.sp,
                        color: kMainColor,
                        fontStyle: FontStyle.italic,
                        // fontWeight: FontWeight.bold,                     
                      ),                    
                      prefixIcon: Icon(
                        Icons.search,
                        color: kMainColor,                                      
                      ),         
                      border: InputBorder.none,                    
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kMainColor,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: thirdColor,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      
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