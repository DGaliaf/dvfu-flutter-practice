import 'package:flutter/material.dart';
import 'package:todo_app/utils/my_button.dart';

class MyDialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  MyDialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purpleAccent,
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add new task",
                ),
              ),
              Row(
                children: [
                  MyButton(text: "Save", onButtonPressed: onSave),
                  const SizedBox(width: 8),
                  MyButton(text: "Cancel", onButtonPressed: onCancel),
                ],
              ),
          ],
        ),
      ),
    );
  }
}