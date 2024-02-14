import 'package:onlineforum_fe/models/comment_model.dart';
import 'package:onlineforum_fe/models/subsubject_model.dart';
import 'package:onlineforum_fe/models/userbrief_model.dart';

class PostExpandModel {
  late String idpost;
  late String title;
  late DateTime datecreate;
  late String content;
  late SubSubjectModel subject;
  late UserBriefModel author;
  late List<CommentModel>? comments = [];

  PostExpandModel(this.idpost, this.title, this.datecreate, this.content, this.subject, this.author, [this.comments]);
}