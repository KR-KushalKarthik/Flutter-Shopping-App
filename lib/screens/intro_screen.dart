import 'package:flutter/material.dart';
import 'package:app4/screens/login_screen.dart';
import 'package:app4/utils/colors.dart';
import 'package:app4/utils/utils.dart';
import 'package:app4/widgets/image_list_view.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // image transition
          Positioned(
            top: -10,
            left: -150,
            child: Row(
              children: const [
                ImageListView(startIndex: 0),
                ImageListView(startIndex: 1),
                ImageListView(startIndex: 2),
              ],
            ),
          ),

          // title
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            child: const Text(
              "KK-Fashions",
              textAlign: TextAlign.center,
              style: kTitleStyle,
            ),
          ),

          // information screen
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.60,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your Appearance Shows Your Quality",
                    style: kNormalStyle.copyWith(fontSize: 30, height: 1.3),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Change The Quality Of Your Appearance with KK",
                    style: kNormalStyle.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: buildIndicators(),
                  ),
                ],
              ),
            ),
          ),

          // bottom button
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                ),
                child: const Text("Sign Up / LogIn with Email"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
