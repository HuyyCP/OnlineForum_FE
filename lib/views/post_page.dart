import 'package:flutter/material.dart';
import 'package:onlineforum_fe/api_services/post_api_service.dart';
import 'package:onlineforum_fe/models/postbrief_model.dart';
import 'package:onlineforum_fe/widget/comment_card.dart';
import 'package:onlineforum_fe/widget/post_card.dart';

class PostPage extends StatefulWidget {
  late String idpost;
  PostPage(this.idpost, {super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PostAPIService.getPost(widget.idpost), 
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Post"),
            ),
            body: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  PostCard(PostBriefModel(
                    snapshot.data!.idpost, 
                    snapshot.data!.title, 
                    snapshot.data!.datecreate, 
                    snapshot.data!.content, 
                    snapshot.data!.author
                  )),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.from(snapshot.data!.comments!.map((comment) => CommentCard(comment))),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      });
  }
}