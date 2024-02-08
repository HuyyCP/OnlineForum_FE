import 'package:flutter/material.dart';
import 'package:onlineforum_fe/views/index.dart';

class IndexRoute {
  static Widget Function(BuildContext) init(BuildContext context) {
    return (context) {
      return const IndexPage();
    };
  }
}