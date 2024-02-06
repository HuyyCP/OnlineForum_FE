import 'package:flutter/material.dart';
import 'package:onlineforum_fe/api_services/subsubject_api_service.dart';
import 'package:onlineforum_fe/widget/post_card.dart';

class SubjectPage extends StatefulWidget {
  late String idsubject;
  SubjectPage(this.idsubject, {super.key});

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SubSubjectAPIService.getSubSubject(widget.idsubject), 
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text(snapshot.data!.subjectname),
            ),
            body: Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: List<PostCard>.from(snapshot.data!.posts!.map(
                      (post) => PostCard(post)
                    )),
                  )
                ),
              ),
            )
          );
        }
        return const Center(child: CircularProgressIndicator());
      }
    );
  }
}