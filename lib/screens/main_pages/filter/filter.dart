// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

// import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/screens/main_pages/filter/items_filtered.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';




class FilterCriteria {
  final double min;
  final double max;
  final String order;
  final String category;
  
  FilterCriteria({
    required this.min,
    required this.max,
    required this.order,
    required this.category,
  });
}



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
  bool isSelected2 = false;
  bool LowerToHigher = false;
  bool HigherToLower = false;
  String category = "";
  String order = "";
  double min = 0;
  double max = 5000;

  bool isAnyInputSelected() {
    return values.start != 0 ||
        values.end != 5000 ||
        shirts ||
        pants ||
        sets ||
        hoodies ||
        isSelected ||
        isSelected2;
  }

  void applyFilters() {
    if (isAnyInputSelected()) {
      FilterCriteria criteria = FilterCriteria(
        min: min,
        max: max,
        order: order,
        category: category,
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FilteredItems(criteria: criteria),
        ),
      );
    } else {
      // Show a dialog or snackbar indicating that at least one input must be selected
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('No Input Selected'),
            content: Text('Please select at least one filter option.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  

    // url += "min=${}&max=${}&order=${}&cat=${}";
//   }else if (){

//     // url += "min=${}&max=${}&order=${}";
//   }else if (){
    
//     // url += "min=${}&max=${}&cat=${}";
//   }else if (){
//     // url += "order=${}&cat=${}";
//   }else if (){
//     // url += "min=${}&max=${}";
//   }else if (){
//     // url += "cat=${}";
//   }else (){
//     // url += "order=asc";
//   }



  
  // List<String> names = [
  //   'ahhh',
  //   'oohhhh',
  //   'eehhh',
  //   'yeeehhh',
  //   'offff',
  // ];
  

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
                height: SizeConfig.defaultSize! * 3,
              ),

              Container(
                height: SizeConfig.defaultSize! * 22,
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
                          min = values.start;
                          max = values.end;
                        });
                      },
                    ),

                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        FilterChip(
                          label: Text("Lower to higher"),
                          selected: isSelected,
                          onSelected: (bool value){                                                        
                            if(value == true) {
                              setState(() {
                                isSelected2 = false;
                                isSelected = true;
                                HigherToLower = false;
                                LowerToHigher = true;
                                order = "asc";
                              });
                            }else{
                              setState(() {
                                isSelected = false;
                                LowerToHigher = false;
                                order = order;
                              });
                            }
                            print('Lower to Higher selected: $LowerToHigher'); 
                            print('Higher to Lower selected: $HigherToLower');                          
                          },
                          labelStyle: TextStyle(
                            color: secondColor,
                            fontFamily: "blacklisted",
                            fontSize: 14.sp,
                          ),
                          backgroundColor: eswed,
                          selectedColor: redColor,
                          checkmarkColor: secondColor,
                        ),

                        FilterChip(
                          label: Text("Higher to lower"),
                          selected: isSelected2,
                          onSelected: (bool value){
                            if(value == true) {
                              setState(() {
                                isSelected = false;
                                isSelected2 = true;
                                LowerToHigher = false;
                                HigherToLower = true;
                                order = "desc";
                              });
                            }else{
                              setState(() {
                                isSelected2 = false;
                                HigherToLower = false;
                                order = order;
                              });
                            }
                            
                            print('Higher to Lower selected: $HigherToLower');
                            print('Lower to Higher selected: $LowerToHigher');
                          },
                          labelStyle: TextStyle(
                            color: secondColor,
                            fontFamily: "blacklisted",
                            fontSize: 14.sp,
                          ),
                          backgroundColor: eswed,
                          selectedColor: redColor,
                          checkmarkColor: secondColor,
                        )
                        

                        // GestureDetector(
                        //   onTap: () {
                        //     // Navigator.pushNamed(context, "/ascend");                         
                        //   },
                        //   child: Container(
                        //     height: SizeConfig.defaultSize! * 5,
                        //     width: SizeConfig.defaultSize! * 17,
                        //     decoration: BoxDecoration(
                        //       color: secondColor,
                        //       borderRadius: BorderRadius.circular(20),
                        //       border: Border.all(
                        //         color: redColor,
                        //         width: 2,
                        //       ),
                        //     ),
                        //     child: Center(
                        //       child: Text(
                        //         "Lower to higher",
                        //         style: TextStyle(
                        //           color: eswed,
                        //           fontFamily: "blacklisted",
                        //           fontSize: 15.sp,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        // GestureDetector(
                        //   onTap: () {
                        //     // Navigator.pushNamed(context, "/descend");                         
                        //   },
                        //   child: Container(
                        //     height: SizeConfig.defaultSize! * 5,
                        //     width: SizeConfig.defaultSize! * 17,
                        //     decoration: BoxDecoration(
                        //       color: secondColor,
                        //       borderRadius: BorderRadius.circular(20),
                        //       border: Border.all(
                        //         color: redColor,
                        //         width: 2,
                        //       ),
                        //     ),
                        //     child: Center(
                        //       child: Text(
                        //         "Higher to lower",
                        //         style: TextStyle(
                        //           color: eswed,
                        //           fontFamily: "blacklisted",
                        //           fontSize: 15.sp,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),

                    
                  ],
                ),
              ),
        
              SizedBox(
                height: SizeConfig.defaultSize! * 5,
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
                        "Categories",
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
                          pants = false;
                          sets = false;
                          hoodies = false;
                          shirts = value!;
                          category = "Shirts";
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
                          shirts = false;
                          sets = false;
                          hoodies = false;
                          pants = value!;
                          category = "Pants";
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
                          shirts = false;
                          pants = false;
                          hoodies = false;
                          sets = value!;
                          category = "Sets";
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
                          pants = false;
                          sets = false;
                          shirts = false;
                          hoodies = value!;
                          category = "Hoodies";
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
                height: SizeConfig.defaultSize! * 5,
              ),

              GestureDetector(
                onTap: applyFilters,
                child: Container(
                  height: SizeConfig.defaultSize! * 5,
                  width: SizeConfig.defaultSize! * 20,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        eswed,
                        redColor,
                      ]
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: secondColor,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "A p p l y",
                      style: TextStyle(
                        color: secondColor,
                        fontFamily: "blacklisted",
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
              ),
        
              // SizedBox(
              //   height: SizeConfig.defaultSize! * 2,
              // ),
              
              // Container(
              //   height: SizeConfig.defaultSize! * 20,
              //   width: SizeConfig.defaultSize! * 39,
              //   decoration: BoxDecoration(
              //     color: Colors.grey.shade400,
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   child: Column(
              //     children: [

              //       Padding(
              //         padding: const EdgeInsets.only(top: 20, right: 290),
              //         child: Text(
              //           "Brand",
              //           style: TextStyle(
              //             color: eswed,
              //             fontFamily: "blacklisted",
              //             fontSize: 16.sp,
              //           ),
              //         ),
              //       ),

              //       // SizedBox(
              //       //   height: SizeConfig.defaultSize! * 3,
              //       // ),

              //       // Expanded(
              //       //   child: ListView.builder(
              //       //     scrollDirection: Axis.horizontal,
              //       //     itemBuilder: (context, index) {
              //       //       return FilterChip(
              //       //         label: Text(names[index]),
              //       //         selected: isSelected,
              //       //         onSelected: (bool value){
              //       //           setState(() {
              //       //             isSelected = !isSelected;
              //       //           });
              //       //         },
              //       //         labelStyle: TextStyle(
              //       //           color: secondColor,
              //       //           fontFamily: "blacklisted",
              //       //           fontSize: 14.sp,
              //       //         ),
              //       //         backgroundColor: Colors.blueGrey,
              //       //         selectedColor: redColor,
              //       //         checkmarkColor: secondColor,
              //       //       );
              //       //     },
              //       //     itemCount: names.length,
                        
              //       //   ),
              //       // ),

              //       // ChipsChoice<String>.multiple(
              //       //   value: tags,
                      
              //       //   onChanged: (value) {
              //       //     setState(() {
              //       //       tags = value;
              //       //     });
              //       //   },
              //       //   choiceItems: C2Choice.listFrom(
              //       //     source: names,
              //       //     value: (i, v) => v,
              //       //     label: (i, v) => v,
              //       //     disabled: (i, v) => [0, 2, 5].contains(i),
              //       //   ),
              //       //   choiceStyle: const C2ChoiceStyle(
              //       //     color: eswed,
              //       //     borderRadius: BorderRadius.all(Radius.circular(20)),
              //       //   ),
              //       //   choiceActiveStyle: C2ChoiceStyle(
              //       //     color: redColor,
              //       //     borderRadius: BorderRadius.all(Radius.circular(20)),
              //       //   ),
              //       //   wrapped: true,
              //       //   textDirection: TextDirection.ltr,
              //       // ),

                    

                    
              //     ],
              //   ),
              // ),

            ],
          ),
        ),
      ),
    );
  }
}