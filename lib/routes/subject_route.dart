import 'package:flutter/material.dart';
import 'package:onlineforum_fe/views/subject_page.dart';

class SubjectRoute {
  static Widget Function(BuildContext context) init(BuildContext context) {
    return (context)  {
      return const SubjectPage();
    };
  }
}