import 'package:airscaper/app/views/common/ars_button.dart';
import 'package:airscaper/builder/views/common/ars_form_field.dart';
import 'package:airscaper/app/views/common/ars_shadow_box.dart';
import 'package:airscaper/common/colors.dart';
import 'package:airscaper/common/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:airscaper/common/extensions.dart';

class LoginScreen extends StatelessWidget {
  static const screenName = "login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: backgroundColor,
          child: Center(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SizedBox(
                    width: 700,
                    child: ARSShadowBox.darkBox(
                        color: containerColor, child: LoginForm()),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class LoginForm extends StatefulWidget {

  @override
  _LoginFormState createState() => _LoginFormState();
}

const String _EMAIL_KEY = "email";
const String _PASSWORD_KEY = "password";

class _LoginFormState extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();
  final _formValues = Map<String, dynamic>();
  

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // ICON
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: _icon,
          ),

          // EMAIL
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: _emailField,
          ),

          // PASSWORD
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: _passwordField,
          ),
          
          // SIGN IN
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: _signInButton,
          ),          
        ],
      ),
    );
  }

  Widget get _icon => ClipRRect(
        borderRadius: BorderRadius.circular(defaultRadius),
        child: Image.asset("assets/images/common/airscapers_inverted.png",
            width: 200, height: 200),
      );

  Widget get _emailField => ARSFormField(
    label: context.translate("builder.login.email"),
    values: _formValues,
    valueKey: _EMAIL_KEY,
    validator: (value) {
      if(value == null || value.isEmpty) {
        return context.translate("builder.login.email_empty_error");
      }
      if(!EmailValidator.validate(value)) {
        return context.translate("builder.login.email_invalid_error");
      }
      return null;
    },
  );

  Widget get _passwordField => ARSFormField(
    label: context.translate("builder.login.password"),
    values: _formValues,
    valueKey: _PASSWORD_KEY,
    validator: (value){
      if(value == null || value.isEmpty) {
        return context.translate("builder.login.password_empty_error");
      }
      return null;
    },
  );

  Widget get _signInButton => ARSButton(
    onClick: (context){
      if(_formKey.currentState.validate()) {
        print(_formValues);
      }
    },
    text: Text(context.translate("builder.login.sign_in")),
    backgroundColor: accentColor
  );
}
