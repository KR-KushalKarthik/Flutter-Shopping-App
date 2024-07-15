import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _selectedPaymentMethod = 'Credit Card'; // Default payment method
  String? _selectedBank;
  TextEditingController _upiIdController = TextEditingController();

  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _expiryDateController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _upiIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedPaymentMethod,
              onChanged: (newValue) {
                setState(() {
                  _selectedPaymentMethod = newValue!;
                });
              },
              items: <String>[
                'Credit Card',
                'Debit Card',
                'Net Banking',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            if (_selectedPaymentMethod == 'Net Banking') SizedBox(height: 20),
            if (_selectedPaymentMethod == 'Net Banking')
              Text(
                'Select APP',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            if (_selectedPaymentMethod == 'Net Banking') SizedBox(height: 10),
            if (_selectedPaymentMethod == 'Net Banking')
              DropdownButtonFormField<String>(
                value: _selectedBank,
                onChanged: (newValue) {
                  setState(() {
                    _selectedBank = newValue!;
                  });
                },
                items: <String>[
                  'PhonePe',
                  'Paytm',
                  'Google Pay',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            if (_selectedPaymentMethod == 'Net Banking') SizedBox(height: 20),
            if (_selectedPaymentMethod == 'Net Banking')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'UPI ID',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: _upiIdController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: 'Enter UPI ID'),
                  ),
                ],
              ),
            if (_selectedPaymentMethod == 'Credit Card' ||
                _selectedPaymentMethod == 'Debit Card')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Card Number',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: _cardNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Enter card number'),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Expiry Date',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              controller: _expiryDateController,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(hintText: 'MM/YY'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CVV',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              controller: _cvvController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(hintText: 'CVV'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            SizedBox(height: 20),
            Text(
              'Order Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Implement order summary widget here
            Text('Item 1: \$10'),
            Text('Item 2: \$20'),
            Text('Shipping: \$5'),
            Divider(),
            Text(
              'Total: \$35',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Payment Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Payment Method: $_selectedPaymentMethod'),
            if (_selectedPaymentMethod == 'Credit Card' ||
                _selectedPaymentMethod == 'Debit Card')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Card Number: ${_cardNumberController.text}'),
                  Text('Expiry Date: ${_expiryDateController.text}'),
                  Text('CVV: ${_cvvController.text}'),
                ],
              ),
            if (_selectedPaymentMethod == 'Net Banking')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Selected Bank: $_selectedBank'),
                  Text('UPI ID: ${_upiIdController.text}'),
                ],
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _processPayment(context);
              },
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }

  void _processPayment(BuildContext context) {
    // Implement payment processing logic based on selected payment method
    // For digital wallets, integrate with specific wallet API
    // For credit/debit cards, integrate with payment gateway API

    // After successful payment, navigate to confirmation screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => PaymentConfirmationPage()),
    );
  }
}

class PaymentConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Payment Successful!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
