import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiky/Screens/Forgot_Psw/forgot_password.dart';
import 'package:hiky/Screens/home_page.dart';
import 'package:hiky/Screens/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isObscure = true; // State to toggle password visibility

  // Function to perform login
  Future<void> loginUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Navigate to home screen or next screen if login is successful
      Get.off(HomePage());
    } on FirebaseAuthException catch (e) {
      _showLoginSnackbar();
    }
  }

  void _showLoginSnackbar() {
    Get.snackbar(
      'Login Failed',
      'Please try again with correct info.',
      backgroundColor: Colors.teal,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              children: [
                Image.asset(
                  'assets/HIKY_DARK.png',
                  height: 200.h,
                  width: MediaQuery.of(context).size.width,
                ),
                Text(
                  'Welcome Back',
                  style: GoogleFonts.ptSans(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  onTapOutside: (value) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
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
                  onTapOutside: (value) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    prefixIcon: Icon(Icons.lock, color: Colors.grey[700]),
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 10.h),
                GestureDetector(
                  onTap: () {
                    Get.to(ForgotPassword());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () {
                    // Login Query
                    loginUser();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                  ),
                  child: Text(
                    'Login',
                    style: GoogleFonts.ptSans(
                      color: Colors.black,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                GestureDetector(
                  onTap: () {
                    Get.to(SignUpScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hey, Are you new here?',
                        style: GoogleFonts.ptSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'SignUp',
                        style: GoogleFonts.ptSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                // Auth methods
                authButton("assets/google.png", 'Sign in with Google'),
                SizedBox(height: 10.h),
                authButton("assets/facebook.png", 'Sign in with Facebook'),
                SizedBox(height: 10.h),
                authButton("assets/apple.png", 'Sign in with Apple'),
              ],
            ),
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
