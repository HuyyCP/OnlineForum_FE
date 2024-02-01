
import 'package:flutter/material.dart';

class SubjectCard extends StatefulWidget {
  ({String subjectname, List<({String idsubsubject, String subsubjectname})> subsubjects}) subject;
  SubjectCard(this.subject, {super.key});

  @override
  State<SubjectCard> createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      // width: double.maxFinite,
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black,
              width: 1
          )
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300]
            ),
            child: Text(widget.subject.subjectname),
          ),
          Container(
            child: Column(
              children: widget.subject.subsubjects.map((subsubject) => GestureDetector(
                child: Text(
                  subsubject.subsubjectname,
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () async {

                },
              )).toList()
            ),
          )
        ]
      )
    );
  }
}
