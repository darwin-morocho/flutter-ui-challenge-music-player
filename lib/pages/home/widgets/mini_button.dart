import 'package:flutter/material.dart';

class MiniButton extends StatelessWidget {
  const MiniButton({
    Key? key,
    required Animation<double> animation,
    required this.child,
    required this.padding,
  })   : _animation = animation,
        super(key: key);

  final Animation<double> _animation;
  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 200),
      child: _animation.value < 0.3
          ? Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              padding: this.padding,
              child: child,
            )
          : Container(),
    );
  }
}
