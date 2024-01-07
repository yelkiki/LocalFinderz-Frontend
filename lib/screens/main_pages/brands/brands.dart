// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/features/register/toast.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';
import 'package:http/http.dart' as http;



class Brand {
  final int id;
  final String name;

  Brand({required this.id,required this.name});
}

List<Brand> parseBrands(List<Map<String, dynamic>> brandList) {
  return brandList.map((data) {
    return Brand(
      id: data['id'] as int,
      name: data['name'] as String,
);
}).toList();
}

class Brands extends StatefulWidget {
  Brands({super.key});

  @override
  State<Brands> createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  List<Brand> items = [];

   @override
  void initState() {
    super.initState();
    _DisplayBrands(context);
  }

 Future<void> _DisplayBrands(BuildContext context) async {
  final Uri url = Uri.parse('http://10.0.2.2:3000/product/brands');

  final response = await http.get(
    url,
    headers: <String, String>{ 
      'Content-Type': 'application/json; charset=UTF-8',
      // "authorization":token!, 
    }, 
  );

  final Map<String, dynamic> decodedBody = json.decode(response.body);
  final int? statusCode = decodedBody['statusCode'];
  final String? message = decodedBody['message'];
  
  if (decodedBody.containsKey('data') && decodedBody['data'] is List) {
    final List<Map<String, dynamic>> fetchedItems =
      List<Map<String, dynamic>>.from(decodedBody['data']);

    if (statusCode == 200) {
      setState(() {
        items = parseBrands(fetchedItems);
      });
      // showToast(message: "$message");
    } else {
      showToast(message: "Error $message");
    }
  } else {
    showToast(message: "Invalid data received");
  }
}






  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        extendBody: true,

        appBar: AppBar(
          title: Text(
            "B r a n d s",
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
            color: Colors.transparent
          ),
          child: Column(

            children: [

              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),

              //// search bar 
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/searchBrands");
                },
                child: Container(
                  height: SizeConfig.defaultSize! * 5,
                  width: SizeConfig.defaultSize! * 30,
                  decoration: BoxDecoration(
                    color: secondColor,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: kMainColor,
                      width: 2,
                    )
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
                        "Search for brands",
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
                height: SizeConfig.defaultSize! * 1,
              ),

              Expanded(
                child: Container(
                  width: SizeConfig.defaultSize! * 35,
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      Brand item = items[index];
                      return Container(
                        height: SizeConfig.defaultSize! * 15,
                        
                        margin: EdgeInsets.symmetric(vertical: 15.h),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: kMainColor,
                            width: 3,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          item.name,
                          style: TextStyle(
                            color: redColor,
                            fontSize: 18.sp,
                            fontFamily: "blacklisted",

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

//ListView.builder(
//   itemCount: itemCount,
//   itemBuilder: (BuildContext context, int index) {
//     if (index == 0) {
//       return Container(
//         // Your container at the top
//         height: 100,
//         color: Colors.blue,
//         child: Center(
//           child: Text('Pinned Container at the Top'),
//         ),
//       );
//     }
//     // Your other list items
//     return ListTile(
//       title: Text('Item $index'),
//     );
//   },
// )


/////////////////////////////////////////////////
///
///Column(
            //   children: [
        
            //     SizedBox(
            //       height: SizeConfig.defaultSize! * 5,
            //     ),
        
            //     Container(
            //       height: SizeConfig.defaultSize! * 5,
            //       width: SizeConfig.defaultSize! * 30,
            //       child: TextFormField(
            //           // controller: ,
            //           textAlign: TextAlign.start,
                      
            //           decoration: InputDecoration(
                        
            //             filled: true,
            //             fillColor: Colors.grey.shade100,
            //             hintText: "Search for brands",
        
            //             hintStyle: TextStyle(
            //               fontSize: 13.sp,
            //               color: kMainColor,
            //               fontStyle: FontStyle.italic,
            //               // fontWeight: FontWeight.bold,
                          
            //             ),
                        
            //             prefixIcon: Icon(
            //               Icons.search,
            //               color: kMainColor,
                                          
            //             ),     
        
            //             border: InputBorder.none,
                        
            //             enabledBorder: OutlineInputBorder(
            //               borderSide: BorderSide(
            //                 color: kMainColor,
            //               ),
            //               borderRadius: BorderRadius.circular(30),
            //             ),
            //             focusedBorder: OutlineInputBorder(
            //               borderSide: BorderSide(
            //                 color: thirdColor,
            //               ),
            //               borderRadius: BorderRadius.circular(30),
            //             ),
                        
            //           ),
            //         ),
            //     ),

            //     SizedBox(
            //       height: SizeConfig.defaultSize! * 4,
            //     ),
        
            //     Container(
            //       height: SizeConfig.defaultSize! * 15,
            //       width: SizeConfig.defaultSize! * 35,
            //       decoration: BoxDecoration(
            //         color: Colors.grey,
            //         borderRadius: BorderRadius.circular(20),
            //         border: Border.all(
            //           color: Colors.white,
            //           width: 2,
            //         ),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black,
            //             offset: Offset(4.0.h, 4.0.w),
            //             blurRadius: 15.0.w,
            //             spreadRadius: 1.0.w,
            //           )
            //         ],
            //         image: DecorationImage(
            //           image: AssetImage("assets/images/el-arzaa2-bellaah-high-resolution-logo5.png"),
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //     ),
        
            //     SizedBox(
            //       height: SizeConfig.defaultSize! * 5,
            //     ),

                
            //     Container(
            //       height: SizeConfig.defaultSize! * 15,
            //       width: SizeConfig.defaultSize! * 35,
            //       decoration: BoxDecoration(
            //         color: Colors.grey,
            //         borderRadius: BorderRadius.circular(20),
            //         border: Border.all(
            //           color: Colors.white,
            //           width: 2,
            //         ),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black,
            //             offset: Offset(4.0.h, 4.0.w),
            //             blurRadius: 15.0.w,
            //             spreadRadius: 1.0.w,
            //           )
            //         ],
            //         image: DecorationImage(
            //           image: AssetImage("assets/images/el7erafyeen-high-resolution-logo3.png"),
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //     ),

            //     SizedBox(
            //       height: SizeConfig.defaultSize! * 5,
            //     ),

                
            //     Container(
            //       height: SizeConfig.defaultSize! * 15,
            //       width: SizeConfig.defaultSize! * 35,
            //       decoration: BoxDecoration(
            //         color: Colors.grey,
            //         borderRadius: BorderRadius.circular(20),
            //         border: Border.all(
            //           color: Colors.white,
            //           width: 2,
            //         ),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black,
            //             offset: Offset(4.0.h, 4.0.w),
            //             blurRadius: 15.0.w,
            //             spreadRadius: 1.0.w,
            //           )
            //         ],
            //         image: DecorationImage(
            //           image: AssetImage("assets/images/el-arzaa2-bellaah-high-resolution-logo2.png"),
            //           fit: BoxFit.cover,
            //         ),

            //       ),
            //     ),

            //     SizedBox(
            //       height: SizeConfig.defaultSize! * 5,
            //     ),

                
            //     Container(
            //       height: SizeConfig.defaultSize! * 15,
            //       width: SizeConfig.defaultSize! * 35,
            //       decoration: BoxDecoration(
            //         color: Colors.grey,
            //         borderRadius: BorderRadius.circular(20),
            //         border: Border.all(
            //           color: Colors.white,
            //           width: 2,
            //         ),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black,
            //             offset: Offset(4.0.h, 4.0.w),
            //             blurRadius: 15.0.w,
            //             spreadRadius: 1.0.w,
            //           )
            //         ],
            //         image: DecorationImage(
            //           image: AssetImage("assets/images/logo-color.png"),
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //     ),

            //     SizedBox(
            //       height: SizeConfig.defaultSize! * 5,
            //     ),

                
            //   ],
            // ),
