import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class Film {
  static const baseUrl = "https://sebstreb.github.io/flutter-fiche-5/ghibli-films";

  final int id;
  final String title;
  final String movieBanner;
  final String releaseDate;
  final String runningTime;
  final String director;
  final String rtScore;

  const Film(this.id, this.title, this.movieBanner,
      this.releaseDate, this.runningTime, this.director, this.rtScore);


  Film.fromJson(Map<String, dynamic> objectJson)
      : this(
    objectJson["id"],
    objectJson["title"],
    objectJson["movie_banner"],
    objectJson["release_date"],
    objectJson["running_time"],
    objectJson["director"],
    objectJson["rt_score"],
  );

  @override
  String toString() {
    return '$title, movie banner $movieBanner, release in $releaseDate directed by $director '
        'min : $runningTime score $rtScore';
  }


  static Future<List<Film>> fetchAllFilms() async {
    var response = await http.get(Uri.parse("$baseUrl/"));

    if (response.statusCode != 200) {
      throw Exception("Error ${response.statusCode} fetching movies");
    }


    return compute((input) {
      final jsonList = jsonDecode(input);

     return  jsonList.map<Film, dynamic>((jsonObj) => Film.fromJson(jsonObj)).toList();
    }, response.body);
  }


}