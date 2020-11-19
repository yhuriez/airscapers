import 'package:airscaper/common/colors.dart';
import 'package:airscaper/common/constants.dart';
import 'package:airscaper/common/styles.dart';
import 'package:flutter/material.dart';

class ARSPrimaryButton extends StatelessWidget {
  final String label;
  final Widget child;
  final double height;
  final Function(BuildContext) onClick;

  const ARSPrimaryButton(
      {Key key,
      @required this.onClick,
      this.label,
      this.child,
      this.height = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick(context);
      },
      child: Container(
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
            color: arsAccentColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child:
                    Center(child: child ?? Text(label, style: arsFieldLabelTextStyle)))
          ],
        ),
      ),
    );
  }
}
