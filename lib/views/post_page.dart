import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  late String idpost;
  PostPage(this.idpost, {super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}