import 'package:flutter/material.dart';


const TEXT_FIELD_SIZE = 60.0;

class ARSCodeTextField extends StatefulWidget {

  final List<String> acceptedValues;
  final Function(BuildContext, String) callback;
  final String? hint;
  final String? validationErrorMessage;

  const ARSCodeTextField(
      { Key? key,
        this.acceptedValues = const [],
        required this.callback,
        this.hint,
        this.validationErrorMessage})
      : super(key: key);

  @override
  _ARSCodeTextFieldState createState() => _ARSCodeTextFieldState();
}

class _ARSCodeTextFieldState extends State<ARSCodeTextField> {
  final _formKey = GlobalKey<FormState>();
  String? inputValue;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: <Widget>[
          Expanded(child: _codeInput),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: createConfirmButton(context),
          )
        ],
      ),
    );
  }

  Widget get _codeInput => Container(
    height: TEXT_FIELD_SIZE,
    decoration: borderDecoration,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          style: TextStyle(fontSize: 16.0, backgroundColor: Colors.white),
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: widget.hint ?? ""),
          validator: (value) {
            final acceptedValues = widget.acceptedValues
                .map((e) => e.toLowerCase()).toList();

            if (acceptedValues.isNotEmpty &&
                !acceptedValues.contains(value?.toLowerCase())) {
              return widget.validationErrorMessage ?? "Erreur";
            }
            return null;
          },
          onFieldSubmitted: (value){
            widget.callback(context, value);
          },
          onSaved: (value) {
            inputValue = value;
          }),
    ),
  );

  Widget createConfirmButton(BuildContext context) => SizedBox(
    width: TEXT_FIELD_SIZE,
    height: TEXT_FIELD_SIZE,
    child: Container(
      decoration: borderDecoration,
      child: InkWell(
        onTap: () => onConfirmClicked(context),
        child: Center(
                  child: SizedBox(
                      height: 24,
                      width: 24,
                      child: Image.asset("assets/images/common/check.png"))),
      ),
    ),
  );

  BoxDecoration get borderDecoration => BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(6.0)),
      border: Border.all(color: Colors.black12));

  onConfirmClicked(BuildContext context) {
    if (_formKey.currentState?.validate() == true) {
      _formKey.currentState?.save();
      widget.callback(context, inputValue ?? "");
    }
  }
}
