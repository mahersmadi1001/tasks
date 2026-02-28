import 'package:ecommerce_app/view/LoginView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [
            Positioned(
              left: 24.w,
              top: 54.h,
              child: Text(
                "Define\n yourself in\n your unique\n way.",
                style: TextStyle(
                  color: Color(0xff1A1A1A),
                  fontSize: 45.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              child: SizedBox(
                child: Image.asset("images/imbording_shape.png"),
                width: 390.sp,
              ),
              top: 160.sp,
              left: 0.sp,
            ),
            Positioned(
              right: -25.w,
              bottom: 100.h,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    "images/imbording.png",
                    width: 358.w,
                    height: 650.h,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 21.h,
              right: 24.w,
              child: MaterialButton(
                child: Row(
                  children: [
                    Text("Get Started", style: TextStyle(color: Colors.white)),
                    SizedBox(width: 15.w),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginView();
                      },
                    ),
                  );
                },
                color: Colors.black,
                minWidth: 341.w,
                height: 64.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
