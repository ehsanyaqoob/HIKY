import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiky/Screens/home_page.dart';

class OTPVerificationPage extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  const OTPVerificationPage({
    Key? key,
    required this.verificationId,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());

  late List<FocusNode> _focusNodes;
  late Timer _timer;
  int _countDown = 180;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(6, (_) => FocusNode());
    _startCountdownTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((node) => node.dispose());
    super.dispose();
  }

  void _startCountdownTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countDown > 0) {
          _countDown--;
        } else {
          timer.cancel();
          // Handle code expiration here
        }
      });
    });
  }

  void _verifyOTP() {
    String enteredOTP =
        _controllers.map((controller) => controller.text).join('');

    if (enteredOTP.length == 6) {
      Get.to(() => HomePage());
    } else {
      // Handle incomplete OTP
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.grey[700]),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Go Back',
          style: GoogleFonts.ptSans(fontSize: 20.sp, color: Colors.black),
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
              widget.phoneNumber,
              style: GoogleFonts.ptSans(
                fontSize: 30.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
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
              widget.phoneNumber,
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return Expanded(
                  child: TextFormField(
                    autofocus: index == 0,
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        if (index < 5) {
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[index + 1]);
                        }
                      } else {
                        if (index > 0) {
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[index - 1]);
                        }
                      }
                    },
                    decoration: InputDecoration(
                      hintText: '-',
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      contentPadding: EdgeInsets.all(14),
                      isDense: true,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20.h),
            Text(
              '${(_countDown ~/ 60).toString().padLeft(2, '0')}:${(_countDown % 60).toString().padLeft(2, '0')}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 40.h),
            ElevatedButton(
              onPressed: _verifyOTP,
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
              onPressed: () => _showSnackbar(
                  "Resend OTP", "OTP has been resent successfully."),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: Colors.grey),
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

  void _showSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.teal,
      colorText: Colors.white,
    );
  }
}
