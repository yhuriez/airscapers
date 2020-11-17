import 'package:airscaper/common/colors.dart';
import 'package:airscaper/common/constants.dart';
import 'package:airscaper/common/styles.dart';
import 'package:flutter/material.dart';

class ARSSecondaryButton extends StatelessWidget {
  final String label;
  final double height;
  final Function(BuildContext) onClick;

  const ARSSecondaryButton(
      {Key key, @required this.onClick, @required this.label, this.height = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick(context);
      },
      child: Container(
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Center(
                    child: Text(
              label,
              style: arsSecondaryButtonStyle,
            )))
          ],
        ),
      ),
    );
  }
}
