// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';

class Brands extends StatelessWidget {
  Brands({super.key});

  final List<String> items = List.generate(20, (index) => 'Brand ${index + 1}');

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // extendBody: true,

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
                  Navigator.pushNamed(context, "/searchBrands");
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
                      return Container(
                        height: SizeConfig.defaultSize! * 15,
                        
                        margin: EdgeInsets.symmetric(vertical: 15.h),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          items[index],
                          style: TextStyle(color: Colors.white, fontSize: 18),
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
