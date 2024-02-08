import 'package:flutter/material.dart';
import 'package:onlineforum_fe/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Forum',
      initialRoute: '/login',
      routes: Routes.init(context),
      debugShowCheckedModeBanner: false,
    );
  }
}

