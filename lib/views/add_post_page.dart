// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:onlineforum_fe/api_services/post_api_service.dart';
import 'package:onlineforum_fe/api_services/subject_api_service.dart';
import 'package:onlineforum_fe/helpers/validators.dart';
import 'package:onlineforum_fe/models/subject_model.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _subsubjectKey = GlobalKey<FormFieldState>();

  SubjectModel? selectedSubject;
  String? selectedSubsubject;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add post"),
        backgroundColor: Colors.grey[300],
      ),
      body : Container(
        margin: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: SubjectAPIService.getSubject(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return Container(
                margin: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownButtonFormField(
                        // key: _subjectKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validateSelectionItem,
                        decoration: const InputDecoration(
                          labelText: "Subject",
                        ),
                        hint: const Text("Select an option"),
                        items: snapshot.data!.map(
                          (item) => DropdownMenuItem(
                            value: item.idsubject, 
                            child: Text(item.subjectname))
                          ).toList(),
                        onChanged: (value) {
                          setState(() {
                            _subsubjectKey.currentState?.reset();
                            selectedSubject = snapshot.data!.firstWhere((element) => element.idsubject == value);
                          });
                        }
                      ),
                      DropdownButtonFormField(
                        key: _subsubjectKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator:  validateSelectionItem,
                        decoration: const InputDecoration(
                          labelText: "Sub subject",
                        ),
                        hint: const Text("Select an option"),
                        items: selectedSubject == null ? List.empty() : snapshot.data!.firstWhere((element) => element.idsubject == selectedSubject!.idsubject).subsubjects!.map(
                          (item) => DropdownMenuItem(
                            value: item.idsubject, 
                            child: Text(item.subjectname))
                          ).toList(), 
                        onChanged: (value) {
                          selectedSubsubject = value.toString();
                          setState(() { });
                        }
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validateEmpty,
                        controller: titleController,
                        decoration: const InputDecoration(
                          labelText: "Title"
                        ),
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validateEmpty,
                        maxLines: 10,
                        controller: contentController,
                        decoration: const InputDecoration(
                          labelText: "Content"
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if(_formKey.currentState!.validate()) {
                            String idsubject = selectedSubsubject!;
                            String title = titleController.text;
                            String content = contentController.text;
                            if(await PostAPIService.addPost(idsubject, title, content)) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    contentPadding: const EdgeInsets.all(20),
                                    content: const Text(
                                      "Add post successfully",
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }
                              );
                              _formKey.currentState!.reset();
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    contentPadding: const EdgeInsets.all(20),
                                    content: const Text(
                                      "Add post failed",
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }
                              );
                            }
                          }
                        }, 
                        child: const Text("Add post")
                      )
                    ],
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }
        ),
      )
    );
  }
}