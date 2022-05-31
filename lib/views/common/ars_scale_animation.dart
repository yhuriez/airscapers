
import 'package:flutter/material.dart';

class ARSScaleAnimation extends StatefulWidget {
  final Widget child;

  const ARSScaleAnimation({Key? key, required this.child}) : super(key: key);

  @override
  _ARSScaleAnimationState createState() => _ARSScaleAnimationState();
}

class _ARSScaleAnimationState extends State<ARSScaleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1), value: 0.0);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      alignment: Alignment.center,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
