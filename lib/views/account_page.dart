// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onlineforum_fe/api_services/user_api_service.dart';
import 'package:onlineforum_fe/helpers/date_picker.dart';
import 'package:onlineforum_fe/helpers/validators.dart';
import 'package:onlineforum_fe/widget/back_and_reload_btn.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserAPIService.getUser(),
      builder: (context, snapshot) { 
        if(snapshot.hasData) {
          nameController.text = snapshot.data!.name;
          emailController.text = snapshot.data!.email;
          dobController.text = snapshot.data!.dateofbirth;
          phonenumberController.text = snapshot.data!.phonenumber;

          return Scaffold(
            appBar: AppBar(
              title: const Text("My information"),
              backgroundColor: Colors.grey[300],
              // leading: BackAndReloadButton('/menu'),
            ),
            body: Container(
              margin: const EdgeInsets.all(10),
              child: Center(
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: validateEmpty,
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: "Name",
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextFormField(
                              validator: validateEmpty,
                              controller: dobController,
                              decoration: const InputDecoration(
                                labelText: "Date of birth",
                              ),
                              readOnly: true,
                                onTap: () async {
                                final selectedDate = await selectDate(context);
                                if (selectedDate != null) {
                                  dobController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      TextFormField( 
                        validator: validateEmpty,
                        controller: phonenumberController,
                        decoration: const InputDecoration(
                          labelText: "Phone number",
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
                              String name = nameController.text;
                              String dob = dobController.text;
                              String email = emailController.text;
                              String phonenumber = phonenumberController.text;
          
                              if (await UserAPIService.updateUser(name, email, dob, phonenumber)) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      contentPadding: const EdgeInsets.all(20),
                                      content: const Text(
                                        "Update successfully",
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
                          child: const Text("Update"),
                        ),
                      ),
                    ],
                  )
                )
              ),
            )
          );
        }
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}