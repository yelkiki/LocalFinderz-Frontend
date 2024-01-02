// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, unused_import, prefer_const_constructors_in_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/features/register/toast.dart';
import 'package:local_finderzzz/screens/search/filter_items.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';
import 'package:popover/popover.dart';
// import 'package:local_finderzzz/utils/size_config.dart';
// import 'package:local_finderzzz/utils/widgets/constants.dart';
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

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Brand> items = [];
  int currentIndex = 0;
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
  
  // Check if 'data' key exists and if it's a non-null list
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

        body: CustomScrollView(

          slivers: [

            SliverAppBar(
              scrolledUnderElevation: 10,
              
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // CircleAvatar(
                  //   backgroundImage: AssetImage("assets/images/tshirt-favicon-white.png"),
                  //   backgroundColor: Colors.transparent,
                  //   radius: 15,
                  // ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      height: SizeConfig.defaultSize! * 4,
                      width: SizeConfig.defaultSize! * 3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/tshirt-favicon-white.png"),
                          fit: BoxFit.fitWidth,
                        )
                      ),
                    ),
                  ),

                  SizedBox(
                    width: SizeConfig.defaultSize,
                  ),


                  Center(
                    child: Text(
                      "L o c a l  F i n d e r z",
                      style: TextStyle(
                        fontFamily: "blacklisted",
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        color: secondColor,
                      ),
                    ),
                  ),

                ],
              ),
              elevation: 2.0.h,
              pinned: true,
              backgroundColor: Colors.black,

              
              expandedHeight: SizeConfig.defaultSize! * 20,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(                  
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                    color: secondColor,
                    // gradient: LinearGradient(
                    //   colors: [
                    //     eswed,
                    //     redColor,
                    //     eswed,
                    //   ]
                    // ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 35, bottom: 20),
                    child: Container(
                      width: SizeConfig.defaultSize! * 10,
                      height: SizeConfig.defaultSize! * 10,
                      child: Image.asset("assets/images/localfinderz-high-resolution-logo-black-transparent.png"),
                    ),
                  ),
                  
                ),
              ),
              
            ),

            

            SliverToBoxAdapter(
              
              child: Container(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                
                decoration: BoxDecoration(
                  // gradient: LinearGradient(
                  //   colors: const [
                  //     kMainColor,
                  //     thirdColor,
                  //     kMainColor,
                  //   ]
                  // ),
                  color: Colors.transparent,
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Column(
                    children: [

                      //// search bar 
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/searchProducts");
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

                      // categories
                      Container(
                        height: SizeConfig.defaultSize! * 12,
                        width: SizeConfig.defaultSize! * 33,
                        color: Colors.transparent,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/tshirts");
                                  },
                                  child: Container(
                                    height: SizeConfig.defaultSize! * 6,
                                    width: SizeConfig.defaultSize! * 6,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: kMainColor,
                                        width: 2,
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/Black_Tshirt.png"),
                                        fit: BoxFit.fitWidth
                                      ),
                                    ),
                                  ),
                                ),

                                Text(
                                  "T-S H I R T S",
                                  style: TextStyle(
                                    color: kMainColor,
                                    fontFamily: "blacklisted",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp

                                  ),
                                ),
                              ],
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/pants");
                                  },
                                  child: Container(
                                    height: SizeConfig.defaultSize! * 6,
                                    width: SizeConfig.defaultSize! * 6,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: kMainColor,
                                        width: 2,
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/Black_pants.png"),
                                        fit: BoxFit.fitWidth
                                      ),
                                    ),
                                  ),
                                ),

                                Text(
                                  "P A N T S",
                                  style: TextStyle(
                                    color: kMainColor,
                                    fontFamily: "blacklisted",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp

                                  ),
                                ),
                              ],
                            ),

                            
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/sets");
                                  },
                                  child: Container(
                                    height: SizeConfig.defaultSize! * 6,
                                    width: SizeConfig.defaultSize! * 6,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: kMainColor,
                                        width: 2,
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/Black_Set.png"),
                                        fit: BoxFit.fitWidth
                                      ),
                                    ),
                                  ),
                                ),

                                Text(
                                  "S E T S",
                                  style: TextStyle(
                                    color: kMainColor,
                                    fontFamily: "blacklisted",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp

                                  ),
                                ),
                              ],
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/hoodies");
                                  },
                                  child: Container(
                                    height: SizeConfig.defaultSize! * 6,
                                    width: SizeConfig.defaultSize! * 6,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: kMainColor,
                                        width: 2,
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/Black_Hoodie.png"),
                                        fit: BoxFit.fitWidth
                                      ),
                                    ),
                                  ),
                                ),

                                Text(
                                  "H O O D I E S",
                                  style: TextStyle(
                                    color: kMainColor,
                                    fontFamily: "blacklisted",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp

                                  ),
                                ),
                              ],
                            ),
                            
                          ],
                        ),
                      ),

                      SizedBox(
                        height: SizeConfig.defaultSize! * 2,
                      ),
                    
                      ////////////////////////////////////// hena el brands

                      Column(
                        children: [
                          Container(
                            height: SizeConfig.defaultSize! * 20,
                            width: SizeConfig.defaultSize! * 35,
                            child: PageView.builder(
                              itemCount: items.length > 4 ? 4 : items.length,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (int index) {
                                setState(() {
                                  _currentPage = index;
                                });
                              },
                              itemBuilder: (BuildContext context, int index) {
                                Brand item = items[index];
                                return InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      // height: SizeConfig.defaultSize! * 10,
                                      width: SizeConfig.defaultSize! * 33,
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
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          Container(
                            color: Colors.transparent,
                            width: SizeConfig.defaultSize! * 11,
                            height: SizeConfig.defaultSize! * 2,
                            child: PageView.builder(
                              itemCount: items.length > 4 ? 4 : items.length,
                              controller: _pageController,
                              onPageChanged: (int page) {
                                setState(() {
                                  _currentPage = page;
                                });
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: List.generate(
                                    items.length > 4 ? 4 : items.length,
                                    (index) => buildDot(index, context),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      

                    //   Container(
                    //   color: Colors.transparent,
                    //   width: SizeConfig.defaultSize! * 11,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: List.generate(
                    //       contents.length,
                    //       (index) => buildDot(index, context),
                    //     ),
                    //   ),
                    // ),

                      SizedBox(
                        height: SizeConfig.defaultSize! * 5,
                      ),

                    ],
                  ),
                ),
              ),
            ),

            // SliverToBoxAdapter(
            //   child: 
            // ),
            
            

            

          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize! * 1,
      width: _currentPage == index ? SizeConfig.defaultSize! * 3 : SizeConfig.defaultSize! * 1,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        color: _currentPage == index ? redColor : Colors.grey,
      ),
    );
  }

}













                          // Container(
                          //   height: SizeConfig.defaultSize! * 5,
                          //   width: SizeConfig.defaultSize! * 5,
                          //   decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     borderRadius: BorderRadius.circular(15),
                          
                          //   ),
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //     children: [
                          //       Icon(
                          //         Icons.filter_alt_rounded,
                          //         size: 25,
                          //       ),
                          //       Text(
                          //         "Filter",
                          //         style: TextStyle(
                          //           fontSize: 12,
                          //           fontWeight: FontWeight.w600,
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // ),

                          // Container(
                          //   width: SizeConfig.defaultSize! * 11,
                            
                          //   child: DropdownButtonFormField(
                          //     decoration: InputDecoration(
                          //       enabledBorder: OutlineInputBorder(
                          //           borderSide: BorderSide(
                          //             color: Colors.white,
                          //             width: 2
                          //           ),
                          //           borderRadius: BorderRadius.circular(10),
                          //         ),
                          //         focusedBorder: OutlineInputBorder(
                          //           borderSide: BorderSide(
                          //             color: thirdColor,
                          //           ),
                          //           borderRadius: BorderRadius.circular(10),
                          //         ),
                          //     ),
                          //     hint: Text(
                          //       "Filter",
                          //       style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold
                          //       ),
                          //     ),
                          //     dropdownColor: Colors.white,
                          //     // isExpanded: true,
                          //     items: const [
                          //       DropdownMenuItem(child: Text("Men"), value: "m",),
                          //       DropdownMenuItem(child: Text("Women"), value: "w",),
                          //       DropdownMenuItem(child: Text("Unisex"), value: "u",),
                          //     ],
                          //     onChanged: null,
                              
                          //   ),
                          // ),



/////////////////////////////////////////////////////////////////// search bar 
                      // Container(
                      //   height: SizeConfig.defaultSize! * 5,
                      //   width: SizeConfig.defaultSize! * 30,
                      //   child: TextFormField(
                      //     // controller: emailController,
                      //     textAlign: TextAlign.start,
                          
                      //     decoration: InputDecoration(
                            
                      //       filled: true,
                      //       fillColor: Colors.grey.shade100,
                      //       hintText: "Search for products",

                      //       hintStyle: TextStyle(
                      //         fontSize: 13.sp,
                      //         color: kMainColor,
                      //         fontStyle: FontStyle.italic,
                      //         // fontWeight: FontWeight.bold,
                              
                      //       ),
                            
                      //       prefixIcon: Icon(
                      //         Icons.search,
                      //         color: kMainColor,
                                              
                      //       ),

                      //       // suffixIcon: Container(
                      //       //   child: GestureDetector(
                      //       //     onTap: () => showPopover(
                      //       //       context: context,
                      //       //       bodyBuilder: (context) => FilterItems(),
                      //       //       width: 100,
                      //       //       height: 50,
                      //       //       direction: PopoverDirection.bottom
                      //       //     ),
                      //       //     child: const Icon(
                      //       //       Icons.filter_alt,
                      //       //     ),
                      //       //   ),
                      //       // ),
                            
                            
                      //       border: InputBorder.none,
                            
                      //       enabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: kMainColor,
                      //         ),
                      //         borderRadius: BorderRadius.circular(30),
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: thirdColor,
                      //         ),
                      //         borderRadius: BorderRadius.circular(30),
                      //       ),
                            
                      //     ),
                      //   ),
                      // ),
