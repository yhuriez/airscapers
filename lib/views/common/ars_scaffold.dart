import 'package:airscaper/common/colors.dart';
import 'package:flutter/material.dart';

class ARSScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final List<Widget> actions;

  const ARSScaffold({Key? key,
    required this.child, required this.title, this.actions = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(title),
        elevation: 0,
        centerTitle: true,
        actions: actions,
      ),
      body: child,
    );
  }


}