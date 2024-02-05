import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onlineforum_fe/config/api_config.dart';
import 'package:onlineforum_fe/models/comment_model.dart';
import 'package:onlineforum_fe/models/postexpand_model.dart';
import 'package:onlineforum_fe/models/userbrief_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostAPIService {
  static const String _getPostAPI = '/post';

  static  Future<PostExpandModel?> getPost(String idpost) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      final response = await http.get(
        Uri.http(Config.apiURL, _getPostAPI, {'id' : idpost}),
        headers: {
          'Authorization' : token!
        }
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return PostExpandModel(
          data['idpost'], 
          data['title'], 
          data['datecreate'], 
          data['content'],
          UserBriefModel(
              data['User']['iduser'],
              data['User']['name'],
              data['User']['rolename']
          ),
          List.from(data['Comments'].map((comment) => CommentModel(
            comment['idcomment'], 
            comment['message'],
            comment['datecomment'],
            UserBriefModel(
              comment['User']['iduser'],
              comment['User'][' name'],
              comment['User']['Role']['rolename']
            )
        ))));     
      }

    } catch (err) {
      return null;
    }
  }
}