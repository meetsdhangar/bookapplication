import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Homecontroller extends GetxController {
  RxList booklist = [].obs;
  RxBool obxcheck = false.obs;
  RxList searchlist = [].obs;
  bookapi() async {
    booklist.value = [];
    var url = "https://openlibrary.org/people/mekBot/books/already-read.json";
    var responce = await http.get(Uri.parse(url));

    try {
      var decodedata = jsonDecode(responce.body);
      var data = decodedata['reading_log_entries'];
      print(data);
// var mydata = data['work'];
      // print(mydata);
      // var list = data.map((m) => Work.fromMap(m)).toList();
      // print(list);
      // booklist.clear();
      // booklist.addAll(list);
      List book = [];
      for (var i in data) {
        if (i != null) {
          book.add(i['work']);
        }
        booklist.addAll(book);
      }
    } catch (e) {
      e.toString();
    }
  }

  search(searchText) {
    // searchlist.value = [];
    if (searchlist.value.isNotEmpty) {
      searchlist.value = booklist.value
          .where((element) => element['title']
              .toString()
              .toLowerCase()
              .startsWith(searchText.toLowerCase()))
          .toList();
    } else {
      searchlist.value = [];
    }
  }

  SearchData(searchText) {
    searchlist.value = [];
    if (searchText.isEmpty) {
      searchlist.value = [];
    } else {
      searchlist.value = booklist.value
          .where((element) => element['title']
              .toString()
              .toLowerCase()
              .startsWith(searchText.toLowerCase()))
          .toList();
    }
  }
}
