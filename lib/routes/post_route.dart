import 'package:flutter/material.dart';
import 'package:onlineforum_fe/views/post_page.dart';

class PostRoute {
  static Widget Function(BuildContext context) init(BuildContext context) {
    return (context)  {
      return const PostPage();
    };
  }
}