import 'dart:convert';
import 'package:onlineforum_fe/config/api_config.dart';
import 'package:http/http.dart' as http;
import 'package:onlineforum_fe/models/postbrief_model.dart';
import 'package:onlineforum_fe/models/subsubject_model.dart';
import 'package:onlineforum_fe/models/userbrief_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubSubjectAPIService {
  static const String _getSubSubjectAPI = '/subsubject';

  static Future<SubSubjectModel?> getSubSubject(String idsubsubject) async {
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
        return SubSubjectModel(
          data['idsubject'],
          data['subjectname'],
          List.from(data['Posts'].map((post) => PostBriefModel(
            post['idpost'],
            post['title'],
            DateTime.parse(post['datecreate']),
            post['content'],
            UserBriefModel(
              post['User']['iduser'],
              post['User']['name'],
              post['User']['Role']['rolename']
            )))),
        );
      } else {
        return null;
      }
    } catch (err) {
      return null;
    }
  }
}