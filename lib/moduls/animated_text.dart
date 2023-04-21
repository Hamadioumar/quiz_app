import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  final String text;

  AnimatedText({required this.text});

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: const Duration(seconds: 8), vsync: this);

    _animation = Tween<Offset>(begin: const Offset(2, 20), end: Offset.zero)
        .animate(_animationController);

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Align(
          alignment: Alignment.centerLeft,
          widthFactor: 1.0,
          child: Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: ClipRect(
              child: Text(
                widget.text,
                style: const TextStyle(fontSize: 40.0, color: Colors.white),
                textAlign: TextAlign.left,
                softWrap: true,
                overflow: TextOverflow.clip,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
