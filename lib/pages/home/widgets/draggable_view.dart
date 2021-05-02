import 'package:challenge/models/item.dart';
import 'package:challenge/pages/home/widgets/toggle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'horizontal_rule.dart';
import 'mini_button.dart';

class DraggableView extends StatefulWidget {
  final Size size;
  final Item activeItem;

  const DraggableView({
    Key? key,
    required this.size,
    required this.activeItem,
  }) : super(key: key);
  @override
  _DraggableViewState createState() => _DraggableViewState();
}

class _DraggableViewState extends State<DraggableView> with SingleTickerProviderStateMixin {
  bool _collapsed = false;
  late AnimationController _controller;
  late Animation<double> _animation;
  final GlobalKey _globalKey = GlobalKey();

  Size? _defaultDimentions;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final box = _globalKey.currentContext!.findRenderObject() as RenderBox;
      _defaultDimentions = box.size;
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _collapsed = true;
      } else if (status == AnimationStatus.dismissed) {
        _collapsed = false;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double? get width {
    if (_defaultDimentions == null) return null;
    final diff = widget.size.width - _defaultDimentions!.width;
    return _defaultDimentions!.width + diff * _animation.value - 20 * _animation.value;
  }

  double? get height {
    if (_defaultDimentions == null) return null;
    return widget.size.height * 0.4 * _animation.value + _defaultDimentions!.height;
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    final maxHeight = widget.size.height * 0.4 + _defaultDimentions!.height;
    final double value = details.delta.dy / maxHeight;
    _controller.value -= value;
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (_controller.value < 0.5) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  void _toggle() {
    if (!_collapsed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: _onVerticalDragUpdate,
      onVerticalDragEnd: _onVerticalDragEnd,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, child) {
          return Container(
            key: _globalKey,
            height: height,
            width: width,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xff4C65F6),
              image: DecorationImage(
                image: AssetImage(widget.activeItem.bg),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Color(0xff4C65F6).withOpacity(0.2),
                  BlendMode.dstATop,
                ),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                HorizontalRule(
                  animationValue: _animation.value,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MiniButton(
                      animation: _animation,
                      child: Icon(
                        Icons.replay_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      padding: EdgeInsets.only(right: 20),
                    ),
                    ToggleButton(
                      animationValue: _animation.value,
                      onPressed: _toggle,
                      activeItem: widget.activeItem,
                    ),
                    MiniButton(
                      animation: _animation,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(
                          widget.activeItem.avatar,
                        ),
                      ),
                      padding: EdgeInsets.only(left: 20),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
