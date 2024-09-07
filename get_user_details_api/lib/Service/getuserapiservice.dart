import 'package:get_user_details_api/Model/user_model.dart';
import 'package:http/http.dart' as http;

class Getuserapiservice {
  Future<List<UserDetails>?> getUserDetails() async {
    var data = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/users");
    var response = await data.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return userDetailsFromJson(json);
    }
  }
}
