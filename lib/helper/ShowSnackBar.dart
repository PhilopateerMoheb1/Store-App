// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

void ShowSnackBarMsg(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
    ),
  );
}
