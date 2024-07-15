import 'package:flutter/material.dart';
import 'package:app4/screens/home_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool agreedToTerms = false;
  bool isLoading = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/app3.png', // Change to your image path
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    // Customize text style to make it thicker and change color
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange, // Change to desired color
                    ),
                  ),
                  obscureText: true, // Hide password
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Checkbox(
                      value: agreedToTerms,
                      onChanged: (value) {
                        setState(() {
                          agreedToTerms = value!;
                        });
                      },
                    ),
                    Text(
                      'I agree to the terms of service',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey, // Change to desired color
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: isLoading ? null : _signUp,
                  child:
                      isLoading ? CircularProgressIndicator() : Text('Sign Up'),
                ),
                if (errorMessage != null)
                  Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _signUp() {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    // Retrieve data from controllers
    String username = usernameController.text;
    String email = emailController.text;
    String phoneNumber = phoneNumberController.text;
    String password = passwordController.text;

    // Simulate signup process
    print('Signing up with:');
    print('Username: $username');
    print('Email: $email');
    print('Phone Number: $phoneNumber');
    print('Password: $password');

    // Simulate successful signup and navigate to home screen
    // In a real app, you would perform asynchronous operations such as API calls here
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
        // Simulate an error during signup
        if (username.isEmpty ||
            email.isEmpty ||
            phoneNumber.isEmpty ||
            password.isEmpty) {
          errorMessage = 'Please fill in all fields';
        } else {
          // Simulate successful signup
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      });
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: SignupScreen(),
  ));
}
