import 'package:get_api_post/model/Model.dart';
import 'package:http/http.dart' as http;

class Getapiservice {
  Future<List<PostsModel>?> getPostsModel() async {
    var data = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await data.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return postsModelFromJson(json);
    }
  }
}
