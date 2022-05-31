


import 'package:airscaper/models/navigation_intent.dart';
import 'package:airscaper/views/common/ars_dialog_base.dart';
import 'package:flutter/material.dart';

const String dialogRouteName = "dialog";

class DialogContent extends StatelessWidget {

  final DialogArguments arguments;

  const DialogContent({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ARSDialogBase(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            (arguments.title.isEmpty)
                ? Container(
              width: 0,
              height: 0,
            )
                : Text(arguments.title,
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(arguments.message, style: TextStyle(fontSize: 15)),
            )
          ],
        ),
      ),
    );
  }
}