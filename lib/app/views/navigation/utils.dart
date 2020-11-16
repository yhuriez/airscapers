import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: SizedBox.expand(child: Text(message)),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}
