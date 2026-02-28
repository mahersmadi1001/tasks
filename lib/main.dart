import 'package:ecommerce_app/view/HomeView.dart';
import 'package:ecommerce_app/view/LoginView.dart';
import 'package:ecommerce_app/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>
          MaterialApp(home: Homeview(), debugShowCheckedModeBanner: false),
    );
  }
}
