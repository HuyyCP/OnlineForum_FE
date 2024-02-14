import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onlineforum_fe/config/api_config.dart';
import 'package:onlineforum_fe/models/comment_model.dart';
import 'package:onlineforum_fe/models/postexpand_model.dart';
import 'package:onlineforum_fe/models/subsubject_model.dart';
import 'package:onlineforum_fe/models/userbrief_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostAPIService {
  static const String _getPostAPI = '/post';
  static const String _addPostAPI = '/post/add';

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
          DateTime.parse(data['datecreate']), 
          data['content'],
          SubSubjectModel(
            data['SubSubject']['idsubject'],
            data['SubSubject']['subjectname']
          ),
          UserBriefModel(
              data['User']['iduser'],
              data['User']['name'],
              data['User']['Role']['rolename']
          ),
          List.from(data['Comments'].map((comment) => CommentModel(
            comment['idcomment'], 
            comment['message'],
            DateTime.parse(comment['datecomment']),
            UserBriefModel(
              comment['User']['iduser'],
              comment['User']['name'],
              comment['User']['Role']['rolename']
            )
        ))));     
      } else {
        return null;
      }
    } catch (err) {
      return null;
    }
  }

  static Future<bool> addPost(idsubject, title, content) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      final response = await http.post(
        Uri.http(Config.apiURL, _addPostAPI),
        headers: {
          'Authorization' : token!
        },
        body : {
          'idsubject': idsubject,
          'title': title,
          'content': content
        }
      );
      return response.statusCode == 200;
    } catch (err) {
      return false;
    }
  }
}