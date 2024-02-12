import 'package:flutter/material.dart';
import 'package:onlineforum_fe/views/menu_page.dart';

class MenuRoute {
  static Widget Function(BuildContext context) init(BuildContext context) {
    return (context)  {
      return const  MenuPage();
    };
  }
}