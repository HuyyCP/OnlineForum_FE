import 'dart:convert';
import 'package:onlineforum_fe/config/api_config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SubjectAPIService {
  static const String _getSubjectAPI = '/subject/get-all';

  static Future<List<dynamic>?> getSubject() async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      final response = await http.get(
        Uri.http(Config.apiURL, _getSubjectAPI),
        headers: {
          'Authorization' : token!
        }
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return List<dynamic>.from(data.map((subject) => (
              subjectname: subject['subjectname'],
              subsubjects: List<({String idsubsubject, String subsubjectname})>.from(subject['SubSubjects'].map(
                  (subsubject) => (
                        idsubsubject: subsubject['idsubject'],
                        subsubjectname: subsubject['subjectname']
                      ))
            ))));
      } else {
        return null;
      }
    } catch (err) {
      print("Error: $err");
      return null;
    }
  }
}
