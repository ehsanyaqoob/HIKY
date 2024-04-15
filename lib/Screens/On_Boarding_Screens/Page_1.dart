import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 100),
        child: Column(
          children: [
            Text(
              'Let\'s find Spot for you!',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30.h), // Adds space between text and image

            CircleAvatar(
              radius: 200.r, // Set the radius size
              backgroundImage: AssetImage(
                  'assets/boyandgirl.jpg'), // Replace 'your_image.jpg' with your actual asset's path
            ),
          ],
        ),
      ),
    );
 }
}
