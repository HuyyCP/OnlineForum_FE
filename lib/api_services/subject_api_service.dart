import 'dart:convert';
import 'package:onlineforum_fe/config/api_config.dart';
import 'package:http/http.dart' as http;
import 'package:onlineforum_fe/models/subject_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubjectAPIService {
  static const String _getSubjectAPI = '/subject/get-all';

  static Future<List<SubjectModel>?> getSubject() async {
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
        return List<SubjectModel>.from(data.map((subject) => SubjectModel(
              subject['idsubject'],
              subject['subjectname'],
              List<SubjectModel>.from(subject['SubSubjects'].map(
                  (subsubject) => SubjectModel(
                    subsubject['idsubject'],
                    subsubject['subjectname']
                  ))))));
      } else {
        return null;
      }
    } catch (err) {
      print("Error: $err");
      return null;
    }
  }
}
