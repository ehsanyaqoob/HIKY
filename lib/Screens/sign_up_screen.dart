import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import 'OTP_verification/otp_verification.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.grey[700],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Signup',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 26,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/HIKY_DARK.png',
                height: 200.h,
                width: MediaQuery.of(context).size.width,
              ),
              Text(
                'Welcome Newbies',
                style: GoogleFonts.ptSans(
                  fontSize: 40.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  prefixIcon: Icon(Icons.person, color: Colors.grey[700]),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(height: 15.h),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  prefixIcon: Icon(Icons.email, color: Colors.grey[700]),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(height: 15.h),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  prefixIcon: Icon(Icons.phone, color: Colors.grey[700]),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {
                  // Sign up Query
                  // go to otp page
                  Get.to(OTPVerificationPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                ),
                child: Text(
                  'Sign up',
                  style: GoogleFonts.ptSans(
                    color: Colors.black,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              authButton("assets/google.png", 'Sign up with Google'),
              SizedBox(height: 10.h),
              authButton("assets/facebook.png", 'Sign up with Facebook'),
              SizedBox(height: 10.h),
              authButton("assets/apple.png", 'Sign up with Apple'),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget authButton(String image, String text) {
    return GestureDetector(
      onTap: () {
        // Perform authentication with respective method
      },
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(30),
        ),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(image, height: 30.h),
              SizedBox(width: 20.w),
              Text(
                text,
                style: GoogleFonts.ptSans(fontSize: 20.sp),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
