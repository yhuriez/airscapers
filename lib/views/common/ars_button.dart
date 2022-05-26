import 'package:flutter/material.dart';

class ARSButton extends StatelessWidget {
  final Widget text;
  final double height;
  final Function(BuildContext) onClick;
  final Function(BuildContext) onLongClick;
  final String image;
  final Color backgroundColor;
  final double borderRadius;

  const ARSButton(
      {Key? key,
      required this.onClick,
      required this.text,
      this.height = 50,
      this.image = "",
      this.backgroundColor,
      this.borderRadius,
      this.onLongClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundImage = (image.isEmpty)
        ? null
        : DecorationImage(
            image: AssetImage("assets/images/$image"), fit: BoxFit.fill);

    return Card(
      elevation: 3.0,
      child: Container(
        height: height,
        decoration: BoxDecoration(
            image: backgroundImage,
            borderRadius:
                BorderRadius.all(Radius.circular(borderRadius ?? 6.0)),
            color: backgroundColor),
        child: InkWell(
          onTap: () {
            onClick(context);
          },
          onLongPress: () {
            if (onLongClick != null) {
              onLongClick(context);
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[Expanded(child: Center(child: text))],
          ),
        ),
      ),
    );
  }
}
