import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:app4/data/data.dart';
import 'package:app4/screens/ShareScreen.dart';
import 'package:app4/screens/cart_screen.dart';
import 'package:app4/screens/payment_screen.dart';
import 'package:app4/screens/ordertracking_screen.dart';
import 'package:app4/screens/customerSupport_screen.dart';
import 'package:app4/screens/wishlist_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  double _userRating = 0;
  List<Product> cartItems = [];
  String _selectedColor = '';
  String _selectedSize = '';
  bool _isFavorite = false;
  TextEditingController _commentController = TextEditingController();

  List<Review> _reviews = [
    Review(
      reviewerName: 'kushal',
      rating: 4.5,
      comment: 'Excellent product, worth every penny!',
    ),
    Review(
        reviewerName: 'Ganesh', rating: 4, comment: 'its really nice product'),
    Review(
      reviewerName: 'satwik',
      rating: 5,
      comment: 'I love it! Great quality and fast delivery.',
    ),
    // Add more reviews as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.productName),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShareScreen(
                    productName: widget.product.productName,
                    productImageUrl: widget.product.productImageUrl,
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : null,
            ),
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
                if (_isFavorite) {
                  addToWishlist(widget.product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added to Wishlist'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WishlistScreen(wishlistItems: [
                        widget.product,
                      ]),
                    ),
                  );
                } else {
                  removeFromWishlist(widget.product);
                }
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Text(
              'Brand:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              widget.product.brand,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Sizes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                _buildSizeButton('XS'),
                _buildSizeButton('S'),
                _buildSizeButton('M'),
                _buildSizeButton('L'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Colors:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                _buildColorButton('Red'),
                _buildColorButton('Blue'),
                _buildColorButton('Green'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Selected Color: $_selectedColor',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Selected Size: $_selectedSize',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Your Rating:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                RatingBar.builder(
                  initialRating: _userRating,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 30,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _userRating = rating;
                    });
                  },
                ),
                SizedBox(width: 10),
                Text(
                  '$_userRating',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Reviews:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _reviews.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _reviews[index].comment,
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: _reviews[index].rating,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 20,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print('New Rating: $rating');
                            },
                          ),
                          SizedBox(width: 10),
                          Text(
                            _reviews[index].reviewerName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${_reviews[index].date.day}/${_reviews[index].date.month}/${_reviews[index].date.year}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _showReviewDialog();
              },
              child: Text('Add Your Review'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    addToCart(widget.product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Added to Cart')),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(cartItems: cartItems),
                      ),
                    );
                  },
                  child: Text('Add to Cart'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(),
                      ),
                    );
                  },
                  child: Text('Buy Now'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Special Offers & Coupons',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Get 20% off on your first purchase!',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Use code: KK2024',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shipping & Delivery',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Free Shipping on orders over \$50',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Estimated Delivery: 3-5 business days',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Return & Refund Policies',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'We accept returns within 30 days of purchase.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Refunds will be issued upon receipt of the returned item.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderTrackingScreen()),
                );
              },
              child: Text('Track Order'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CustomerSupportScreen()),
                );
              },
              child: Text('Customer Support'),
            ),
            SizedBox(height: 20),
            Text(
              'Availability:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              widget.product.available ? 'In Stock' : 'Out of Stock',
              style: TextStyle(
                fontSize: 16,
                color: widget.product.available ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Additional Product Images:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.product.additionalImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Image.network(
                      widget.product.additionalImages[index],
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'FAQs:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _faqs[index].isExpanded = !isExpanded;
                });
              },
              children: _faqs.map<ExpansionPanel>((FAQItem item) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text(item.question),
                    );
                  },
                  body: ListTile(
                    title: Text(item.answer),
                  ),
                  isExpanded: item.isExpanded,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSizeButton(String size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedSize = size;
          });
        },
        child: Text(size),
      ),
    );
  }

  Widget _buildColorButton(String color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedColor = color;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color == _selectedColor ? Colors.blue : Colors.grey,
        ),
        child: Text(color),
      ),
    );
  }

  void addToCart(Product product) {
    cartItems.add(product);
  }

  void addToWishlist(Product product) {
    // Add product to wishlist logic
  }

  void removeFromWishlist(Product product) {
    // Remove product from wishlist logic
  }

  void _showReviewDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Your Review'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RatingBar.builder(
                initialRating: _userRating,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 30,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _userRating = rating;
                  });
                },
              ),
              SizedBox(height: 10),
              TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  hintText: 'Enter your review',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _postReview();
                Navigator.of(context).pop();
              },
              child: Text('Post'),
            ),
          ],
        );
      },
    );
  }

  void _postReview() {
    String comment = _commentController.text.trim();
    if (comment.isNotEmpty && _userRating > 0) {
      Review newReview = Review(
        reviewerName: 'You',
        rating: _userRating,
        comment: comment,
      );
      setState(() {
        _reviews.add(newReview);
        _commentController.clear();
        _userRating = 0;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Your review has been posted'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please provide both rating and comment'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  List<FAQItem> _faqs = [
    FAQItem(
      question: 'What is the return policy?',
      answer:
          'We accept returns within 30 days of purchase. Refunds will be issued upon receipt of the returned item.',
      isExpanded: false,
    ),
    FAQItem(
      question: 'How can I track my order?',
      answer: 'You can track your order through our Order Tracking page.',
      isExpanded: false,
    ),
    FAQItem(
      question: 'Do you offer international shipping?',
      answer: 'Yes, we offer international shipping to most countries.',
      isExpanded: false,
    ),
    // Add more FAQs as needed
  ];
}

class FAQItem {
  final String question;
  final String answer;
  bool isExpanded;

  FAQItem({
    required this.question,
    required this.answer,
    this.isExpanded = false,
  });
}

class Review {
  final String reviewerName;
  final double rating;
  final String comment;
  final DateTime date;

  Review({
    required this.reviewerName,
    required this.rating,
    required this.comment,
    DateTime? date,
  }) : this.date = date ?? DateTime.now();
}
