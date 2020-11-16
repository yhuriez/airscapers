


import 'package:flutter/material.dart';

class ARSIconButton extends StatelessWidget {

  final Function(BuildContext) onClick;
  final String text;
  final Color backgroundColor;
  final IconData icon;

  const ARSIconButton({Key key, @required this.onClick, @required this.text, this.backgroundColor, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FloatingActionButton(
          elevation: 4.0,
          backgroundColor: backgroundColor ?? Colors.black,
          foregroundColor: Colors.white,
          child: Icon(icon ?? Icons.add, size: 30),
          heroTag: text,
          onPressed: () {
            onClick(context);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(text, style: TextStyle(fontSize: 15, color: backgroundColor)),
        )
      ],
    );
  }
}