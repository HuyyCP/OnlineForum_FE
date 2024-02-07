// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onlineforum_fe/api_services/account_api_service.dart';
import 'package:onlineforum_fe/helpers/date_picker.dart';
import 'package:onlineforum_fe/helpers/validators.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  DateTime? dateofbirth = DateTime.now();
  TextEditingController phonenumberController = TextEditingController();

  

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
                "Register",
                style: TextStyle(
                  fontSize: 40,
                )
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    TextFormField(
                      validator: validateName,
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: "Name",
                      ),
                    ),
                    TextFormField(
                      validator: validateUsername,
                      controller: usernameController,
                      decoration: const InputDecoration(
                        labelText: "Username",
                      ),
                    ),
                    TextFormField(
                      validator: validatePassword,
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                      ),
                    ),
                    TextFormField(
                      validator: validateEmail,
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          DateFormat('dd-MM-yyyy').format(dateofbirth!)
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit_calendar),
                          onPressed: () async {
                            dateofbirth =  await selectDate(context);
                            setState(() {
                              
                            });
                          },
                        )
                      ],
                    ),
                    TextFormField( 
                      validator: validatePhonenumber,
                      controller: phonenumberController,
                      decoration: const InputDecoration(
                        labelText: "Phone number",
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () async {
                          String name = nameController.text;
                          String username = usernameController.text;
                          String password = passwordController.text;
                          String dob = dateofbirth!.toIso8601String();
                          String email = emailController.text;
                          String phonenumber = phonenumberController.text;

                          if(_formKey.currentState!.validate()) {
                            if (await AccountAPIService.register(name, username, password, dob, email, phonenumber)) {
                              Navigator.pushReplacementNamed(context, '/login');
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    contentPadding: const EdgeInsets.all(20),
                                    content: const Text(
                                      "Register successfully",
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    contentPadding: const EdgeInsets.all(20),
                                    content: const Text(
                                      "Invalid information",
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }
                              );
                            }
                          }
                        },
                        child: const Text("Register"),
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
                    const Text('Already have an account? '),
                    GestureDetector(
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onTap: () async {
                        Navigator.pushReplacementNamed(context, '/login');
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