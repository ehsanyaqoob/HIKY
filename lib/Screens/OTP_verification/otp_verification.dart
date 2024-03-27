import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiky/Screens/home_page.dart';

class OTPVerificationPage extends StatefulWidget {
  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();
  TextEditingController _controller5 = TextEditingController();
  TextEditingController _controller6 = TextEditingController();
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  FocusNode _focusNode4 = FocusNode();
  FocusNode _focusNode5 = FocusNode();
  FocusNode _focusNode6 = FocusNode();

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    _focusNode5.dispose();
    _focusNode6.dispose();
    super.dispose();
  }

  // Helper method to handle focus navigation between OTP input fields
  void _onTextChanged(
      String value, FocusNode currentNode, FocusNode previousNode) {
    if (value.isNotEmpty) {
      currentNode.requestFocus();
    } else {
      previousNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          'Go Back',
          style: GoogleFonts.ptSans(
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.h),
            Text(
              'Check Your Phone',
              style: GoogleFonts.ptSans(
                fontSize: 30.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10.h),
            Text(
              "We've sent the code to your phone number",
              style: GoogleFonts.ptSans(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "+923126514491",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _controller1,
                    focusNode: _focusNode1,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: '-',
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      contentPadding: EdgeInsets.all(14),
                      isDense: true,
                    ),
                    onChanged: (value) {
                      _onTextChanged(value, _focusNode2, _focusNode1);
                    },
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: _controller2,
                    focusNode: _focusNode2,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: '-',
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      contentPadding: EdgeInsets.all(14),
                      isDense: true,
                    ),
                    onChanged: (value) {
                      _onTextChanged(value, _focusNode3, _focusNode1);
                    },
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: _controller3,
                    focusNode: _focusNode3,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: '-',
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      contentPadding: EdgeInsets.all(14),
                      isDense: true,
                    ),
                    onChanged: (value) {
                      _onTextChanged(value, _focusNode4, _focusNode2);
                    },
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: _controller4,
                    focusNode: _focusNode4,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: '-',
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      contentPadding: EdgeInsets.all(14),
                      isDense: true,
                    ),
                    onChanged: (value) {
                      _onTextChanged(value, _focusNode5, _focusNode3);
                    },
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: _controller5,
                    focusNode: _focusNode5,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: '-',
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      contentPadding: EdgeInsets.all(14),
                      isDense: true,
                    ),
                    onChanged: (value) {
                      _onTextChanged(value, _focusNode6, _focusNode4);
                    },
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: _controller6,
                    focusNode: _focusNode6,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: '-',
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      contentPadding: EdgeInsets.all(14),
                      isDense: true,
                    ),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        _onTextChanged(value, _focusNode5, _focusNode5);
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Code expires in 3:00',
                  style: GoogleFonts.ptSans(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            ElevatedButton(
              onPressed: () {
                // Sign up Query
                // go to otp page
                Get.to(HomePage());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
              ),
              child: Text(
                'Verify',
                style: GoogleFonts.ptSans(
                  color: Colors.black,
                  fontSize: 20.sp,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            ElevatedButton(
              onPressed: () {
                // it send otp agian and starts timer gain also send snackbar
                _showSnackbar();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Set background color to white
                shadowColor: Colors.grey, // Set text color to grey
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                      color: Colors.grey), // Set border color to grey
                ),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
              ),
              child: Text(
                'Resend',
                style: GoogleFonts.ptSans(
                  color: Colors.black,
                  fontSize: 20.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showSnackbar() {
    Get.snackbar(
      'Resend Success',
      'OTP has been resent successfully.',
      backgroundColor: Colors.teal, // Customize background color
      colorText: Colors.white, // Customize text color
    );
  }
}
