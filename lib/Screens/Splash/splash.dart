import 'dart:async';

import 'package:bookapplication/Controller/authcontroller.dart';
import 'package:bookapplication/Screens/login.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Authcontroller());
    Timer(Duration(seconds: 3), () {
      controller.checkuserlogin();
      //Get.offAll(() => LoginScreen());
    });
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          "Book Application",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
      ),
      body: Center(
        child: Image.asset(
          "assets/images/abc.png",
        ),
      ),
    ));
  }
}
