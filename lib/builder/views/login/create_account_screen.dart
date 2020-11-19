

import 'package:airscaper/builder/domain/blocs/session_cubit.dart';
import 'package:airscaper/builder/domain/usecases/login_use_cases.dart';
import 'package:airscaper/builder/model/account.dart';
import 'package:airscaper/builder/views/common/ars_form_field.dart';
import 'package:airscaper/builder/views/common/ars_primary_button.dart';
import 'package:airscaper/builder/views/common/ars_secondary_button.dart';
import 'package:airscaper/builder/views/common/ars_shadow_box.dart';
import 'package:airscaper/common/colors.dart';
import 'package:airscaper/common/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:airscaper/common/extensions.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

import 'package:progress_indicators/progress_indicators.dart';

import '../../injection.dart';

class CreateAccountScreen extends StatelessWidget {

  static const screenName = "/create";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: arsBackgroundColor,
          child: Center(
            child: SizedBox(
              width: 700,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 60.0, horizontal: 30.0),
                    child: ARSShadowBox.darkBox(
                        color: arsContainerColor, child: CreateAccountForm()),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class CreateAccountForm extends StatefulWidget {
  @override
  _CreateAccountFormState createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {

  final _formKey = GlobalKey<FormState>();
  final _formValues = Map<String, dynamic>();
  final _passwordController = TextEditingController();

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

              // NAME
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: _nameField,
              ),

              // EMAIL
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: _emailField,
              ),

              // PASSWORD
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: _passwordField,
              ),

              // CONFIRM PASSWORD
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: _confirmPasswordField,
              ),

              // SIGN IN
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: (loading) ? _loadingButton : _signInButton,
              ),

              // CREATE ACCOUNT
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: _alreadyAccountButton,
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

  Widget get _nameField => ARSFormField(
    label: context.translate("builder.login.name"),
    values: _formValues,
    valueKey: Account.EMAIL_KEY,
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

  Widget get _emailField => ARSFormField(
    label: context.translate("builder.login.email"),
    values: _formValues,
    valueKey: Account.EMAIL_KEY,
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
    controller: _passwordController,
    label: context.translate("builder.login.password"),
    values: _formValues,
    valueKey: Account.PASSWORD_KEY,
    obscureText: true,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return context.translate("builder.login.password_empty_error");
      }
      return null;
    },
  );

  Widget get _confirmPasswordField => ARSFormField(
    label: context.translate("builder.login.confirm_password"),
    values: _formValues,
    valueKey: Account.PASSWORD_KEY,
    obscureText: true,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return context.translate("builder.login.password_empty_error");
      }
      if(value != _passwordController.text) {
        return context.translate("builder.login.password_not_matching_error");
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
            _doCreateAccount();
          }
        },
        label: context.translate("builder.login.create_account")),
  );

  Widget get _alreadyAccountButton => SizedBox(
    width: 400,
    child: ARSSecondaryButton(
        onClick: (context) {
          print(_formValues);
        },
        label: context.translate("builder.login.already_have_account")),
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

  _doCreateAccount() async {
    setState(() {
      loading = true;
    });

    final account = Account.fromJson(_formValues);

    final createAccountUseCase = sl<CreateAccountUseCase>();
    final result = await createAccountUseCase.execute(account);

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