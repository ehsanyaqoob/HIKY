import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hiky/Screens/splash_page.dart';

void main() {
  runApp(const MyApp());
}

// # GITHUB ->  https://github.com/ehsanyaqoob

// # LINKDIN -> https://www.linkedin.com/in/ehsany/

// # Email  -> ehsanyaqoob07@gmial.com

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  static const Color kPrimaryColor = Colors.teal; // Define kPrimaryColor

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
          ),
          home: CustomSplashScreen(),
        );
      },
    );
  }
}
