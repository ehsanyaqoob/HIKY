import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiky/Screens/login_screen.dart';
import 'package:hiky/Screens/sign_up_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/boyandgirl.jpg',
            fit: BoxFit.cover,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(LoginScreen());
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.teal),
                    fixedSize: MaterialStateProperty.all<Size>(
                      Size(200,
                          70), // Set width and height as per your requirement
                    ),
                  ),
                  child: Text(
                    "Get Started",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      //
                      Get.to(SignUpScreen());
                    },
                    child: Text(
                      "Create an account",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have an account?",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        // open up login screen
                        Get.to(LoginScreen());
                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 6.h,
              )
            ],
          ),
        ],
      ),
    );
  }
}
