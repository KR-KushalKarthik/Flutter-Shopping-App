import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app4/screens/home_screen.dart';
import 'package:app4/screens/intro_screen.dart';
import 'package:app4/utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      title: 'KK-Fashions',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        dialogBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
      ),
      home: IntroScreen(),
    );
  }
}
