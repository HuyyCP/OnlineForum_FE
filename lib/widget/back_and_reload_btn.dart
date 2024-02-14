import 'package:flutter/material.dart';

class BackAndReloadButton extends StatelessWidget {
  late String targetRoute;
  Object? arguments;
  BackAndReloadButton(this.targetRoute, {super.key, this.arguments});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.popAndPushNamed(context, targetRoute, arguments: arguments);
      },
    );
  }
}