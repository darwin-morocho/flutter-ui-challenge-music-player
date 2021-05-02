import 'package:challenge/models/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DraggableExpandedViewContent extends StatelessWidget {
  const DraggableExpandedViewContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        SizedBox(height: 30),
        Transform.rotate(
          angle: -90 * math.pi / 180,
          child: Icon(
            Icons.horizontal_rule_rounded,
            color: Colors.white60,
            size: 50,
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            CupertinoButton(
              child: Icon(
                Icons.skip_previous_rounded,
                color: Colors.white60,
                size: 50,
              ),
              onPressed: () {},
            ),
            CupertinoButton(
              child: Icon(
                Icons.play_arrow_rounded,
                color: Colors.white60,
                size: 50,
              ),
              onPressed: () {},
            ),
            CupertinoButton(
              child: Icon(
                Icons.skip_next_rounded,
                color: Colors.white60,
                size: 50,
              ),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
