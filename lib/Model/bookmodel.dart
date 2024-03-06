// To parse this JSON data, do
//
//     final bookmodel = bookmodelFromMap(jsonString);

import 'dart:convert';

Bookmodel bookmodelFromMap(String str) => Bookmodel.fromMap(json.decode(str));

String bookmodelToMap(Bookmodel data) => json.encode(data.toMap());

class Bookmodel {
  int page;
  List<ReadingLogEntry> readingLogEntries;

  Bookmodel({
    required this.page,
    required this.readingLogEntries,
  });

  factory Bookmodel.fromMap(Map<String, dynamic> json) => Bookmodel(
        page: json["page"],
        readingLogEntries: List<ReadingLogEntry>.from(
            json["reading_log_entries"].map((x) => ReadingLogEntry.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "reading_log_entries":
            List<dynamic>.from(readingLogEntries.map((x) => x.toMap())),
      };
}

class ReadingLogEntry {
  Work work;
  String? loggedEdition;
  String loggedDate;

  ReadingLogEntry({
    required this.work,
    required this.loggedEdition,
    required this.loggedDate,
  });

  factory ReadingLogEntry.fromMap(Map<String, dynamic> json) => ReadingLogEntry(
        work: Work.fromMap(json["work"]),
        loggedEdition: json["logged_edition"],
        loggedDate: json["logged_date"],
      );

  Map<String, dynamic> toMap() => {
        "work": work.toMap(),
        "logged_edition": loggedEdition,
        "logged_date": loggedDate,
      };
}

class Work {
  String? title;
  String key;
  List<String> authorKeys;
  List<String> authorNames;
  int? firstPublishYear;
  String? lendingEditionS;
  List<String>? editionKey;
  int? coverId;
  String? coverEditionKey;

  Work({
    required this.title,
    required this.key,
    required this.authorKeys,
    required this.authorNames,
    required this.firstPublishYear,
    required this.lendingEditionS,
    required this.editionKey,
    required this.coverId,
    required this.coverEditionKey,
  });

  factory Work.fromMap(Map<String, dynamic> json) => Work(
        title: json["title"],
        key: json["key"],
        authorKeys: List<String>.from(json["author_keys"].map((x) => x)),
        authorNames: List<String>.from(json["author_names"].map((x) => x)),
        firstPublishYear: json["first_publish_year"],
        lendingEditionS: json["lending_edition_s"],
        editionKey: json["edition_key"] == null
            ? []
            : List<String>.from(json["edition_key"]!.map((x) => x)),
        coverId: json["cover_id"],
        coverEditionKey: json["cover_edition_key"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "key": key,
        "author_keys": List<dynamic>.from(authorKeys.map((x) => x)),
        "author_names": List<dynamic>.from(authorNames.map((x) => x)),
        "first_publish_year": firstPublishYear,
        "lending_edition_s": lendingEditionS,
        "edition_key": editionKey == null
            ? []
            : List<dynamic>.from(editionKey!.map((x) => x)),
        "cover_id": coverId,
        "cover_edition_key": coverEditionKey,
      };
}
