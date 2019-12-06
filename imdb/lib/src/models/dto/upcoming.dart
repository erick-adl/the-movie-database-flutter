// To parse this JSON data, do
//
//     final upcoming = upcomingFromJson(jsonString);

import 'dart:convert';

import 'package:imdb/src/models/movie.dart';

Upcoming upcomingFromJson(String str) => Upcoming.fromJson(json.decode(str));

String upcomingToJson(Upcoming data) => json.encode(data.toJson());

class Upcoming {
    List<Movie> movies;
    int page;
    int totalResults;
    Dates dates;
    int totalPages;

    Upcoming({
        this.movies,
        this.page,
        this.totalResults,
        this.dates,
        this.totalPages,
    });

    factory Upcoming.fromJson(Map<String, dynamic> json) => Upcoming(
        movies: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        page: json["page"],
        totalResults: json["total_results"],
        dates: Dates.fromJson(json["dates"]),
        totalPages: json["total_pages"],
    );

    Map<String, dynamic> toJson() => {
        "movies": List<dynamic>.from(movies.map((x) => x.toJson())),
        "page": page,
        "total_results": totalResults,
        "dates": dates.toJson(),
        "total_pages": totalPages,
    };
}

class Dates {
    DateTime maximum;
    DateTime minimum;

    Dates({
        this.maximum,
        this.minimum,
    });

    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );

    Map<String, dynamic> toJson() => {
        "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
    };
}


