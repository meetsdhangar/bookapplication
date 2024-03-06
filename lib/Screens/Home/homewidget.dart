import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

Widget Searchwidget(controller) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: TextFormField(
      controller: controller,
      showCursor: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        prefixIconColor: Colors.black,
        contentPadding: EdgeInsets.only(
          top: 15,
          bottom: 15,
        ),
        filled: true,
        fillColor: Color(0x30CCCCCC),
        hintText: "Search",
        hintStyle: TextStyle(
            color: Colors.black, fontSize: 17.sp, fontWeight: FontWeight.w500),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(color: Color(0x30CCCCCC), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(color: Color(0x30CCCCCC), width: 2),
        ),
      ),
    ),
  );
}

Widget TopbookWidget() {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/book.png"), fit: BoxFit.cover),
            color: Colors.amber,
            borderRadius: BorderRadius.circular(15),
          ),
          height: 220.h,
          width: 180.w,
        ),
        10.h.heightBox,
        Text(
          "The Kite runner",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
        ),
        Text(
          '₹ 100',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

Widget Authorswidget() {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Column(
      children: [
        CircleAvatar(
          radius: 70,
          backgroundImage: AssetImage('assets/images/neil.png'),
        ),
        5.h.heightBox,
        Text(
          "John Freeman",
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
        )
      ],
    ),
  );
}

Widget GridViewWidget() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/book.png"), fit: BoxFit.cover),
            color: Colors.amber,
            borderRadius: BorderRadius.circular(15),
          ),
          height: 220.h,
          width: 200.w,
        ),
        10.h.heightBox,
        Text(
          "The Kite runner",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
        ),
        Text(
          "₹ 100",
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}
