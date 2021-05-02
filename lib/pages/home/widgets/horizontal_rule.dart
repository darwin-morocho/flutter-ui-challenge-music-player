import 'package:flutter/material.dart';

class HorizontalRule extends StatelessWidget {
  const HorizontalRule({
    Key? key,
    required this.animationValue,
  }) : super(key: key);

  final double animationValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3 * animationValue,
      margin: EdgeInsets.only(
        top: 10 * animationValue,
        bottom: 20 * animationValue,
      ),
      width: 40,
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
