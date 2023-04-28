import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/photo.dart';

class PhotoView extends ChangeNotifier {

  static const baseUrl = "https://unreal-api.azurewebsites.net";

  Future<List<Photo>> getListPicture(){
   return _getPictures();
  }

  Future<List<Photo>> _getPictures() async {
    var response = await Photo.fetchAllPhotos();
    if (response.isNotEmpty) {
      return response.reversed.toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  void addPictures(arg1, arg2) async {
    var url = Uri.parse("$baseUrl/photos");
    var data = {"title": arg1, "thumbnailUrl": arg2};

    var response = await http.post(
        url, body: jsonEncode(data));

    if (response.statusCode != 200) {
      throw Exception(" Error ${response.statusCode} fecthing photos");
    }
  }
}