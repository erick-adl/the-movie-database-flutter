// To parse this JSON data, do
//
//     final genres = genresFromJson(jsonString);

import 'dart:convert';

import 'package:imdb/src/models/genre.dart';

Genres genresFromJson(String str) => Genres.fromJson(json.decode(str));

String genresToJson(Genres data) => json.encode(data.toJson());

class Genres {
    List<Genre> genres;

    Genres({
        this.genres,
    });

    factory Genres.fromJson(Map<String, dynamic> json) => Genres(
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    };
}


