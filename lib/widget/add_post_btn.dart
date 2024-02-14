import 'package:flutter/material.dart';

class AddPostButton extends StatefulWidget {
  const AddPostButton({super.key});

  @override
  State<AddPostButton> createState() => _AddPostButtonState();
}

class _AddPostButtonState extends State<AddPostButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[600],
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
          icon: const Icon(Icons.add), 
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/add-post');
          },
        ),
    );
  }
}