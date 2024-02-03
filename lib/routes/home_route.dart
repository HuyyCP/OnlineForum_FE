
import 'package:flutter/material.dart';
import 'package:onlineforum_fe/views/home_page.dart';

class HomeRoute {
  static Widget Function(BuildContext) init(BuildContext context) {
    return (context) {
      return const HomePage();
    };
  }
}