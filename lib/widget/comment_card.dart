import 'package:flutter/material.dart';
import 'package:onlineforum_fe/models/comment_model.dart';

class CommentCard extends StatefulWidget {
  late CommentModel comment;

  CommentCard(this.comment, {super.key});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
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
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Row(
              children: [
                Text(widget.comment.author.name),
                const SizedBox(width: 15),
                Text(widget.comment.author.rolename),
                const SizedBox(width: 15),
                Text(widget.comment.datecomment.toLocal().toString())
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              widget.comment.message,
              overflow: TextOverflow.ellipsis,
            )
          )
        ],
      ),
    );
  }
}