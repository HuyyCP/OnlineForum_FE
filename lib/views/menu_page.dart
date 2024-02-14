import 'package:flutter/material.dart';
import 'package:onlineforum_fe/api_services/user_api_service.dart';
import 'package:onlineforum_fe/widget/back_and_reload_btn.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserAPIService.getUser(),
      builder: (context, snapshot) { 
        if(snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("My Account"),
              backgroundColor: Colors.grey[300],
              // leading: BackAndReloadButton('/home'),
            ),
            body: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 80,
                        // backgroundImage: AssetImage('assets/avatar.png'),
                        backgroundColor: Colors.grey[600],
                      ),
                      IconButton(
                        icon: const Icon(Icons.camera_alt),
                        onPressed: () {
                          
                        },
                      ),
                    ],
                  ),
                  Text(snapshot.data!.name),
                  GestureDetector(
                    onTap: () async {
                      await Navigator.pushNamed(context, '/account-info');
                      setState(() { });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: const Row(
                        children: [
                          Icon(Icons.info),
                          Expanded(child: Text("Change information"))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Navigator.pushNamed(context, '/change-password');
                      setState(() { });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: const Row(
                        children: [
                          Icon(Icons.key),
                          Expanded(child: Text("Change password"))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: const Row(
                        children: [
                          Icon(Icons.exit_to_app),
                          Expanded(child: Text("Sign out"))
                        ],
                      ),
                    ),
                  ),
                ]
              )
            )
          );
        }
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}