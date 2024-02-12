import 'dart:convert';
import 'package:onlineforum_fe/config/api_config.dart';
import 'package:http/http.dart' as http;
import 'package:onlineforum_fe/models/userexpand_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAPIService {
  static const String _getUserAPI = "/user/get";
  static const String _updateUserAPI = "/user/update";

  static Future<dynamic> getUser() async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      final response = await http.get(
        Uri.http(Config.apiURL, _getUserAPI),
        headers: {
          'Authorization': token!
        }
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return UserExpandModel(
          data['name'], 
          data['email'], 
          data['dateofbirth'], 
          data['phonenumber'], 
          data['Role']['rolename']
        );
      } else {
        return null;
      }
    } catch (err) {
      print("Error: $err");
      return null;
    }
  }

  static Future<bool> updateUser(String name, String email, String dateofbirth, String phonenumber) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      final response = await http.put(
        Uri.http(Config.apiURL, _updateUserAPI),
        headers: {
          'Authorization': token!
        },
        body: {
          "name": name,
          "email": email,
          "dateofbirth": dateofbirth,
          "phonenumber": phonenumber
        }
      );
      if (response.statusCode == 200) {

      }
      return true;
    } catch (err) {
      return false;
    }
  }
}
