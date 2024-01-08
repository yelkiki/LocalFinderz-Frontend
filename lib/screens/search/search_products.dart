// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/features/register/toast.dart';
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';
import 'package:http/http.dart' as http;


class Product {
  final int id;
  final String name;
  final int price;
  final String sex;
  final String image;
  final int quantity;
  final String category;
  final int brandId;
  final Brand brand;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.sex,
    required this.image,
    required this.quantity,
    required this.category,
    required this.brandId,
    required this.brand,
  });
}

class Brand {
  final String name;

  Brand({required this.name});
}

List<Product> parseProducts(List<Map<String, dynamic>> productList) {
  return productList.map((data) {
    return Product(
      id: data['id'] as int,
      name: data['name'] as String,
      price: data['price'] as int,
      sex: data['sex'] as String,
      image: data['image'] as String,
      quantity: data['quantity'] as int,
      category: data['category'] as String,
      brandId: data['brandId'] as int,
      brand: Brand(name: data['brand']['name'] as String),
    );
  }).toList();
}



class SearchProducts extends StatefulWidget {
  const SearchProducts({super.key});

  @override
  State<SearchProducts> createState() => _SearchProductsState();
}

class _SearchProductsState extends State<SearchProducts> {

  List<Product> items = [];

   @override
  void initState() {
    super.initState();
    _DisplaySearchedProducts(context);
  }

  final TextEditingController search = TextEditingController();

 Future<void> _DisplaySearchedProducts(BuildContext context) async {
  final Uri url = Uri.parse('http://10.0.2.2:3000/product/search');

  final response = await http.post(
    url,
    headers: <String, String>{ 
      'Content-Type': 'application/json; charset=UTF-8', 
    }, body: jsonEncode(<String, dynamic>{
      "keyword":search.text
    },
  ));

  final Map<String, dynamic> decodedBody = json.decode(response.body);
  final int? statusCode = decodedBody['statusCode'];
  // final String? message = decodedBody['message'];

  if (decodedBody.containsKey('data') && decodedBody['data'] is List) {
    final List<Map<String, dynamic>> fetchedItems =
      List<Map<String, dynamic>>.from(decodedBody['data']);


    if (statusCode == 200) {
      setState(() {
        items = parseProducts(fetchedItems);
      });
      // showToast(message: "$message");
    } else {
      // showToast(message: "Error $message");
      setState(() {
        items = parseProducts(fetchedItems);
      });
    }
  } else {
    showToast(message: "Invalid data received");
  }
}







  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          elevation: SizeConfig.defaultSize,
          toolbarHeight: SizeConfig.defaultSize! * 7,
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Row(
            children: [

              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  
                ),
              ),

              SizedBox(
                width: SizeConfig.defaultSize,
              ),

              Container(
                height: SizeConfig.defaultSize! * 5,
                width: SizeConfig.defaultSize! * 30,
                child: TextFormField(
                  controller: search,
                  textAlign: TextAlign.start,
                  autofocus: true,
                  onChanged: (value) => _DisplaySearchedProducts(context),
                  decoration: InputDecoration(
                    
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    hintText: "Search for products",
                        
                    hintStyle: TextStyle(
                      fontSize: 12.sp,
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
                        color: redColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    
                  ),
                ),
              ),

              SizedBox(
                width: SizeConfig.defaultSize! * 2,
              ),
            ],
          )
        ),
    
        body: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Center(
            child: Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.defaultSize! * 40,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Expanded(
                    child: Container(
                      // width: SizeConfig.defaultSize! * 40,
                      
                      color: Colors.transparent,
                      
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15.0,
                          mainAxisSpacing: 10.0,
                          mainAxisExtent: SizeConfig.defaultSize! * 35,
                        ),
                        itemCount: items.length,
            
                        itemBuilder: (BuildContext context, int index) {
                          Product item = items[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: secondColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: kMainColor,
                                width: 2,
                              )
                            ),
                            
                            child: Stack(
                              children: [
            
                                // Align(
                                //   alignment: Alignment.topRight,
                                //   child: Padding(
                                //     padding: const EdgeInsets.all(5.0),
                                //     child: GestureDetector(
                                //       onTap: () {
                                //         setState(() {
                                //           isFavorite = !isFavorite; // Toggle favorite state
                                //         });
                                //       },
                                //       child: Icon(
                                //         isFavorite ? Icons.favorite : Icons.favorite_border,
                                //         color: isFavorite ? redColor : kMainColor,
                                //       ),
                                //     ),
                                //   ),
                                  
                                // ),
            
                                InkWell(
                                  onTap: () {
                                    // Handle item tap
                                    print('Tapped on: ${item.id}');
            
                                    // setState(() {
                                    //   isFavorite = !isFavorite; // Toggle favorite state
                                    // });
                                    // Navigator.pushNamed(context,'/productDetails',arguments:item.id)
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                                    
                                      Center(
                                        child: Container(
                                          height: SizeConfig.defaultSize! * 20,
                                          width: SizeConfig.defaultSize! * 15,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                item.image,                                      
                                              ),
                                              fit: BoxFit.fitWidth, 
                                            ),
                                          ),
                                        ),
                                      ),
                                                    
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Column(
                                          
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          
                                          children: [
                            
                                            Text(
                                              item.name,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.sp,
                                              ),
                                            ),
                            
                                            SizedBox(
                                              height: SizeConfig.defaultSize,
                                            ),
                            
                                            Text(
                                              'Price: \$${item.price}',
                                              style: TextStyle(
                                                color: Colors.grey.shade800,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                            
                                            SizedBox(
                                              height: SizeConfig.defaultSize,
                                            ),
                            
                                            Text(
                                              'Brand: ${item.brand.name}',
                                              style: TextStyle(
                                                color: Colors.grey.shade800,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
            
                    ),
                  ),
            ),
          ),
        ),
    
      ),
    );
  }
}


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