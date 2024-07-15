import 'package:flutter/material.dart';

class CustomerSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Us:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Email: support@example.com',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Phone: +123-456-7890',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'FAQs:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Q: How can I track my order?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'A: You can track your order by visiting the "Order Tracking" section in our app or website.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Q: What is your return policy?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'A: Our return policy allows returns within 30 days of purchase. Please refer to our "Return Policy" section for more details.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Support Hours:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Monday - Friday: 9:00 AM - 6:00 PM',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Saturday: 10:00 AM - 4:00 PM',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Sunday: Closed',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
