import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
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
  TextEditingController passwordController = TextEditingController();

  final String countryCode = "+1";

  Future<void> submitPhoneNumber(BuildContext context) async {
    String phoneNumber = '${phoneController.text.trim()}';
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || phoneNumber.isEmpty || password.isEmpty) {
      _showSnackbar("Please fill in all the details", backgroundColor: Colors.teal[400]);
      return;
    }

    // Concatenate the selected country code with the entered phone number
    String fullPhoneNumber = '$countryCode$phoneNumber';

    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: fullPhoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {
        print(e.message.toString());
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OTPVerificationPage(
              verificationId: verificationId,
              phoneNumber: fullPhoneNumber,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void _showSnackbar(String message, {Color? backgroundColor}) {
    Get.snackbar(
      "Notification",
      message,
      backgroundColor: backgroundColor ?? Colors.teal[400],
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
    );
  }

  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId:
        '789730785601-6qc9fcappbntblfnbvfagad3hukcom5a.apps.googleusercontent.com', // Replace with your Google Sign-In client ID
    scopes: ['email'],
  );

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuth =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuth.accessToken,
          idToken: googleSignInAuth.idToken,
        );

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        if (userCredential.user != null) {
          // Get.to(OTPVerificationPage(verificationId: verificationId, phoneNumber: phoneNumber));
        }
      }
    } catch (e) {
      print("Error signing in with Google: $e");
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AuthCredential credential = FacebookAuthProvider.credential(
          result.accessToken!.token,
        );

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        if (userCredential.user != null) {
          // Get.to(OTPVerificationPage(verificationId: verificationId, phoneNumber: phoneNumber));
        }
      } else if (result.status == LoginStatus.cancelled) {
        print("Facebook Sign-In Cancelled");
      } else {
        print("Error signing in with Facebook: ${result.message}");
      }
    } catch (e) {
      print("Error signing in with Facebook: $e");
    }
  }

  Future<void> signInWithApple() async {
    try {
      final AuthorizationCredentialAppleID appleCredential =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: 'your.client.id',
          redirectUri: Uri.parse('https://your-redirect-uri.com'),
        ),
      );

      final AuthCredential credential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user != null) {
        // Get.to(OTPVerificationPage(verificationId: verificationId, phoneNumber: phoneNumber));
      }
    } catch (e) {
      print("Error signing in with Apple: $e");
    }
  }

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
          style: GoogleFonts.ptSans(
            color: Colors.black,
          ),
        ),
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
                height: 100.h,
                width: MediaQuery.of(context).size.width,
              ),
              // Text(
              //   'Welcome Newbies',
              //   style: GoogleFonts.ptSans(
              //     fontSize: 40.sp,
              //     color: Colors.black,
              //     fontWeight: FontWeight.bold,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
              //SizedBox(height: 10.h),
              TextFormField(
                onTapOutside: (value) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
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
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  prefixIcon: Icon(Icons.lock, color: Colors.grey[700]),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 5.0), // Add padding inside the container
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey), // Border color
                      borderRadius:
                          BorderRadius.circular(30), // Rounded corners
                      color: Colors.white, // Background color
                    ),
                    child: CountryCodePicker(
                      onChanged: print,
                      initialSelection: 'US',
                      favorite: ['+1', 'US'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      onTapOutside: (value) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        prefixIcon: Icon(Icons.phone, color: Colors.grey[700]),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              //
              ElevatedButton(
                onPressed: () {
                  submitPhoneNumber(context);
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

              //
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
