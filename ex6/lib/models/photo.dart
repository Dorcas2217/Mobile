import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Photo {
  static const baseUrl = "https://unreal-api.azurewebsites.net";

  final int id;
  final String? title;
  final String? thumbnailUrl;

  const Photo(this.id, this.title, this.thumbnailUrl);

  Photo.fromJson(Map<String, dynamic> objectJson) :
      this(
        objectJson["id"],
        objectJson["title"],
        objectJson["thumbnailUrl"]
      );

  @override
  String toString() {

    return 'url : $thumbnailUrl, id : $id, titre : $title ';
  }


  static Future<List<Photo>> fetchAllPhotos() async {

    var response = await http.get(Uri.parse("$baseUrl/photos"));

    if(response.statusCode != 200 ){
      throw Exception(" Error ${response.statusCode} fecthing photos");
    }

    return compute((input) {
      final jsonList = jsonDecode(input);
      return jsonList.map<Photo>((jsonObj) => Photo.fromJson(jsonObj)).toList();
    }, response.body);

  }
}