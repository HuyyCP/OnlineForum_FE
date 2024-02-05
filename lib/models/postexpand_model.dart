import 'package:onlineforum_fe/models/comment_model.dart';
import 'package:onlineforum_fe/models/userbrief_model.dart';

class PostExpandModel {
  late String idpost;
  late String title;
  late DateTime datecreate;
  late String content;
  late UserBriefModel author;
  late List<CommentModel>? comments = [];

  PostExpandModel(this.idpost, this.title, this.datecreate, this.content, this.author, [this.comments]);
}