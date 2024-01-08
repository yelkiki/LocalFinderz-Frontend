// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
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
  bool shirts = false;
  bool pants = false;
  bool sets = false;
  bool hoodies = false;
  bool isSelected = false;

  List<String> names = [
    'ahhh',
    'oohhhh',
    'eehhh',
    'yeeehhh',
    'offff',
  ];
  

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
                height: SizeConfig.defaultSize! * 2,
              ),

              Container(
                height: SizeConfig.defaultSize! * 15,
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
                      height: SizeConfig.defaultSize! * 3,
                    ),

                    RangeSlider(
                      activeColor: redColor,
                      inactiveColor: Colors.white,
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
                height: SizeConfig.defaultSize! * 30,
                width: SizeConfig.defaultSize! * 39,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 260),
                      child: Text(
                        "Category",
                        style: TextStyle(
                          color: eswed,
                          fontFamily: "blacklisted",
                          fontSize: 16.sp,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: SizeConfig.defaultSize! * 1,
                    ),

                    CheckboxListTile(
                      value: shirts,
                      onChanged: (value) {
                        setState(() {
                          shirts = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: redColor,
                      title: Text(
                        "T-shirts",
                        style: TextStyle(
                          fontFamily: "blacklisted",
                          fontSize: 15.sp,
                          color: redColor,
                        
                        ),
                      ),
                    ),

                    CheckboxListTile(
                      value: pants,
                      onChanged: (value) {
                        setState(() {
                          pants = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: redColor,
                      title: Text(
                        "Pants",
                        style: TextStyle(
                          fontFamily: "blacklisted",
                          fontSize: 15.sp,
                          color: redColor,
                        
                        ),
                      ),
                    ),

                    CheckboxListTile(
                      value: sets,
                      onChanged: (value) {
                        setState(() {
                          sets = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: redColor,
                      title: Text(
                        "Sets",
                        style: TextStyle(
                          fontFamily: "blacklisted",
                          fontSize: 15.sp,
                          color: redColor,
                        
                        ),
                      ),
                    ),

                    CheckboxListTile(
                      value: hoodies,
                      onChanged: (value) {
                        setState(() {
                          hoodies = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: redColor,
                      title: Text(
                        "Hoodies",
                        style: TextStyle(
                          fontFamily: "blacklisted",
                          fontSize: 15.sp,
                          color: redColor,
                        
                        ),
                      ),
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
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 290),
                      child: Text(
                        "Brand",
                        style: TextStyle(
                          color: eswed,
                          fontFamily: "blacklisted",
                          fontSize: 16.sp,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: SizeConfig.defaultSize! * 3,
                    ),

                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return FilterChip(
                            label: Text(names[index]),
                            selected: isSelected,
                            onSelected: (bool value){
                              setState(() {
                                isSelected = !isSelected;
                              });
                            },
                            labelStyle: TextStyle(
                              color: secondColor,
                              fontFamily: "blacklisted",
                              fontSize: 14.sp,
                            ),
                            backgroundColor: Colors.blueGrey,
                            selectedColor: redColor,
                            checkmarkColor: secondColor,
                          );
                        },
                        itemCount: names.length,
                        
                      ),
                    ),

                    // ChipsChoice<String>.multiple(
                    //   value: tags,
                      
                    //   onChanged: (value) {
                    //     setState(() {
                    //       tags = value;
                    //     });
                    //   },
                    //   choiceItems: C2Choice.listFrom(
                    //     source: names,
                    //     value: (i, v) => v,
                    //     label: (i, v) => v,
                    //     disabled: (i, v) => [0, 2, 5].contains(i),
                    //   ),
                    //   choiceStyle: const C2ChoiceStyle(
                    //     color: eswed,
                    //     borderRadius: BorderRadius.all(Radius.circular(20)),
                    //   ),
                    //   choiceActiveStyle: C2ChoiceStyle(
                    //     color: redColor,
                    //     borderRadius: BorderRadius.all(Radius.circular(20)),
                    //   ),
                    //   wrapped: true,
                    //   textDirection: TextDirection.ltr,
                    // ),

                    

                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}