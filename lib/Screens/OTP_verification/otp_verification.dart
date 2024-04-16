import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // Make sure to import Get correctly
import 'package:google_fonts/google_fonts.dart';
import 'package:hiky/Screens/home_page.dart';

class OTPVerificationPage extends StatefulWidget {
  final String verificationId;

  const OTPVerificationPage({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  final FocusNode _focusNode5 = FocusNode();
  final FocusNode _focusNode6 = FocusNode();

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

  // Method to handle OTP verification
  void verifyOTP() {
    String enteredOTP = _controller1.text + _controller2.text + _controller3.text +
                        _controller4.text + _controller5.text + _controller6.text;

    // Placeholder for OTP verification logic
    if (enteredOTP.length == 6) {
      Get.to(() => HomePage());
    } else {
      _showSnackbar("Invalid OTP", "Please check the code and try again.");
    }
  }

  // Method to focus on next or previous text field
  void _onTextChanged(String value, FocusNode currentNode, FocusNode nextNode) {
    if (value.isNotEmpty) {
      FocusScope.of(context).requestFocus(nextNode);
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
        title: Text('Go Back', style: GoogleFonts.ptSans(fontSize: 20.sp, color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.h),
            Text('Check Your Phone', style: GoogleFonts.ptSans(fontSize: 30.sp, fontWeight: FontWeight.w500, color: Colors.black), textAlign: TextAlign.center),
            SizedBox(height: 10.h),
            Text("We've sent the code to your phone number", style: GoogleFonts.ptSans(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.black), textAlign: TextAlign.center),
            Text("+923126514491", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return Expanded(
                  child: TextFormField(
                    controller: [ _controller1, _controller2, _controller3, _controller4, _controller5, _controller6][index],
                    focusNode: [ _focusNode1, _focusNode2, _focusNode3, _focusNode4, _focusNode5, _focusNode6][index],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: '-',
                      counterText: '',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                      contentPadding: EdgeInsets.all(14),
                      isDense: true,
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 5) {
                        FocusScope.of(context).requestFocus([ _focusNode2, _focusNode3, _focusNode4, _focusNode5, _focusNode6][index]);
                      }
                    },
                  ),
                );
              }),
            ),
            SizedBox(height: 20.h),
            Text('Code expires in 3:00', style: GoogleFonts.ptSans(fontWeight: FontWeight.bold)),
            SizedBox(height: 40.h),
            ElevatedButton(
              onPressed: verifyOTP,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
              ),
              child: Text('Verify', style: GoogleFonts.ptSans(color: Colors.black, fontSize: 20.sp)),
            ),
            SizedBox(height: 10.h),
            ElevatedButton(
              onPressed: () => _showSnackbar("Resend OTP", "OTP has been resent successfully."),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(color: Colors.grey)),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
              ),
              child: Text('Resend', style: GoogleFonts.ptSans(color: Colors.black, fontSize: 20.sp)),
            )
          ],
        ),
      ),
    );
  }

  void _showSnackbar(String title, String message) {
    Get.snackbar(title, message, backgroundColor: Colors.teal, colorText: Colors.white);
  }
}
