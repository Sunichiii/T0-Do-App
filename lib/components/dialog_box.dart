import 'package:flutter/material.dart';
import 'package:flutter_revision/components/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {required this.controller,
      required this.onCancel,
      required this.onSave,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey,
      content: SizedBox(
        height: 117,
        child: Column(
          children: [
            // Getting user input
            TextField(
              style: const TextStyle(fontFamily: 'JetBrainsMono'),
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87)
                ),
                hintText: "Add a new task",
                hintStyle: TextStyle(fontFamily: 'JetBrains'),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            // Buttons to save and cancel
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Save button
                  MyButton(text: "Save", onPressed: onSave),

                  const SizedBox(
                    width: 8,
                  ),

                  // Cancel button
                  MyButton(text: "Cancel", onPressed: onCancel),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
