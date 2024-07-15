// cart_screen.dart
import 'package:flutter/material.dart';
import 'package:app4/data/data.dart';

class CartScreen extends StatefulWidget {
  final List<Product> cartItems;

  CartScreen({Key? key, required this.cartItems}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final product = widget.cartItems[index];
          return ListTile(
            title: Text(product.productName),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  widget.cartItems.removeAt(index);
                });
              },
            ),
            onTap: () {
              // Implement navigation to product detail screen if needed
            },
          );
        },
      ),
    );
  }
}
