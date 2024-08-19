import 'package:classico/my_button.dart';
import 'package:flutter/material.dart';

class dialog_box extends StatelessWidget {
  final controller ;
  VoidCallback onSave;
  VoidCallback onCancel;

   dialog_box({super.key , required this.controller , required this.onSave , required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[400],
      content: Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add a new Task",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Save button
                  my_botton(text: 'Save', onPressed: onSave),

                  const SizedBox(width: 8),
                  // Cancel button
                  my_botton(text: 'Cancel', onPressed: onCancel),
                ],
              )
            ],
          )),
    );
  }
}
