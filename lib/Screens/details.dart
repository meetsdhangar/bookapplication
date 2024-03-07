import 'package:bookapplication/Controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailsScreen extends StatelessWidget {
  final booklist;
  const DetailsScreen({super.key, required this.booklist});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Homecontroller());
    print(booklist);

    var authorlist = booklist[0]['author_names'].toString();

    var newauthor = authorlist.substring(1, authorlist.length - 1);

    return SafeArea(
        child: Obx(
      () => controller.obxcheck.value
          ? Scaffold()
          : Scaffold(
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
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    10.h.heightBox,
                    Text(
                      booklist[0]['title'].toString(),
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500),
                    ),
                    10.h.heightBox,
                    Text(
                      newauthor,
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500),
                    ),
                    10.h.heightBox,
                    Text(
                      booklist[0]['first_publish_year'].toString(),
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500),
                    ),
                    10.h.heightBox,
                    FlutterSwitch(
                      activeColor: Colors.green,
                      inactiveColor: Colors.red,
                      activeText: "Read",
                      inactiveText: "Unread",
                      width: 100.0,
                      height: 45.0,
                      valueFontSize: 15.0,
                      toggleSize: 25.0,
                      value:
                          controller.readlist.contains(booklist) ? true : false,
                      borderRadius: 30.0,
                      padding: 8,
                      showOnOff: true,
                      onToggle: (val) {
                        controller.Readlist(booklist);
                      },
                    ),
                  ],
                ),
              ),
            ),
    ));
  }
}
