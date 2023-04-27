import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/photo.dart';
import '../view/homeScreen.dart';

class PhotoView extends ChangeNotifier {


  static const baseUrl = "https://unreal-api.azurewebsites.net";

  List<Photo> listPic = [];
  String state = FetchState.loading.name;


  Future<List<dynamic>> getPictures() async {
    var response = await Photo.fetchAllPhotos();

    if (response.isNotEmpty) {
      listPic.addAll(response);
      state = FetchState.done.name;
      notifyListeners();
      return listPic.reversed.toList();
    } else {
      state = FetchState.error.name;
      notifyListeners();
      throw Exception('Failed to load data');
    }
  }

  void addPictures(arg1, arg2) async {
    var url = Uri.parse("$baseUrl/photos");
    var response = await http.post(
        url, body: {'title': arg1, 'thumbnailUrl': arg2});

    if (response.statusCode != 200) {
      throw Exception(" Error ${response.statusCode} fecthing photos");
    }
  }
}