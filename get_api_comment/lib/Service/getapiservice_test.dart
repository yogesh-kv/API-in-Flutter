import 'package:api_data/model/Model.dart';
import 'package:http/http.dart' as http;

class GetapiserviceTest {
  Future<List<CommandsModel>?> getcommandsModel() async {
    var data = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/comments");
    var response = await data.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return commandsModelFromJson(json);
    }
  }
}
