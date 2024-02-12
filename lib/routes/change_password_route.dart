
import 'package:flutter/material.dart';
import 'package:onlineforum_fe/views/change_password_page.dart';

class ChangePasswordRoute {
  static Widget Function(BuildContext context) init(BuildContext context) {
    return (context)  {
      return const ChangePasswordPage();
    };
  }
}