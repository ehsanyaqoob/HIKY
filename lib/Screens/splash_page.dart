import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hiky/Screens/Boarding_Page/get_started.dart';
import 'package:hiky/Screens/login_screen.dart'; // Import Get package for navigation

class CustomSplashScreen extends StatefulWidget {
  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {
  String _logoPath = 'assets/HIKY_LIGHT.png';

  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after 5 seconds
    Timer(Duration(seconds: 5), () {
      Get.to(GetStartedScreen());
    });

    // Defer the determination of brightness mode after initState has completed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Determine system brightness mode
      Brightness brightness = MediaQuery.of(context).platformBrightness;
      // Set logo path based on brightness mode
      if (brightness == Brightness.dark) {
        setState(() {
          _logoPath = 'assets/HIKY_DARK.png';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal, // Set background color to teal
      body: Center(
        child: Image.asset(
          _logoPath, // Use the determined logo path
          width: 200.w,
          height: 200.h,
        ),
      ),
    );
  }
}
