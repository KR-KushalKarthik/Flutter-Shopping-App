import 'package:app4/screens/feedbackform.dart';
import 'package:app4/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app4/screens/OrderTracking_Screen.dart';
import 'package:app4/screens/category_display_screen.dart';
import 'package:app4/screens/product_display_screen.dart';
import 'package:app4/screens/profile_screen.dart';
import 'package:app4/utils/colors.dart';
import 'package:app4/screens/notification_screen.dart'; // Import your notification page
// Import HelpScreen

// Define the Product class
class Product {
  final int id;
  final String name;
  final String image;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final PageController pageController = PageController(initialPage: 0);

  final List<Widget> screens = [
    ProductDisplayScreen(),
    CategoryDisplayScreen(),
    //CartScreen(cartItems: []), // Pass an empty list as cartItem
    OrderTrackingScreen(),
    ProfileScreen(),
  ];

  final List<IconData> tabBarIcons = [
    FontAwesomeIcons.home,
    FontAwesomeIcons.compass,
    //FontAwesomeIcons.shoppingCart,
    FontAwesomeIcons.locationPin,
    FontAwesomeIcons.user,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        // Remove the search icon from the actions
        actions: [
          IconButton(
            icon: Icon(Icons.notifications), // Add notification icon
            onPressed: () {
              // Navigate to the NotificationPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Wishlist'),
              leading: Icon(Icons.favorite),
              onTap: () {
                Navigator.of(context).pop(); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WishlistScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Orders'),
              leading: Icon(Icons.shopping_bag),
              onTap: () {
                Navigator.of(context).pop(); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrdersScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Help'),
              leading: Icon(Icons.help),
              onTap: () {
                Navigator.of(context).pop(); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HelpScreen()), // Navigate to HelpScreen
                );
              },
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
                // Navigate to Settings screen
              },
            ),
            ListTile(
              title: Text('Feedback'), // Add feedback menu item
              leading: Icon(Icons.feedback),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedbackForm()),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: screens,
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                alignment: Alignment.center,
                height: 70,
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: tabBarIcons.asMap().entries.map((entry) {
                    final index = entry.key;
                    final icon = entry.value;

                    return IconButton(
                      onPressed: () {
                        setState(() {
                          currentIndex = index;
                        });
                        pageController.jumpToPage(index);
                      },
                      icon: Icon(
                        icon,
                        color: currentIndex == index
                            ? Colors.white
                            : Colors.white60,
                        size: 22,
                      ),
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WishlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Remove the list of products
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: Center(
        child: Text('Your wishlist is empty'),
      ),
    );
  }
}

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: Center(
        child: Text('Your Orders Content Here'),
      ),
    );
  }
}

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Need Help?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'If you need any assistance or have questions, feel free to reach out to our support team. You can contact us via email or phone.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Email:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'support@example.com',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Phone:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '+1 (123) 456-7890',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
