import 'package:flutter/material.dart';
import 'package:onlineforum_fe/api_services/subject_api_service.dart';
import 'package:onlineforum_fe/api_services/user_api_service.dart';

import '../models/user.dart';
import '../widget/subject_card.dart';
import '../widget/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
        backgroundColor: Colors.grey[300],
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder<List<dynamic>?>(
            future: SubjectAPIService.getSubject(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                    children: List<SubjectCard>.from(snapshot.data!.map(
                        (record) => SubjectCard(
                            record as ({String subjectname, List<({String idsubsubject, String subsubjectname})> subsubjects})))));
              }
              return const Center(child: CircularProgressIndicator());
            },
          )),
    );
  }
}
