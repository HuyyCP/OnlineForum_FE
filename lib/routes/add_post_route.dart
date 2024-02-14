
import 'package:flutter/material.dart';
import 'package:onlineforum_fe/views/add_post_page.dart';


class AddPostRoute {
  static Widget Function(BuildContext) init(BuildContext context) {
    return (context) {
      return const AddPostPage();
    };
  }
}