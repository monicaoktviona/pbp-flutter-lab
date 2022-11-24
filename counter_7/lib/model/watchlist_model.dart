// To parse this JSON data, do
//
//     final watchlist = watchlistFromJson(jsonString);

import 'dart:convert';
import 'dart:core';


List<Watchlist> watchlistFromJson(String str) => List<Watchlist>.from(json.decode(str).map((x) => Watchlist.fromJson(x)));

String watchlistToJson(List<Watchlist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Watchlist {
  Watchlist({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model? model;
  int pk;
  Fields fields;

  factory Watchlist.fromJson(Map<String, dynamic> json) => Watchlist(
    model: modelValues.map[json["model"]],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": modelValues.reverse![model],
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.watched,
    required this.title,
    required this.rating,
    required this.releaseDate,
    required this.review,
  });

  bool watched;
  String title;
  int rating;
  String releaseDate;
  String review;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    watched: json["watched"],
    title: json["title"],
    rating: json["rating"],
    releaseDate: json["release_date"],
    review: json["review"],
  );

  Map<String, dynamic> toJson() => {
    "watched": watched,
    "title": title,
    "rating": rating,
    "release_date": releaseDate,
    "review": review,
  };
}

enum Model { MYWATCHLIST_WATCHLISTMOVIE }

final modelValues = EnumValues({
  "mywatchlist.watchlistmovie": Model.MYWATCHLIST_WATCHLISTMOVIE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
