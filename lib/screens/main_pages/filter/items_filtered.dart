import 'package:flutter/material.dart';
import 'package:local_finderzzz/screens/main_pages/filter/filter.dart';

class Product {
  final String name;
  // Add more properties as needed

  Product(this.name);
}

class FilteredItems extends StatelessWidget {
  final FilterCriteria criteria;

  // Dummy product list (replace with your actual data)
  final List<Product> productList = [
    Product('Product 1'),
    Product('Product 2'),
    Product('Product 3'),
    // Add more products as needed
  ];

  FilteredItems({required this.criteria});

  // Function to filter products based on criteria
  List<Product> getFilteredProducts() {
    return productList.where((product) {
      // Customize the condition based on your criteria
      return (criteria.priceRange.start <= 2000 &&
              criteria.priceRange.end >= 3000) ||
          criteria.shirts ||
          criteria.pants ||
          criteria.sets ||
          criteria.hoodies;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts = getFilteredProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text('Filtered Items'),
      ),
      body: ListView.builder(
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredProducts[index].name),
            // Display more product details here as needed
          );
        },
      ),
    );
  }
}
