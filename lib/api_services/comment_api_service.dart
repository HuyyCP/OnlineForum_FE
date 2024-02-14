import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onlineforum_fe/config/api_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommentAPIService {
  static const String _addCommentAPi = '/comment/add';

  static Future<bool> addComment(String message, String idpost) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      final response = await http.post(
        Uri.http(Config.apiURL, _addCommentAPi),
        headers: {
          "Authorization": token!
        },
        body: {
          "message": message,
          "idpost": idpost
        }
      );
      return response.statusCode == 200;
    } catch (err) {
      return false;
    }
  }
}