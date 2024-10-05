import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Homecontroller extends GetxController {
  RxList booklist = [].obs;
  RxBool obxcheck = false.obs;
  RxList searchlist = [].obs;
  RxList readlist = [].obs;
  bookapi() async {
    booklist.value = [];
    var url = "https://openlibrary.org/people/mekBot/books/already-read.json";
    var responce = await http.get(Uri.parse(url));

    try {
      var decodedata = jsonDecode(responce.body);
      var data = decodedata['reading_log_entries'];
;
      List book = [];
      for (var i in data) {
        if (i != null) {
          book.add(i['work']);
        }
      }
      booklist.addAll(book);
    } catch (e) {
      e.toString();
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

  Readlist(index) {
    if (readlist.contains(index)) {
      readlist.remove(index);
    } else {
      readlist.add(index);
    }
  }
}
