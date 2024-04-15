import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hiky/Screens/On_Boarding_Screens/Page_1.dart';
import 'package:hiky/Screens/On_Boarding_Screens/Page_2.dart';
import 'package:hiky/Screens/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'Page_3.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2); // Assuming there are 3 pages
            });
          },
          children: const [
            Page1(),
            Page2(),
            Page3(),
          ],
        ),
        Container(
          alignment: Alignment(0, 0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2); // Jump to the last page
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  )),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: WormEffect(),
              ),

              // Check if it's the last page and display either "Done" or "Next"
              if (onLastPage)
                GestureDetector(
                  onTap: () {
                    Get.to(() => LoginScreen()); // Navigate when done
                  },
                  child: Text(
                    "Done",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                )
              else
                GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        )
      ],
    ));
  }
}
