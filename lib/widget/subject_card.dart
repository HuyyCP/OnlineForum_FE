import 'package:flutter/material.dart';
import 'package:onlineforum_fe/models/subject_model.dart';
import 'package:onlineforum_fe/views/subject_page.dart';

class SubjectCard extends StatefulWidget {
  SubjectModel subject;
  SubjectCard(this.subject, {super.key});

  @override
  State<SubjectCard> createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
  Color? colorOnTap = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black,
              width: 1
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300]
            ),
            child: Text(
              widget.subject.subjectname,
              style: const TextStyle(
                fontWeight: FontWeight.bold
              )
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.subject.subsubjects!.map((subsubject) => GestureDetector(
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: colorOnTap,
                  ),
                  child: Text(
                    subsubject.subjectname,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                onTap: () async {
                  colorOnTap = Colors.grey[250];
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => SubjectPage(subsubject.idsubject)
                    )
                  );
                },
                onTapCancel: () async {
                  colorOnTap = Colors.white;
                },
              )).toList()
            ),
          )
        ]
      )
    );
  }
}
