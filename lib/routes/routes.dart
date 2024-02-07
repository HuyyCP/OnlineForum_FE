import 'package:flutter/material.dart';
import 'package:onlineforum_fe/routes/home_route.dart';
import 'package:onlineforum_fe/routes/login_route.dart';
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
    };
    return _route;
  }

}