import 'package:airscaper/common/styles.dart';
import 'package:flutter/material.dart';

class ARSFormField extends StatefulWidget {
  final String label;
  final String hint;
  final FormFieldValidator<String> validator;
  final Map<String, dynamic> values;
  final String valueKey;

  const ARSFormField(
      {Key key,
      @required this.values,
      @required this.valueKey,
      this.label,
      this.hint,
      this.validator})
      : super(key: key);

  @override
  _ARSFormFieldState createState() => _ARSFormFieldState();
}

class _ARSFormFieldState extends State<ARSFormField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Label
        (widget.label == null)
            ? Container()
            : Text(
                widget.label,
                style: fieldLabelTextStyle,
              ),

        // Field
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: TextFormField(
              style: fieldContentTextStyle,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: widget.hint ?? ""),
              validator: widget.validator,
              onFieldSubmitted: (value) {
                widget.values[widget.valueKey] = value;
              },
              onSaved: (value) {
                widget.values[widget.valueKey] = value;
              }),
        ),
      ],
    );
  }
}
