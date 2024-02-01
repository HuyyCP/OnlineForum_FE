import 'dart:convert';
import 'package:onlineforum_fe/config/api_config.dart';
import 'package:http/http.dart' as http;

class UserAPIService {
  static const String _getUserAPI = "/user/get";

  static Future<List<dynamic>?> getUser() async {
    try {
      final response = await http.get(
        Uri.http(Config.apiURL, _getUserAPI),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return List<dynamic>.from(data
            .map((record) => (name: record['name'], email: record['email'])));
      } else {
        return null;
      }
    } catch (err) {
      print("Error: $err");
      return null;
    }
  }
}
