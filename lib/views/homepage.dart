import 'package:flutter/material.dart';
import 'package:onlineforum_fe/api_services/user_api_service.dart';

import '../models/user.dart';
import '../widget/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<List<User>?> (
          future: UserAPIService.getUser(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return Column(
                  children: List<UserModel>.from(snapshot.data!.map((user) => UserModel(user)))
              );
            }
            return const Center(child: CircularProgressIndicator());
          },

        )
      ),
    );
  }
}
