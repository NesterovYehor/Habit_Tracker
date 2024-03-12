import 'package:flutter/material.dart';

class MyAlertBox extends StatelessWidget {
  const MyAlertBox({Key? key, required this.onSave, required this.habitName}) : super(key: key);

  final Function(String) onSave;
  final String habitName;

  @override
  Widget build(BuildContext context) {
    TextEditingController _habitController = TextEditingController();
    _habitController.text = habitName;

    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      content: TextField(
        controller: _habitController,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Cancel",
            style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ),
        TextButton(
          onPressed: () {
            onSave(_habitController.text);
            Navigator.pop(context);
          },
          child: Text(
            "Save",
            style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ),
      ],
    );
  }
}
