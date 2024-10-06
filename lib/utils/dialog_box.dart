import 'package:flutter/material.dart';
import 'package:todo_app/utils/custom_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[200],
      content: SizedBox(
        height: 130,
        child: Column(
          children: [
            //get task name
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Create New Task',
              ),
            ),
            //buttons
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //cancel button
                  CustomButton(buttonName: 'Cancel', bgColor: Colors.grey.shade100, fontColor: Colors.black, onPressed: onCancel),
                  const SizedBox(width: 10),
                  //save button
                  CustomButton(buttonName: 'Save', bgColor: Colors.grey.shade400, fontColor:Colors.black, onPressed: onSave),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}