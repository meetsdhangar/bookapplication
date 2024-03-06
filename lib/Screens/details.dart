import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailsScreen extends StatelessWidget {
  final booklist;
  const DetailsScreen({super.key, required this.booklist});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "All Books Details",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://covers.openlibrary.org/b/id/${booklist[0]['cover_id']}.jpg"),
                      fit: BoxFit.cover),
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 350.h,
                width: 290.w,
              ),
            ),
            20.h.heightBox,
            Row(
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundImage: AssetImage('assets/images/neil.png'),
                ),
                5.w.widthBox,
                Text(
                  booklist[0]['authorNames'].toString(),
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            10.h.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  booklist[0]['title'].toString(),
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.favorite_border_outlined,
                  size: 30.sp,
                )
              ],
            ),
            10.h.heightBox,
            Text(
              '₹ 100',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
            10.h.heightBox,
            Text(
                " 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',")
          ],
        ),
      ),
    ));
  }
}
