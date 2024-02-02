import 'package:flutter/material.dart';
import 'package:onlineforum_fe/api_services/subject_api_service.dart';
import '../widget/subject_card.dart';

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
        title: const Text("Online Forum"),
        backgroundColor: Colors.grey[300],
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(10),
            child: FutureBuilder<List<dynamic>?>(
              future: SubjectAPIService.getSubject(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List<SubjectCard>.from(snapshot.data!.map(
                        (record) => SubjectCard(
                            record as ({String subjectname, List<({String idsubsubject, String subsubjectname})> subsubjects})))));
                }
                return const Center(child: CircularProgressIndicator());
              },
            )),
      ),
    );
  }
}
