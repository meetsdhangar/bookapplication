import 'package:bookapplication/Screens/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Controller/homecontroller.dart';

Widget Searchwidget(controller) {
  final homecontroller = Get.put(Homecontroller())..bookapi();
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: TextFormField(
      onChanged: (value) {
        homecontroller.SearchData(value);
      },
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

Widget TopbookWidget(list) {
  var bookname = list['title'] ?? '';
  var mybookname = '';
  if (bookname.length > 15) {
    mybookname = bookname.substring(0, 15) + "...";
  } else {
    mybookname = bookname;
  }
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://covers.openlibrary.org/b/id/${list['cover_id']}.jpg"),
                fit: BoxFit.cover),
            color: Colors.amber,
            borderRadius: BorderRadius.circular(15),
          ),
          height: 220.h,
          width: 180.w,
        ),
        10.h.heightBox,
        Text(
          mybookname,
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
        ),
        Text(
          list['first_publish_year'].toString(),
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
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

Widget GridViewWidget(book) {
  var bookname = book['title'] ?? '';
  var mybookname = '';
  if (bookname.length > 18) {
    mybookname = bookname.substring(0, 18) + "...";
  } else {
    mybookname = bookname;
  }
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://covers.openlibrary.org/b/id/${book['cover_id']}.jpg'),
                fit: BoxFit.cover),
            color: Colors.amber,
            borderRadius: BorderRadius.circular(15),
          ),
          height: 220.h,
          width: 200.w,
        ),
        10.h.heightBox,
        Text(
          mybookname.toString(),
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
        ),
        Text(
          book['first_publish_year'].toString(),
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

SearchGridview(searchlist) {
  var bookname = searchlist['title'] ?? '';
  var mybookname = '';
  if (bookname.length > 20) {
    mybookname = bookname.substring(0, 20) + "...";
  } else {
    mybookname = bookname;
  }
  return InkWell(
    onTap: () {
      Get.to(
        () => DetailsScreen(booklist: searchlist),
      );
      searchlist = '';
    },
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://covers.openlibrary.org/b/id/${searchlist['cover_id']}.jpg'),
                  fit: BoxFit.cover),
              color: Colors.amber,
              borderRadius: BorderRadius.circular(15),
            ),
            height: 220.h,
            width: 200.w,
          ),
          10.h.heightBox,
          Text(
            mybookname.toString(),
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
          ),
          Text(
            searchlist['first_publish_year'].toString(),
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}

Appbar(controller) {
  return AppBar(
    backgroundColor: Colors.purple,
    centerTitle: true,
    title: Text(
      "Book Application",
      style: TextStyle(
          fontSize: 20.sp, fontWeight: FontWeight.w500, color: Colors.white),
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
  );
}
