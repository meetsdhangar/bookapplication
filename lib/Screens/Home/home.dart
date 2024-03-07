import 'package:bookapplication/Controller/authcontroller.dart';
import 'package:bookapplication/Controller/homecontroller.dart';
import 'package:bookapplication/Screens/Home/homewidget.dart';
import 'package:bookapplication/Screens/details.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_switch/flutter_switch.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Authcontroller());
    final homecontroller = Get.put(Homecontroller())..bookapi();
    // print(homecontroller.booklist.value);

    TextEditingController textcontroller = TextEditingController();
    final book = homecontroller.booklist.value;
    return SafeArea(
      child: Obx(
        () => homecontroller.obxcheck.value
            ? Scaffold()
            : Scaffold(
                appBar: Appbar(controller),
                body: homecontroller.booklist.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Searchwidget(textcontroller),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: TextFormField(
                                  onChanged: (value) {
                                    homecontroller.SearchData(value);
                                  },
                                  controller: textcontroller,
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
                                        color: Colors.black,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w500),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13),
                                      borderSide: BorderSide(
                                          color: Color(0x30CCCCCC), width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13),
                                      borderSide: BorderSide(
                                          color: Color(0x30CCCCCC), width: 2),
                                    ),
                                  ),
                                ),
                              ),
                              20.h.heightBox,
                              homecontroller.searchlist.isNotEmpty
                                  ? GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      padding: EdgeInsets.all(0),
                                      itemCount:
                                          homecontroller.searchlist.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              mainAxisSpacing: 10,
                                              crossAxisSpacing: 15,
                                              mainAxisExtent: 290),
                                      itemBuilder: (context, index) {
                                        var searchIndex = homecontroller
                                            .searchlist.value[index];
                                        return TopbookWidget(searchIndex);
                                      },
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Top of Week",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.2),
                                        ),
                                        Text(
                                          "See All",
                                          style: TextStyle(
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.purple),
                                        )
                                      ],
                                    ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                height: 300.h,
                                child: ListView.builder(
                                  padding: EdgeInsets.all(0),
                                  itemCount: book.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Get.to(() => DetailsScreen(
                                              booklist: [book[index]],
                                            ));
                                      },
                                      child: TopbookWidget(book[index]),
                                    );
                                  },
                                ),
                              ),
                              20.h.heightBox,

                              Text(
                                "All Books",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.2),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.all(0),
                                itemCount: book.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 15,
                                        mainAxisExtent: 290),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                      onTap: () {
                                        Get.to(() => DetailsScreen(
                                              booklist: [book[index]],
                                            ));
                                      },
                                      child: TopbookWidget(book[index]));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
      ),
    );
  }
}
