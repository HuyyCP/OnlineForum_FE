import 'package:onlineforum_fe/models/postbrief_model.dart';

class SubSubjectModel {
  late String idsubject;
  late String subjectname;
  late List<PostBriefModel>? posts = [];

  SubSubjectModel(this.idsubject, this.subjectname, [this.posts]);
}