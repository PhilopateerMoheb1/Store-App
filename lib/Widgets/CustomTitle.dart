// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.text,
    required this.urlImage,
  });
  final String text;
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 70,
        ),
        Image.asset(
          urlImage,
          height: 75,
        ),
        Text(text),
      ],
    );
  }
}
