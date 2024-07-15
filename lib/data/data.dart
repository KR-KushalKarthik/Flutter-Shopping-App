import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:app4/screens/payment_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  double _userRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.productName),
        actions: [
          IconButton(
            icon: Icon(Icons.payment), // Payment icon
            onPressed: () {
              // Handle payment icon tap
              // For example, navigate to the payment screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display product image
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(widget.product.productImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Display product details
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              widget.product.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Price:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              '\$${widget.product.currentPrice}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // Rating section
            Text(
              'Rating:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            RatingBar.builder(
              initialRating: widget.product.averageRating,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 30,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _userRating = rating;
                });
              },
            ),
            SizedBox(height: 10),
            Text(
              'Your Rating: $_userRating',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // Payment button
            ElevatedButton(
              onPressed: () {
                // Handle payment button tap
                // For example, navigate to the payment screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(),
                  ),
                );
              },
              child: Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String productName;
  final String productImageUrl;
  final String currentPrice;
  final List<String> additionalImages;
  final String brand;
  final bool available;
  final String oldPrice;
  final bool isLiked;
  final String description;
  final String size;
  final String color;
  final String material;
  final double averageRating;

  Product({
    required this.productName,
    required this.productImageUrl,
    required this.currentPrice,
    required this.additionalImages,
    required this.brand,
    required this.available,
    required this.oldPrice,
    required this.isLiked,
    required this.description,
    required this.color,
    required this.material,
    required this.size,
    required this.averageRating,
  });

  get price => null;

  get category => null;
}

class Category {
  final String categoryName;
  final String productCount;
  final String thumbnailImage;

  Category({
    required this.categoryName,
    required this.productCount,
    required this.thumbnailImage,
  });
}

final categories = [
  Category(
    categoryName: "T-SHIRT",
    productCount: "240",
    thumbnailImage:
        "https://images.unsplash.com/photo-1576871337622-98d48d1cf531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  ),
  Category(
    categoryName: "Formals",
    productCount: "120",
    thumbnailImage:
        "https://images.unsplash.com/photo-1595341888016-a392ef81b7de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1179&q=80",
  ),
  Category(
    categoryName: "HODDIE",
    productCount: "200",
    thumbnailImage:
        "https://images.unsplash.com/photo-1647771746277-eac927afab2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  ),
  Category(
    categoryName: "JEANS",
    productCount: "240",
    thumbnailImage:
        "https://images.unsplash.com/photo-1576995853123-5a10305d93c0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  ),
];

final products = [
  Product(
    productName: "KK - Oversized Tshirt",
    productImageUrl:
        "https://images.unsplash.com/photo-1588117305388-c2631a279f82?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80",
    currentPrice: "500",
    additionalImages: ["assets/tshirts.png"],
    brand: 'KK',
    available: true,
    oldPrice: "700",
    isLiked: true,
    description:
        'This is an oversized t-shirt made of high-quality cotton fabric. It features a relaxed fit and a round neckline. Perfect for casual wear or lounging around at home.',
    color: 'Red',
    size: 'XL',
    material: 'Cotton',
    averageRating: 4.5,
  ),
  Product(
    productName: "Crop Top Hoddie",
    productImageUrl:
        "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=720&q=80",
    currentPrice: "392",
    additionalImages: ["assets/O.png"],
    brand: 'KK',
    available: true,
    oldPrice: "400",
    isLiked: false,
    description:
        'Stay trendy with this stylish crop top hoodie. Made of soft polyester fabric, it offers a comfortable fit with a fashionable look. Perfect for pairing with high-waisted jeans or leggings.',
    color: 'Blue',
    size: 'M',
    material: 'Polyester',
    averageRating: 4.2,
  ),
  Product(
    productName: "Half Tshirt",
    productImageUrl:
        "https://images.unsplash.com/photo-1529139574466-a303027c1d8b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    currentPrice: "204",
    additionalImages: ["assets/tshirts.png"],
    brand: 'KK',
    available: false,
    oldPrice: "350",
    isLiked: true,
    description:
        'Get a casual yet trendy look with this half t-shirt. Made of high-quality polyester fabric, it offers a comfortable and breathable fit. Perfect for everyday wear or a casual day out with friends.',
    color: 'Blue',
    size: 'M',
    material: 'Polyester',
    averageRating: 4,
  ),
  Product(
    productName: "Strip Tourser",
    productImageUrl:
        "https://images.unsplash.com/photo-1509631179647-0177331693ae?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80",
    currentPrice: "230",
    additionalImages: ["assets/ee.png"],
    brand: 'KK',
    available: true,
    oldPrice: "750",
    isLiked: false,
    description:
        'Add a stylish touch to your wardrobe with these striped trousers. Made of durable polyester fabric, these trousers offer a comfortable fit with a fashionable look. Perfect for both casual and formal occasions.',
    color: 'Blue',
    size: 'M',
    material: 'Polyester',
    averageRating: 4.5,
  ),
  Product(
    productName: "KK - Jeans",
    productImageUrl:
        "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    currentPrice: "240",
    additionalImages: [
      "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    ],
    brand: 'KK',
    available: false,
    oldPrice: "489",
    isLiked: false,
    description:
        'Stay comfortable and stylish with these classic jeans. Made of high-quality cotton fabric, these jeans offer a comfortable fit with a timeless look. Perfect for everyday wear or casual outings.',
    color: 'Orange',
    size: 'L',
    material: 'cotton',
    averageRating: 5,
  ),
  Product(
    productName: "Best Fit Women Outfit",
    productImageUrl:
        "https://images.unsplash.com/photo-1581044777550-4cfa60707c03?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80",
    currentPrice: "392",
    additionalImages: [
      "https://images.unsplash.com/photo-1581044777550-4cfa60707c03?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80",
    ],
    brand: 'KK',
    available: true,
    oldPrice: "400",
    isLiked: false,
    description:
        'Look your best with this stylish women\'s outfit. Made of soft polyester fabric, it offers a comfortable fit with a trendy look. Perfect for casual outings or special occasions.',
    color: 'Blue',
    size: 'M',
    material: 'Polyester',
    averageRating: 4.2,
  ),
  Product(
    productName: "GirlS Hoddies",
    productImageUrl: "assets/O.png",
    currentPrice: "204",
    additionalImages: ["assets/hoddie1.png"],
    brand: 'KK',
    available: false,
    oldPrice: "350",
    isLiked: false,
    description:
        'Look your best with this stylish women\'s outfit. Made of soft polyester fabric, it offers a comfortable fit with a trendy look. Perfect for casual outings or special occasions.',
    color: 'Orange',
    size: 'L',
    material: 'cotton',
    averageRating: 5,
  ),
  Product(
    productName: "KK - Jeans",
    productImageUrl: "assets/P.png",
    currentPrice: "240",
    additionalImages: ["assets/Q.png"],
    brand: 'KK',
    available: false,
    oldPrice: "489",
    isLiked: false,
    description: '',
    color: 'Orange',
    size: 'L',
    material: 'cotton',
    averageRating: 5,
  ),
  Product(
    productName: "KK - Shirt-Dress",
    productImageUrl: "assets/hh.png",
    currentPrice: "240",
    additionalImages: ["assets/aa.png"],
    brand: 'KK',
    available: true,
    oldPrice: "489",
    isLiked: false,
    description: '',
    color: 'Orange',
    size: 'L',
    material: 'cotton',
    averageRating: 5,
  ),
  Product(
    productName: "Hoddies",
    productImageUrl:
        "https://images.unsplash.com/photo-1517298257259-f72ccd2db392?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80",
    currentPrice: "204",
    additionalImages: ["assets/O.png"],
    brand: 'KK',
    available: true,
    oldPrice: "350",
    isLiked: true,
    description: '',
    color: 'Orange',
    size: 'L',
    material: 'cotton',
    averageRating: 5,
  ),
  Product(
    productName: "Plain dress",
    productImageUrl: "assets/A.png",
    currentPrice: "204",
    additionalImages: ["assets/B.png"],
    brand: 'KK',
    available: false,
    oldPrice: "350",
    isLiked: true,
    description: '',
    color: 'Orange',
    size: 'L',
    material: 'cotton',
    averageRating: 5,
  ),
  Product(
    productName: "Girls Outfit",
    productImageUrl: "assets/B.png",
    currentPrice: "204",
    additionalImages: ["assets/I.png"],
    brand: 'KK',
    available: true,
    oldPrice: "350",
    isLiked: true,
    description: '',
    color: 'Orange',
    size: 'L',
    material: 'cotton',
    averageRating: 5,
  ),
  Product(
    productName: "shift dress",
    productImageUrl: "assets/aa.png",
    currentPrice: "204",
    additionalImages: ["assets/ee.png"],
    brand: 'KK',
    available: false,
    oldPrice: "350",
    isLiked: true,
    description: '',
    color: 'Orange',
    size: 'L',
    material: 'cotton',
    averageRating: 5,
  ),
  Product(
    productName: "dress",
    productImageUrl: "assets/C.png",
    currentPrice: "204",
    additionalImages: ["assets/E.png"],
    brand: 'KK',
    available: true,
    oldPrice: "350",
    isLiked: false,
    description: '',
    color: 'Orange',
    size: 'L',
    material: 'cotton',
    averageRating: 5,
  ),
  Product(
    productName: "classy",
    productImageUrl: "assets/K.png",
    currentPrice: "204",
    additionalImages: ["assets/L.png"],
    brand: 'KK',
    available: false,
    oldPrice: "350",
    isLiked: true,
    description: '',
    color: 'Orange',
    size: 'L',
    material: 'cotton',
    averageRating: 5,
  ),
  Product(
    productName: "GirlS Tops",
    productImageUrl: "assets/N.png",
    currentPrice: "204",
    additionalImages: ["assets/N.png"],
    brand: 'KK',
    available: true,
    oldPrice: "350",
    isLiked: true,
    description: 'Girls Sleeves dress',
    color: 'Orange',
    size: 'L',
    material: 'cotton',
    averageRating: 5,
  ),
  Product(
    productName: "GirlS Hoddies",
    productImageUrl: "assets/O.png",
    currentPrice: "204",
    additionalImages: ["assets/hoddie1.png"],
    brand: 'KK',
    available: false,
    oldPrice: "350",
    isLiked: false,
    description: '',
    color: 'Orange',
    size: 'L',
    material: 'cotton',
    averageRating: 5,
  ),
  Product(
    productName: "Casual Shirt",
    productImageUrl: "assets/Q.png",
    currentPrice: "204",
    additionalImages: ["assets/kushal.jpg"],
    brand: 'KK',
    available: true,
    oldPrice: "350",
    isLiked: false,
    description: 'Plain Yellow',
    color: 'Orange',
    size: 'L',
    material: 'cotton',
    averageRating: 5,
  ),
  Product(
    productName: "Mens-Jackets",
    productImageUrl: "assets/P.png",
    currentPrice: "204",
    additionalImages: ["assets/backkkk.png"],
    brand: 'KK',
    available: false,
    oldPrice: "350",
    isLiked: true,
    description: 'Leather Jackets',
    color: 'Orange',
    size: 'L',
    material: 'cotton',
    averageRating: 5,
  ),
  Product(
    productName: "Chudiddars",
    productImageUrl: "assets/E.png",
    currentPrice: "204",
    additionalImages: ["assets/J.png"],
    brand: 'KK',
    available: true,
    oldPrice: "350",
    isLiked: true,
    description: '',
    color: 'Orange',
    size: 'L',
    material: 'cotton',
    averageRating: 5,
  ),
  Product(
    productName: "T-shirts",
    productImageUrl: "assets/tshirts.png",
    currentPrice: "250",
    additionalImages: ["assets/tshirts.png"],
    brand: 'KK',
    available: false,
    oldPrice: "350",
    isLiked: true,
    description: '',
    color: 'Orange',
    size: 'L',
    material: 'cotton',
    averageRating: 5,
  ),
  Product(
    productName: "Sweat-shirts",
    productImageUrl: "assets/R.png",
    currentPrice: "950",
    additionalImages: ["assets/P.png"],
    available: true,
    brand: 'KK',
    oldPrice: "1500",
    isLiked: true,
    description: '',
    color: 'Orange',
    size: 'L' 'M' 'xl' 'xxl',
    material: 'cotton',
    averageRating: 5,
  ),
  Product(
    productName: "Half-shirts",
    productImageUrl: "assets/S.jpg",
    currentPrice: "950",
    additionalImages: ["assets/bbb.png"],
    brand: 'KK',
    available: true,
    oldPrice: "1500",
    isLiked: true,
    description: '',
    color: 'Orange',
    size: 'L' 'M' 'xl' 'xxl',
    material: 'cotton',
    averageRating: 5,
  ),
  Product(
    productName: "KK - Denim-Shirts",
    productImageUrl: "assets/Q.png",
    currentPrice: "240",
    additionalImages: ["assets/P.png"],
    brand: 'KK',
    available: true,
    oldPrice: "489",
    isLiked: false,
    description: '',
    color: 'Orange',
    size: 'L',
    material: 'cotton',
    averageRating: 5,
  ),
];
