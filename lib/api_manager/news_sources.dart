// To parse this JSON data, do
//
//     final sources = sourcesFromJson(jsonString);

import 'dart:convert';

import 'article.dart';

Sources sourcesFromJson(String str) => Sources.fromJson(json.decode(str));

String sourcesToJson(Sources data) => json.encode(data.toJson());

class Sources {
  Sources({
    this.status,
    this.sources,
    this.code,
    this.message,
  });

  String? status;
  List<Source>? sources;
  String? code;
  String? message;

  factory Sources.fromJson(Map<String, dynamic> json) => Sources(
        status: json["status"],
        code: json['code'],
        message: json['message'],
        sources:
            List<Source>.from(json["sources"].map((x) => Source.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "sources": List<dynamic>.from(sources!.map((x) => x.toJson())),
      };
}

enum Category {
  GENERAL,
  BUSINESS,
  TECHNOLOGY,
  SPORTS,
  ENTERTAINMENT,
  HEALTH,
  SCIENCE
}

final categoryValues = EnumCategory({
  "business": Category.BUSINESS,
  "entertainment": Category.ENTERTAINMENT,
  "general": Category.GENERAL,
  "health": Category.HEALTH,
  "science": Category.SCIENCE,
  "sports": Category.SPORTS,
  "technology": Category.TECHNOLOGY
});

class EnumCategory<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumCategory(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
