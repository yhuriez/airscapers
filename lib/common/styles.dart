import 'package:airscaper/common/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

const arsFieldLabelTextStyle = TextStyle(color: arsTextColor, fontSize: 24.0);

final arsFieldContentTextStyle = TextStyle(color: arsTextColor, fontSize: 16.0);

final arsSecondaryButtonStyle =
    TextStyle(color: arsAccentColor, fontSize: 24.0);

final arsFieldBorder = OutlineInputBorder(
    borderSide: BorderSide(color: arsBorderColor),
    borderRadius: BorderRadius.circular(defaultRadius));

final arsFieldErrorBorder = OutlineInputBorder(
    borderSide: BorderSide(color: arsErrorColor),
    borderRadius: BorderRadius.circular(defaultRadius));
