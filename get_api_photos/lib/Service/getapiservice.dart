import 'dart:convert';

import 'package:get_api_photos/Model/model_photo.dart';
import 'package:http/http.dart' as http;

class Getapiservice {
  Future<List<PhotosModel>?> GetPhotosModel() async {
    var data = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    var response = await data.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return photosModelFromJson(json);
    }
  }
}
