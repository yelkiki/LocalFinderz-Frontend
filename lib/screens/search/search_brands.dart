// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

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
  final String email;
  final String address;
  final int phone;
  final String logo;

  Brand({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.logo,
  });
  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      phone: json['phone'] as int,
      logo: json['logo'] as String,
    );
  }
}

List<Brand> parseBrands(List<Map<String, dynamic>> brandList) {
  return brandList.map((data) => Brand.fromJson(data)).toList();
}


class SearchBrands extends StatefulWidget {
  const SearchBrands({super.key});

  @override
  State<SearchBrands> createState() => _SearchBrandsState();
}

class _SearchBrandsState extends State<SearchBrands> {

List<Brand> items = [];

   @override
  void initState() {
    super.initState();
    _DisplaySearchedBrands(context);
  }

  final TextEditingController search = TextEditingController();

 Future<void> _DisplaySearchedBrands(BuildContext context) async {
  final Uri url = Uri.parse('http://10.0.2.2:3000/product/searchBrand');

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
  final String? message = decodedBody['message'];
  // Check if 'data' key exists and if it's a non-null list
  if (decodedBody.containsKey('data') && decodedBody['data'] is List) {
    final List<Map<String, dynamic>> fetchedItems =
      List<Map<String, dynamic>>.from(decodedBody['data']);

/////////////////////////////////////// NOT WORKING
  print(message);
  print(statusCode);
  print(fetchedItems);

    if (statusCode == 200) {
      setState(() {
        items = parseBrands(fetchedItems);
      });
      print('Parsed Items: ${items[0]}');
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
                  onChanged: (value) => _DisplaySearchedBrands(context),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    hintText: "Search for brands",
                        
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
                        color: thirdColor,
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

              Container(

              ),

            ],
          )
        ),
    
        body: Container(
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
                    color: Colors.white,
                    width: 3,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  item.name,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}