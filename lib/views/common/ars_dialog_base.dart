

import 'package:flutter/material.dart';

import 'ars_white_shadow.dart';

class ARSDialogBase extends StatelessWidget {

  final Widget child;

  const ARSDialogBase({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: ARSShadowBox(
          child: Material(
            color: Colors.transparent,
            child: child,
          ),
        ),
      ),
    );
  }

}

class ARSDialogConfirm extends StatelessWidget {

  final String title;
  final String message;
  final String okText;
  final String cancelText;
  final Function(BuildContext) okAction;

  const ARSDialogConfirm({Key key, this.title, this.message, this.okText, this.cancelText, this.okAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ARSDialogBase(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => okAction(context),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      okText,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      cancelText,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}