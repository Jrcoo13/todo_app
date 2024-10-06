import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String buttonName;
  final Color bgColor;
  final Color fontColor;
  VoidCallback onPressed;

  CustomButton({
    super.key,
    required this.buttonName,
    required this.bgColor,
    required this.fontColor,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: bgColor,
      child: Text(
        buttonName,
        style: TextStyle(
          fontSize: 15,
          color: fontColor,
        ))
    );
  }
}