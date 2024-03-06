import 'package:bookapplication/Controller/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authcontroller = Get.put(Authcontroller());

    TextEditingController controller = TextEditingController();
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
        body: Container(
          width: context.screenWidth,
          //  color: Colors.amber,
          height: context.screenHeight,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/icon.png",
                        ),
                      ),
                    ),
                  ),
                ),
                50.h.heightBox,
                Text(
                  "Enter mobile number and login",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 127, 112, 112)),
                ),
                20.h.heightBox,
                TextFormField(
                  decoration: InputDecoration(hintText: "Enter phone number"),
                  keyboardType: TextInputType.number,
                  controller: controller,
                ),
                50.heightBox,

                InkWell(
                  onTap: () {
                    if (controller.text == '') {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please Enter mobile no")));
                    }
                    if (controller.length < 10) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please Enter 10 Digit no")));
                    } else {
                      authcontroller.PhoneAuth("+91", controller.text, context);
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
                )
                // TextButton(
                //     onPressed: () {

                //     },
                //     child: Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
