import 'package:flutter/material.dart';
import 'package:onlineforum_fe/routes/account_route.dart';
import 'package:onlineforum_fe/routes/add_post_route.dart';
import 'package:onlineforum_fe/routes/change_password_route.dart';
import 'package:onlineforum_fe/routes/home_route.dart';
import 'package:onlineforum_fe/routes/login_route.dart';
import 'package:onlineforum_fe/routes/menu_route.dart';
import 'package:onlineforum_fe/routes/post_route.dart';
import 'package:onlineforum_fe/routes/register_route.dart';
import 'package:onlineforum_fe/routes/subject_route.dart';

class Routes {
  static late Map<String, Widget Function(BuildContext)> _route;

  static Map<String, Widget Function(BuildContext)> init(BuildContext context) {
    _route = {
      '/login' : LoginRoute.init(context),
      '/register' : RegisterRoute.init(context),
      '/home' : HomeRoute.init(context),
      '/subject': SubjectRoute.init(context),
      '/post': PostRoute.init(context),
      '/menu': MenuRoute.init(context),
      '/account-info': AccountRoute.init(context),
      '/change-password': ChangePasswordRoute.init(context),
      '/add-post': AddPostRoute.init(context),
    };
    return _route;
  }

}