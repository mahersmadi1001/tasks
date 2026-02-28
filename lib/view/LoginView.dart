import 'package:ecommerce_app/core/Widgets/Loginwith.dart';
import 'package:ecommerce_app/core/Widgets/tfflogin.dart';
import 'package:ecommerce_app/view/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  GlobalKey<FormState> loginkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: loginkey,
        child: Container(
          margin: EdgeInsets.all(24.sp),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login to your account",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.sp),
              ),
              Text(
                "It’s great to see you again",
                style: TextStyle(color: Color(0xff808080), fontSize: 16.sp),
              ),
              SizedBox(height: 24.h),
              Text(
                "Email",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              TFFLogin(
                hint: "Enter your email address",
                lapel: "Email",
                obscureText: false,
              ),
              SizedBox(height: 26.h),
              Text(
                "Password",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              TFFLogin(
                iconscure: Icon(Icons.password_rounded),
                hint: "Enter your password",
                lapel: "Password",
                obscureText: true,
              ),
              SizedBox(height: 10.h),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "Forgot your password?"),
                    TextSpan(
                      text: " Reset your password",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
                minWidth: 341.w,
                height: 54.h,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Homeview()),
                  );
                },
                color: Colors.black,
                child: Text("Login", style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 34.h),
              Row(
                children: [
                  SizedBox(
                    width: 150.w,
                    child: Expanded(
                      child: Divider(color: Color(0xffE6E6E6), thickness: 2.sp),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "or",
                      style: TextStyle(
                        color: Color(0xffE6E6E6),
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Divider(color: Color(0xffE6E6E6), thickness: 2.sp),
                    width: 150.w,
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Loginwith(
                path: "images/logos_google-icon.png",
                textcolor: Colors.black,
              ),
              SizedBox(height: 16.h),
              Loginwith(
                path: "images/logos_facebook.png",
                color: Color(0xff1877F2),
                textcolor: Colors.white,
              ),
              SizedBox(height: 140.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Don’t have an account?",
                          style: TextStyle(
                            color: Color(0xff808080),
                            fontSize: 16.sp,
                          ),
                        ),
                        TextSpan(
                          text: "Join",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
