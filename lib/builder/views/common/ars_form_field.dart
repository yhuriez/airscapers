import 'package:airscaper/common/colors.dart';
import 'package:airscaper/common/styles.dart';
import 'package:flutter/material.dart';

class ARSFormField extends StatefulWidget {
  final String label;
  final String hint;
  final FormFieldValidator<String> validator;
  final Map<String, dynamic> values;
  final String valueKey;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final bool obscureText;
  final TextEditingController controller;

  const ARSFormField(
      {Key key,
      @required this.values,
      @required this.valueKey,
      this.label,
      this.hint,
      this.validator,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.obscureText = false,
      this.controller})
      : super(key: key);

  @override
  _ARSFormFieldState createState() => _ARSFormFieldState();
}

class _ARSFormFieldState extends State<ARSFormField> {

  bool passwordDisplayed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        (widget.label == null)
            ? Container()
            : Text(
                widget.label,
                style: arsFieldLabelTextStyle,
              ),

        // Field
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Stack(
            children: [
              _textField,


            ],
          )
        ),
      ],
    );
  }

  Widget get _textField => TextFormField(
      controller: widget.controller,
      style: arsFieldContentTextStyle,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: arsFieldBorder,
          focusedBorder: arsFieldBorder,
          errorBorder: arsFieldErrorBorder,
          focusedErrorBorder: arsFieldErrorBorder,
          errorStyle: TextStyle(fontSize: 16.0, color: arsErrorColor),
          hintText: widget.hint ?? "",
          contentPadding: EdgeInsets.only(left: 16),
          fillColor: arsFieldColor,
          filled: true
      ),
      validator: widget.validator,
      onFieldSubmitted: (value) {
        widget.values[widget.valueKey] = value;
      },
      onSaved: (value) {
        widget.values[widget.valueKey] = value;
      });
}
