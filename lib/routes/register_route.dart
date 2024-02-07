import 'package:flutter/material.dart';
import 'package:onlineforum_fe/views/register_page.dart';

class RegisterRoute {
  static Widget Function(BuildContext context) init(BuildContext context) {
    return (context)  {
      return const RegisterPage();
    };
  }
}