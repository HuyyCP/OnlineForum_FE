import 'dart:convert';
import 'package:onlineforum_fe/config/api_config.dart';
import 'package:http/http.dart' as http;

class SubjectAPIService {
  static const String _getSubjectAPI = '/subject/get-all';

  static Future<List<dynamic>?> getSubject() async {
    try {
      final response = await http.get(Uri.http(Config.apiURL, _getSubjectAPI));
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
