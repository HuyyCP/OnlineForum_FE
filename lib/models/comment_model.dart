import 'package:onlineforum_fe/models/userbrief_model.dart';

class CommentModel {
  late String idcomment;
  late String message;
  late DateTime datecomment;
  late UserBriefModel author;

  CommentModel(this.idcomment, this.message, this.datecomment, this.author);
}