import 'package:flutter/material.dart';
import 'package:onlineforum_fe/api_services/comment_api_service.dart';
import 'package:onlineforum_fe/api_services/post_api_service.dart';
import 'package:onlineforum_fe/models/postbrief_model.dart';
import 'package:onlineforum_fe/widget/comment_card.dart';
import 'package:onlineforum_fe/widget/post_card.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }


  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return FutureBuilder(
      future: PostAPIService.getPost(args['idpost']), 
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
                  AbsorbPointer(
                    absorbing: true,
                    child: PostCard(PostBriefModel(
                      snapshot.data!.idpost,
                      snapshot.data!.title,
                      snapshot.data!.datecreate,
                      snapshot.data!.content,
                      snapshot.data!.author,
                    )),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: List.from(snapshot.data!.comments!.map((comment) => CommentCard(comment))),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.black,
                          width: 1
                        )
                      )
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: messageController,
                            decoration: const InputDecoration(
                              hintText: "Comment here",
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            await CommentAPIService.addComment(messageController.text, snapshot.data!.idpost);
                            setState(() {
                              // Update the state and refresh the comment list
                            });
                            messageController.text = "";
                            scrollToTop();
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      });
  }
}