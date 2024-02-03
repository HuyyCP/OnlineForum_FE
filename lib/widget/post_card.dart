import 'package:flutter/material.dart';
import 'package:onlineforum_fe/views/post_page.dart';

class PostCard extends StatefulWidget {
  ({String idpost, String title, String content }) subject;
  PostCard(this.subject, {super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  Color? colorOnTap = Colors.white;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300]
            ),
            child: Text(
              widget.subject.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold
              )
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(widget.subject.content),
                ],
              ),
              onTap: () async {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => PostPage(widget.subject.idpost),
                  )
                );
              },
            )
          )
        ]
      )
    );
  }
}
