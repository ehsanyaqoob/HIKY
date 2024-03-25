import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hiky/Screens/Splash_Screen.dart';

void main() {
  runApp(const MyApp());
}

// # GITHUB ->  https://github.com/ehsanyaqoob

// # LINKDIN -> https://www.linkedin.com/in/ehsany/

// # Email  -> ehsanyaqoob07@gmial.com

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: SplashScreen(),
    );
  }
}
