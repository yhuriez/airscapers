import 'package:flutter/material.dart';

class ARSCodeTextField extends StatefulWidget {
  final Widget Function(Function(BuildContext)) confirmBuilder;
  final List<String> acceptedValues;
  final Function(BuildContext, String) callback;
  final String hint;
  final String validationErrorMessage;

  const ARSCodeTextField(
      {Key key,
      @required this.confirmBuilder,
      this.acceptedValues = const [],
      this.callback,
      this.hint,
      this.validationErrorMessage})
      : super(key: key);

  @override
  _ARSCodeTextFieldState createState() => _ARSCodeTextFieldState();
}

class _ARSCodeTextFieldState extends State<ARSCodeTextField> {
  final _formKey = GlobalKey<FormState>();
  String inputValue;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[_codeInput, widget.confirmBuilder(onConfirmClicked)],
      ),
    );
  }

  Widget get _codeInput => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              border: Border.all(color: Colors.black12)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                style: TextStyle(fontSize: 16.0),
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: widget.hint ?? ""),
                validator: (value) {
                  if (widget.acceptedValues.isNotEmpty &&
                      !widget.acceptedValues.contains(value.toLowerCase())) {
                    return widget.validationErrorMessage ?? "Erreur";
                  }
                  return null;
                },
                onSaved: (value) {
                  inputValue = value;
                }),
          ),
        ),
      );

  onConfirmClicked(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      widget.callback(context, inputValue);
    }
  }
}
