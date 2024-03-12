import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
   MyFloatingActionButton({super.key, required this.onPressed});

  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      onPressed: onPressed,
      child: Icon(Icons.add),
      );
  }
}