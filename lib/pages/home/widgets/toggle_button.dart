import 'package:challenge/models/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  final double animationValue;
  final VoidCallback onPressed;
  final Item activeItem;

  const ToggleButton({
    Key? key,
    required this.animationValue,
    required this.onPressed,
    required this.activeItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = 60 + 60 * animationValue;
    final shadowSize = size - 18 * animationValue;
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.translate(
          offset: Offset(0, size - shadowSize + animationValue),
          child: Container(
            width: shadowSize,
            height: shadowSize,
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: this.onPressed,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage(
                  this.activeItem.bg,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 100),
          transitionBuilder: (child, animation) {
            final offsetAnimation = Tween<Offset>(
              begin: Offset(0.0, 0.0),
              end: Offset(0.0, -1.0),
            ).animate(animation);
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: offsetAnimation,
                child: child,
              ),
            );
          },
          child: animationValue > 0.9
              ? Transform.translate(
                  offset: Offset(0, size + 20),
                  child: Column(
                    children: [
                      Text(
                        activeItem.title,
                        style: TextStyle(color: Colors.white54),
                      ),
                      Text(
                        activeItem.subtitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        )
      ],
    );
  }
}
