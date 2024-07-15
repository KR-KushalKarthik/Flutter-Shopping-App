import 'package:flutter/material.dart';
import 'package:app4/data/data.dart';

class WishlistScreen extends StatelessWidget {
  final List<Product> wishlistItems;

  WishlistScreen({Key? key, required this.wishlistItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: ListView.builder(
        itemCount: wishlistItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              wishlistItems[index].productImageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(wishlistItems[index].productName),
            subtitle: Text(
                '\$${wishlistItems[index].currentPrice.toString()}'), // Fix here
            trailing: IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () {
                // Remove item from wishlist
                // You can implement your logic here
              },
            ),
          );
        },
      ),
    );
  }
}
