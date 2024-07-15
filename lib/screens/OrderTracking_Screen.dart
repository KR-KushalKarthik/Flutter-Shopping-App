import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class OrderTrackingScreen extends StatefulWidget {
  @override
  _OrderTrackingScreenState createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  late GoogleMapController mapController;
  final Set<Marker> _markers = {};

  bool isOrderConfirmed = false;
  bool isOutForDelivery = false;
  bool isDelivered = false;
  String? selectedDeliveryOption;

  List<String> deliveryOptions = [
    'Standard Delivery (3-5 business days)',
    'Express Delivery (1-2 business days)',
    'Pickup from Store',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Tracking'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Order Tracking Page',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Track Your Order Here',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter Order ID',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Your order is being tracked.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Text('Track Order'),
              ),
              SizedBox(height: 40),
              Container(
                height: 300,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      37.422,
                      -122.084,
                    ),
                    zoom: 14,
                  ),
                  markers: _markers,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Order Status:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              OrderStatusWidget(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add functionality to view order history
                },
                child: Text('View Order History'),
              ),
              SizedBox(height: 20),
              Text(
                'Need Help?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'If you have any questions or concerns, feel free to contact our customer support team.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SupportPage()),
                  );
                },
                child: Text('Contact Support'),
              ),
              SizedBox(height: 20),
              Text(
                'Delivery Options:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              _buildDeliveryOptions(),
              SizedBox(height: 20),
              Text(
                'Delivery Progress:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              _buildDeliveryTimeline(),
              SizedBox(height: 20),
              Text(
                'Additional Order Details:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Special Instructions: Please leave package at doorstep.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveryOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: deliveryOptions.map((option) {
        return RadioListTile<String>(
          title: Text(option),
          value: option,
          groupValue: selectedDeliveryOption,
          onChanged: (value) {
            setState(() {
              selectedDeliveryOption = value!;
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildDeliveryTimeline() {
    List<TimelineModel> deliveryStatusList = [
      TimelineModel(
        GestureDetector(
          onTap: () {
            setState(() {
              isOrderConfirmed = !isOrderConfirmed;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: isOrderConfirmed ? Colors.green : Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Order Confirmed',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        position: TimelineItemPosition.left,
      ),
      TimelineModel(
        GestureDetector(
          onTap: () {
            setState(() {
              isOutForDelivery = !isOutForDelivery;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: isOutForDelivery ? Colors.green : Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Out for Delivery',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        position: TimelineItemPosition.left,
      ),
      TimelineModel(
        GestureDetector(
          onTap: () {
            setState(() {
              isDelivered = !isDelivered;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: isDelivered ? Colors.green : Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Delivered',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        position: TimelineItemPosition.left,
      ),
    ];

    return Timeline.builder(
      itemBuilder: (context, index) {
        final status = deliveryStatusList[index];
        return status;
      },
      itemCount: deliveryStatusList.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('Initial Location'),
          position: LatLng(37.422, -122.084),
          infoWindow: InfoWindow(
            title: 'Initial Location',
          ),
        ),
      );
    });
  }
}

class OrderStatusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Add logic here to display order status dynamically
    return Container();
  }
}

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Support'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is the customer support page. Contact information and support options can be displayed here.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Email: support@example.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Phone: 123-456-789',
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OrderTrackingScreen(),
  ));
}
