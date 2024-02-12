import 'package:flutter/material.dart';
import 'package:onlineforum_fe/api_services/subject_api_service.dart';
import 'package:onlineforum_fe/models/subject_model.dart';
import 'package:onlineforum_fe/widget/menu_btn.dart';
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
        title: const Text("Home"),
        backgroundColor: Colors.grey[300],
        actions: const [
          MenuButton()
        ]
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
            future: SubjectAPIService.getSubject(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List<SubjectCard>.from(snapshot.data!.map(
                        (record) => SubjectCard(record)))),
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          )
        ),
      ),
    );
  }
}
