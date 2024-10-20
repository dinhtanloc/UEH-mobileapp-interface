import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 5), () {
        Navigator.pushReplacementNamed(context, '/dashboard'); // Điều hướng sau 5s
      });
    });
    return Scaffold(
      body: Stack(
        children: [
          // Background container
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/ueh_background.jpg', // Ensure this path is correct
              fit: BoxFit.cover, // This ensures the image covers the full screen
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xFF9C9C9C).withOpacity(0.7), // Set color with opacity
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,  // Center vertically
              crossAxisAlignment: CrossAxisAlignment.center,  // Center horizontally
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/images/ueh_logo.png', // Your image path
                    width: 160,  // Set the width
                    height: 104, // Set the height
                    fit: BoxFit.fill, // Optionally, set the BoxFit property
                  ),
                ),
                Center(
                  child: Image.asset(
                    'assets/images/spinner.gif', // Your image path
                    width: 150,  // Set the width
                    height: 150, // Set the height
                    fit: BoxFit.fill, // Optionally, set the BoxFit property
                  ),
                )
              ],
            ), // Set color with opacity
          )
        ],
      ),
    );
  }
}