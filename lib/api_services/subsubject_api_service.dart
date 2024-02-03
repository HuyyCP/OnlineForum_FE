import 'dart:convert';
import 'package:onlineforum_fe/config/api_config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SubSubjectAPIService {
  static const String _getSubSubjectAPI = '/subsubject';

  static Future<dynamic> getSubSubject(String idsubsubject) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      final response = await http.get(
        Uri.http(Config.apiURL, _getSubSubjectAPI, {'id' : idsubsubject}),
        headers: {
          'Authorization' : token!
        }
      );
      if(response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var res = (
          subjectname: data['subjectname'],
          posts: List.from(data['Posts'].map((post) => (
            idpost: post['idpost'],
            title: post['title'],
            content: post['content'],
          ))),
        );
        return res;
      } else {
        return null;
      }
    } catch (err) {
      return null;
    }
  }
}