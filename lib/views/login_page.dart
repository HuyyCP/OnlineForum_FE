import 'package:flutter/material.dart';
import 'package:onlineforum_fe/api_services/account_api_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          // height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: "Username",
                ),
              ),
               TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    String username = usernameController.text;
                    String password = passwordController.text;
                    if (await AccountAPIService.login(username, password)) {
                      Navigator.pushReplacementNamed(context, '/home');
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            content: Text(
                              "Incorrect username or password"
                            )
                          );
                        }
                      );
                    }
                  },
                  child: Text("Login"),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top : 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Do not have an account yet? '),
                    GestureDetector(
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () async {

                      },
                    )
                  ],
                ),
              )
            ],
          )
        )
      )
    );
  }
}
