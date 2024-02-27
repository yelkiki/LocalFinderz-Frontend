// ignore_for_file: unnecessary_brace_in_string_interps, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_finderzzz/features/register/toast.dart';
import 'package:local_finderzzz/screens/main_pages/filter/filter.dart';
import 'package:http/http.dart' as http;
import 'package:local_finderzzz/utils/size_config.dart';
import 'package:local_finderzzz/utils/widgets/constants.dart';

class Product {
  final int id;
  final String name;
  final String image;
  final int price;
  final String brand;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.brand,
  });
}

List<Product> parseProducts(List<Map<String, dynamic>> productList) {
  return productList.map((data) {
    return Product(
      id: data['id'] as int,
      name: data['name'] as String,
      image: data['image'] as String,
      price: data['price'] as int,
      brand: data['brand'] as String,
    );
  }).toList();
}


class FilteredItems extends StatefulWidget {
  final FilterCriteria criteria;

  FilteredItems({required this.criteria});

  @override
  State<FilteredItems> createState() => _FilteredItemsState();
}

class _FilteredItemsState extends State<FilteredItems> {

  late double min;
  late double max;
  late String order;
  late String category;

  @override
  void initState() {
    super.initState();
    min = widget.criteria.min;
    max = widget.criteria.max;
    order = widget.criteria.order;
    category = widget.criteria.category;
    _displayFilteredProducts(context);
  }

  List<Product> items = [];
  


  Future<void> _displayFilteredProducts(BuildContext context) async {
    Uri url = Uri.parse('https://localfinderz.onrender.com/product/filter');
    
    print(min);
    print(max);
    print(order);
    print(category);

    String queryParams = '';

    if (category != "" && order != "") {
      queryParams = 'min=${min}&max=${max}&order=${order}&cat=${category}';
    } else if (order != "") {
      queryParams = 'min=${min}&max=${max}&order=${order}';
    } else if (category != "") {
      queryParams = 'min=${min}&max=${max}&cat=${category}';
    } else {
      queryParams = 'min=${min}&max=${max}&order=asc';
    }

    url = Uri.parse('$url?$queryParams');



    final response = await http.get(
      url,
      headers: <String, String>{ 
        'Content-Type': 'application/json; charset=UTF-8', 
      },
    );

    final Map<String, dynamic> decodedBody = json.decode(response.body);
    final int? statusCode = decodedBody['statusCode'];
    final String? message = decodedBody['message'];

    if (decodedBody.containsKey('data') && decodedBody['data'] is List) {
      final List<Map<String, dynamic>> fetchedItems =
        List<Map<String, dynamic>>.from(decodedBody['data']);
    print(message);
    print(statusCode);
    print(fetchedItems);

      if (statusCode == 200) {
        setState(() {
          items = parseProducts(fetchedItems);
        });
      } else {
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
    // List<Product> filteredProducts = getFilteredProducts();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              "Filtered Items",
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
                                                'Brand: ${item.brand}',
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
