import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
