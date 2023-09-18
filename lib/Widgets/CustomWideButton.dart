// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class CustomWideButton extends StatelessWidget {
  CustomWideButton({
    super.key,
    this.buttonText,
    this.onTap,
  });
  String? buttonText;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.blue,
        ),
        height: 60,
        width: double.infinity,
        child: Center(
            child: Text(
          buttonText ?? " ",
          style: const TextStyle(
            fontSize: 20,
          ),
        )),
      ),
    );
  }
}
