// ignore_for_file: unnecessary_brace_in_string_interps, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:local_finderzzz/features/register/toast.dart';
import 'package:local_finderzzz/screens/main_pages/filter/filter.dart';
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
    // Accessing criteria values
    min = widget.criteria.min;
    max = widget.criteria.max;
    order = widget.criteria.order;
    category = widget.criteria.category;
  }

  List<Product> items = [];


  Future<void> _DisplayFilteredProducts(BuildContext context) async {
    Uri url = Uri.parse('http://10.0.2.2:3000/product/filter');

    String queryParams = '';

    if (category != "" && order != "") {
      queryParams = 'min=$min&max=$max&order=$order&cat=$category';
    } else if (order != "") {
      queryParams = 'min=$min&max=$max&order=$order';
    } else if (category != "") {
      queryParams = 'min=$min&max=$max&cat=$category';
    } else {
      queryParams = 'min=$min&max=$max&order=asc';
    }

    url = Uri.parse('$url?$queryParams');


    // if (category != "" && order != ""){
    //   url += "min=${min}&max=${max}&order=${order}&cat=${category}";
    // }else if (order != ""){

    //   url += "min=${min}&max=${max}&order=${order}";
    // }else if (category != ""){
    //   url += "min=${min}&max=${max}&cat=${category}";
    // }else{
    //   url += "min=${min}&max=${max}&order=asc";
    // }

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

    return Scaffold(
      appBar: AppBar(
        title: Text('Filtered Items'),
      ),
      // body: ListView.builder(
      //   itemCount: filteredProducts.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(filteredProducts[index].name),
      //       // Display more product details here as needed
      //     );
      //   },
      // ),
    );
  }
}
