// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {

  RangeValues values = const RangeValues(0, 5000);

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(
      values.start.toString(),
      values.end.toString(),
    );
    return SafeArea(
      child: Scaffold(

        
        // extendBody: true,
        appBar: AppBar(
          title: Text(
            "Filter  Your  Search",
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
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              
            ),
          ),
        ),
        
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.defaultSize! * 4,
              ),

              Container(
                height: SizeConfig.defaultSize! * 20,
                width: SizeConfig.defaultSize! * 39,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 300),
                      child: Text(
                        "Price",
                        style: TextStyle(
                          color: eswed,
                          fontFamily: "blacklisted",
                          fontSize: 16.sp,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),

                    RangeSlider(
                      activeColor: eswed,
                      inactiveColor: redColor,
                      values: values,
                      divisions: 20,
                      labels: labels,
                      onChanged: (newValues) {
                        setState(() {
                          values = newValues;
                        });
                      },
                    ),

                    
                  ],
                ),
              ),
        
              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),
        
              Container(
                height: SizeConfig.defaultSize! * 20,
                width: SizeConfig.defaultSize! * 39,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
        
              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),
              
              Container(
                height: SizeConfig.defaultSize! * 20,
                width: SizeConfig.defaultSize! * 39,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}