// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:onlineforum_fe/api_services/account_api_service.dart';
import 'package:onlineforum_fe/helpers/validators.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController newpwController = TextEditingController();
  TextEditingController confpwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change password"),
        backgroundColor: Colors.grey[300],
      ),
      body: Container(
        margin: const EdgeInsets.all(10), 
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: validateEmpty,
                controller: newpwController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "New password"
                ),
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: validateEmpty,
                controller: confpwController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confirm password"
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if(_formKey.currentState!.validate()) {
                    String newpw = newpwController.text;
                    String confpw = confpwController.text;
                    if(newpw != confpw) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            contentPadding: const EdgeInsets.all(20),
                            content: const Text(
                              "Passwords do not match",
                              textAlign: TextAlign.center,
                            ),
                          );
                        }
                      );
                    } else {
                      if(await AccountAPIService.changePassword(newpw)) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              contentPadding: const EdgeInsets.all(20),
                              content: const Text(
                                "Change password successfully",
                                textAlign: TextAlign.center,
                              ),
                            );
                          }
                        );
                        _formKey.currentState!.reset();
                        newpwController.text = "";
                        confpwController.text = "";
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              contentPadding: const EdgeInsets.all(20),
                              content: const Text(
                                "Change password failed",
                                textAlign: TextAlign.center,
                              ),
                            );
                          }
                        );
                      }
                    }
                  }
                }, 
                child: const Text("Change"))
            ],
          ),
        )
      ),
    );
  }
}