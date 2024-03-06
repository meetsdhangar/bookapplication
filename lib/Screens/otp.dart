import 'package:bookapplication/Controller/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:velocity_x/velocity_x.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authcontroller = Get.put(Authcontroller());
    return SafeArea(
      child: Scaffold(
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
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Enter otp here",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 127, 112, 112)),
                ),
                30.h.heightBox,
                Pinput(
                  onChanged: (value) {
                    authcontroller.otp.value = value;
                  },
                  onCompleted: (value) {
                    authcontroller.otp.value = value;
                  },
                  length: 6,
                ),
                50.heightBox,
                InkWell(
                  onTap: () {
                    try {
                      authcontroller.verifyotp(authcontroller.otp.value);
                    } catch (e) {
                      if (authcontroller.otp.value.length < 6) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Please Enter 6 Digit OTP")));
                      } else {
                        Get.snackbar("Error", "Invalid Otp");
                      }
                    }
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    height: 50.h,
                    width: context.screenWidth,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),

                // TextButton(
                //     onPressed: () {
                //       try {
                //         authcontroller.verifyotp(authcontroller.otp.value);
                //       } catch (e) {
                //         if (authcontroller.otp.value.length < 6) {
                //           Get.snackbar("Error", "Plese Enter 6 Digit otp");
                //         } else {
                //           Get.snackbar("Error", "Invalid Otp");
                //         }
                //       }
                //     },
                //     child: Text("Submit")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
