import 'package:flutter/material.dart';
import 'package:onlineforum_fe/models/postbrief_model.dart';
import 'package:onlineforum_fe/views/post_page.dart';

class PostCard extends StatefulWidget {
  PostBriefModel post;
  PostCard(this.post, {super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  Color? colorOnTap = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      widget.post.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "By ${widget.post.author.name}",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        widget.post.author.rolename
                      ),
                      const SizedBox(width: 15),
                      Text(
                        "at ${widget.post.datecreate.toLocal().toString()}",
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Text(widget.post.content, overflow: TextOverflow.ellipsis,),
            )
          ]
        )
      ),
      onTap: () async {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => PostPage(widget.post.idpost),
          )
        );
      },
    );
  }
}
