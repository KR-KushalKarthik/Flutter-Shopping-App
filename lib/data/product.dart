import 'package:flutter/material.dart';

class Product {
  final String productName;
  final String productImageUrl;
  final String currentPrice;
  final String oldPrice;
  final bool isLiked;
  final String description;

  const Product({
    required this.productName,
    required this.productImageUrl,
    required this.currentPrice,
    required this.oldPrice,
    required this.isLiked,
    required this.description,
  });
}

final products = [
  const Product(
    productName: "New T-Shirt Design",
    productImageUrl: "assets/O.png",
    currentPrice: "25",
    oldPrice: "30",
    isLiked: true,
    description: 'This is a brand new t-shirt design!',
  ),
  const Product(
    productName: "Summer Dress",
    productImageUrl: "assets/G.png",
    currentPrice: "45",
    oldPrice: "50",
    isLiked: false,
    description: 'Perfect for summer outings!',
  ),
  // Add more products as needed
];

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.asset(
              product.productImageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(product.productName),
            subtitle: Text(product.description),
            trailing: Text('\$${product.currentPrice}'),
            onTap: () {
              // Handle tapping on the product item
            },
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CartScreen(),
  ));
}
