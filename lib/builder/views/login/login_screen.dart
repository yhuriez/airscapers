import 'package:airscaper/builder/domain/blocs/session_cubit.dart';
import 'package:airscaper/builder/domain/usecases/login_use_cases.dart';
import 'package:airscaper/builder/model/credentials.dart';
import 'package:airscaper/builder/views/common/ars_primary_button.dart';
import 'package:airscaper/builder/views/common/ars_form_field.dart';
import 'package:airscaper/builder/views/common/ars_secondary_button.dart';
import 'package:airscaper/builder/views/common/ars_shadow_box.dart';
import 'package:airscaper/builder/views/login/create_account_screen.dart';
import 'package:airscaper/common/colors.dart';
import 'package:airscaper/common/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:airscaper/common/extensions.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../injection.dart';

class LoginScreen extends StatelessWidget {
  static const screenName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: arsBackgroundColor,
          child: Center(
            child: SizedBox(
              width: 700,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 60.0, horizontal: 30.0),
                  child: ARSShadowBox.darkBox(
                      color: arsContainerColor, child: LoginForm()),
                ),
              ),
            ),
          )),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _formValues = Map<String, dynamic>();

  bool loading = false;
  String errorCode;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              // ICON
              _icon,

              // EMAIL
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: _emailField,
              ),

              // PASSWORD
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: _passwordField,
              ),

              // SIGN IN
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: (loading) ? _loadingButton : _signInButton,
              ),

              // CREATE ACCOUNT
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: _createAccountButton,
              )
            ],
          ),
        ));
  }

  Widget get _icon => ClipRRect(
        borderRadius: BorderRadius.circular(defaultRadius),
        child: Image.asset("assets/images/common/airscapers_inverted.png",
            width: 160, height: 160),
      );

  Widget get _emailField => ARSFormField(
        label: context.translate("builder.login.email"),
        values: _formValues,
        valueKey: Credentials.EMAIL_KEY,
        textInputType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return context.translate("builder.login.email_empty_error");
          }
          if (!EmailValidator.validate(value)) {
            return context.translate("builder.login.email_invalid_error");
          }
          return null;
        },
      );

  Widget get _passwordField => ARSFormField(
        label: context.translate("builder.login.password"),
        values: _formValues,
        valueKey: Credentials.PASSWORD_KEY,
        obscureText: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return context.translate("builder.login.password_empty_error");
          }
          return null;
        },
      );

  Widget get _signInButton => SizedBox(
        width: 400,
        child: ARSPrimaryButton(
            onClick: (context) {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                _doLogin();
              }
            },
            label: context.translate("builder.login.create_account")),
      );

  Widget get _createAccountButton => SizedBox(
        width: 400,
        child: ARSSecondaryButton(
            onClick: (context) {
              Navigator.of(context).pushNamed(CreateAccountScreen.screenName,
                  arguments: _formValues);
            },
            label: context.translate("builder.login.no_account")),
      );

  Widget get _loadingButton => SizedBox(
        width: 400,
        child: ARSPrimaryButton(
          onClick: (context) {},
          child: JumpingDotsProgressIndicator(
              color: arsTextColor,
              numberOfDots: 4,
              fontSize: 40.0,
              dotSpacing: 2.0),
        ),
      );

  _doLogin() async {
    setState(() {
      loading = true;
    });

    final credentials = Credentials.fromJson(_formValues);

    final loginUseCase = sl<LoginUseCase>();
    final result = await loginUseCase.execute(credentials);

    if (result.data != null) {
      CubitProvider.of<SessionCubit>(context).connect(result.data);
    } else {
      setState(() {
        loading = false;
        errorCode = result.errorCode;
      });
    }
  }
}
