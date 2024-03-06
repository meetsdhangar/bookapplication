import 'package:bookapplication/Controller/authcontroller.dart';
import 'package:bookapplication/Controller/homecontroller.dart';
import 'package:bookapplication/Screens/Home/homewidget.dart';
import 'package:bookapplication/Screens/details.dart';

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
                  actions: [
                    IconButton(
                        onPressed: () {
                          controller.userlogout();
                        },
                        icon: Icon(
                          Icons.logout,
                          size: 25,
                          color: Colors.white,
                        )),
                  ],
                ),
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
                                // child: TextFormField(
                                //   controller: textcontroller,
                                //   onChanged: (value) {
                                //     homecontroller.SearchData(value);
                                //   },
                                //   cursorColor: const Color(0xff787575),
                                //   decoration: InputDecoration(
                                //       filled: true,
                                //       isDense: true,
                                //       contentPadding: const EdgeInsets.all(13),
                                //       fillColor: const Color.fromRGBO(
                                //           204, 204, 204, 0.19),
                                //       hintText: "Search",
                                //       suffixIcon: const Icon(Icons.search),
                                //       suffixIconColor: const Color(0xff787575),
                                //       enabledBorder: OutlineInputBorder(
                                //         borderRadius: BorderRadius.circular(13),
                                //         borderSide: const BorderSide(
                                //             color: Color.fromRGBO(
                                //                 204, 204, 204, 0.3),
                                //             width: 1),
                                //       ),
                                //       focusedBorder: OutlineInputBorder(
                                //         borderRadius: BorderRadius.circular(13),
                                //         borderSide: const BorderSide(
                                //             color: Color.fromRGBO(
                                //                 204, 204, 204, 0.3),
                                //             width: 1),
                                //       )),
                                // ),
                              ),

                              homecontroller.searchlist.isNotEmpty
                                  ? ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                          homecontroller.searchlist.length,
                                      itemBuilder: (context, index) {
                                        var searchdata =
                                            homecontroller.searchlist[index];
                                        return ListTile(
                                          leading: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.network(
                                                'https://covers.openlibrary.org/b/id/${searchdata['cover_id']}-M.jpg'),
                                          ),
                                          title: Text("${searchdata['title']}"),
                                        );
                                      })
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
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        "https://covers.openlibrary.org/b/id/${book[index]['cover_id']}.jpg"),
                                                    fit: BoxFit.cover),
                                                color: Colors.amber,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              height: 220.h,
                                              width: 180.w,
                                            ),
                                            10.h.heightBox,
                                            Text(
                                              book[index]['title'],
                                              style: TextStyle(
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              homecontroller
                                                  .booklist
                                                  .value[index]
                                                      ['first_publish_year']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              20.h.heightBox,
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text(
                              //       "Authors",
                              //       style: TextStyle(
                              //           fontSize: 20.sp,
                              //           fontWeight: FontWeight.w600,
                              //           letterSpacing: 0.2),
                              //     ),
                              //     Text(
                              //       "See All",
                              //       style: TextStyle(
                              //           fontSize: 17.sp,
                              //           fontWeight: FontWeight.w500,
                              //           color: Colors.purple),
                              //     )
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 10.h,
                              // ),
                              // Container(
                              //   height: 200.h,
                              //   child: ListView.builder(
                              //     padding: EdgeInsets.all(0),
                              //     scrollDirection: Axis.horizontal,
                              //     itemCount: book.length,
                              //     itemBuilder: (context, index) {
                              //       return Padding(
                              //         padding: const EdgeInsets.only(right: 10),
                              //         child: Column(
                              //           children: [
                              //             CircleAvatar(
                              //               radius: 70,
                              //               backgroundImage: AssetImage(
                              //                   'assets/images/neil.png'),
                              //             ),
                              //             5.h.heightBox,
                              //             Text(
                              //               book[index]['authorNames']
                              //                   .toString(),
                              //               style: TextStyle(
                              //                   fontSize: 17.sp,
                              //                   fontWeight: FontWeight.w600),
                              //             )
                              //           ],
                              //         ),
                              //       );

                              //     },
                              //   ),
                              // ),
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
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://covers.openlibrary.org/b/id/${book[index]['cover_id']}.jpg'),
                                                  fit: BoxFit.cover),
                                              color: Colors.amber,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            height: 220.h,
                                            width: 200.w,
                                          ),
                                          10.h.heightBox,
                                          Text(
                                            book[index]['title'].toString(),
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            book[index]['first_publish_year']
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
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
