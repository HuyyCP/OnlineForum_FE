import 'package:onlineforum_fe/models/userbrief_model.dart';

class PostBriefModel {
  late String idpost;
  late String title;
  late DateTime datecreate;
  late String content;
  late UserBriefModel author;

  PostBriefModel(this.idpost, this.title, this.datecreate, this.content, this.author);
}