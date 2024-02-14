// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:onlineforum_fe/api_services/account_api_service.dart';
import 'package:onlineforum_fe/helpers/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Online Forum",
                style: TextStyle(
                  fontSize: 50,
                )
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validateEmpty,
                      controller: usernameController,
                      decoration: const InputDecoration(
                        labelText: "Username",
                      ),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validateEmpty,
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        onPressed: () async {
                          if(_formKey.currentState!.validate()) {
                            String username = usernameController.text;
                            String password = passwordController.text;
                            if (await AccountAPIService.login(username, password)) {
                              Navigator.pushReplacementNamed(context, '/home');
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    contentPadding: const EdgeInsets.all(20),
                                    content: const Text(
                                      "Incorrect username or password",
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }
                              );
                            }
                          }
                        },
                        child: const Text("Login"),
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Do not have an account yet? '),
                    GestureDetector(
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onTap: () async {
                        Navigator.pushReplacementNamed(context, '/register');
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
