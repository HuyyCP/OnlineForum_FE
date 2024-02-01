import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onlineforum_fe/config/api_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountAPIService {
  static const String _loginAPI = '/account/login';

  static Future<bool> login (String username, String password) async {
    try {
      final response = await http.post(
          Uri.http(Config.apiURL, _loginAPI),
          body: {
            "username" : username,
            "password" : password
          }
      );
      if(response.statusCode == 200) {
        var data =  jsonDecode(response.body);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', data['token']);
        return true;
      } else {
        return false;
      }
    } catch (err) {
      return false;
    }

  }
}