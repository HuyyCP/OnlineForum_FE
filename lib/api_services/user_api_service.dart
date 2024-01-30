import 'dart:convert';
import 'package:onlineforum_fe/config/api_config.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserAPIService {
  static const String getUserAPI = "/user/get";
  static Future<List<User>?> getUser() async {
    try {
      final response = await http.get(
        Uri.http(Config.apiURL, getUserAPI),
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
      }
      );
      if(response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        return List<User>.from(data.map((user) => User.fromJson(user)));
      } else {
        return null;
      }
    } catch (err) {
      print("Error: $err");
      rethrow;
      // return null;
    }
  }
}