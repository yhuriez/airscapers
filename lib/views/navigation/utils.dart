import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: SizedBox.expand(child: Text(message)),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
