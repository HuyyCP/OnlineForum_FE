import 'package:flutter/material.dart';
import 'package:onlineforum_fe/models/user.dart';

class UserModel extends StatefulWidget {
  User user;
  UserModel(this.user, {super.key});

  @override
  State<UserModel> createState() => _UserModelState();
}

class _UserModelState extends State<UserModel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text('Name: ${widget.user.name}'),
          Text('Email: ${widget.user.email}'),
        ]
      )
    );
  }
}