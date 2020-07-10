import 'package:airscaper/common/colors.dart';
import 'package:flutter/material.dart';

class ARSScaffold extends StatelessWidget {
  final Widget child;
  final String title;

  const ARSScaffold({Key key, this.child, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(title),
        elevation: 0,
        centerTitle: true,
      ),
      body: child,
    );
  }


}