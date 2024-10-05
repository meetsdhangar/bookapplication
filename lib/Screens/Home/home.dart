import 'package:bookapplication/Controller/authcontroller.dart';
import 'package:bookapplication/Controller/homecontroller.dart';
import 'package:bookapplication/Screens/Home/homewidget.dart';
import 'package:bookapplication/Screens/details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:velocity_x/velocity_x.dart';

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
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: book.length,
                                itemBuilder: (context, index) {
                                  //  print(
                                  // "booklist:${book[index]['author_names']}");
                                  var authorlist =
                                      book[index]['author_names'].toString();

                                  var newauthor = authorlist.substring(
                                      1, authorlist.length - 1);
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() =>
                                          DetailsScreen(booklist: book[index]));
                                    },
                                    child: ListTile(
                                      contentPadding: EdgeInsets.all(10),
                                      leading: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://covers.openlibrary.org/b/id/${book[index]['cover_id']}.jpg"),
                                              fit: BoxFit.cover),
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        height: 100.h,
                                        width: 80.w,
                                      ),
                                      title:
                                          Text(book[index]['title'].toString()),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Auther: ${newauthor}"),
                                          Text(
                                              "Publish year: ${book[index]['first_publish_year']}"),
                                        ],
                                      ),
                                    ),
                                  );
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
