
import 'package:flutter/material.dart';
import 'package:onlineforum_fe/views/login_page.dart';

class LoginRoute {
  static Widget Function(BuildContext context) init(BuildContext context) {
    return (context)  {
      return const LoginPage();
    };
  }
}