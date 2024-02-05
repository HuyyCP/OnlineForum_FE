class SubjectModel {
  late String idsubject;
  late String subjectname;
  late List<SubjectModel>? subsubjects = []; 
  
  SubjectModel(this.idsubject, this.subjectname, [this.subsubjects]);
}