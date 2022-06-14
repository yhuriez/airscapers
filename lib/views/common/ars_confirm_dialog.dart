import 'package:airscaper/views/common/ars_dialog_base.dart';
import 'package:flutter/material.dart';

class ARSConfirmDialog extends StatelessWidget {
  final Widget child;
  final Function(BuildContext) onOkClicked;
  final Function(BuildContext) onCancelClicked;

  const ARSConfirmDialog(
      {Key? key,
        required this.child,
        required this.onOkClicked,
        required this.onCancelClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ARSDialogBase(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Child
          child,

          // Button bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _createButton(context, "Non", onCancelClicked),
                _createButton(context, "Oui", onOkClicked),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _createButton(
    BuildContext context,
    String text,
    Function(BuildContext) action,
  ) =>
      TextButton(
          child: Text(text, style: TextStyle(fontSize: 20, color: Colors.black),),
          onPressed: () => action(context));
}
