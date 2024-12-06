import 'package:flutter/material.dart';
import 'dart:math' show sin, pi;

class GameCard extends StatefulWidget {
  final String text;
  final bool isSelected;
  final bool isIncorrect;
  final bool isShaking;
  final VoidCallback onTap;

  const GameCard({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.isIncorrect = false,
    this.isShaking = false,
  }) : super(key: key);

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _shakeAnimation = Tween<double>(begin: 0.0, end: 10.0)
        .chain(CurveTween(curve: ShakeCurve()))
        .animate(_controller);
  }

  @override
  void didUpdateWidget(GameCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    bool shouldShake = widget.isShaking && widget.isIncorrect;
    bool wasShaking = oldWidget.isShaking && oldWidget.isIncorrect;

    if (shouldShake && !wasShaking) {
      _controller.repeat(reverse: true);
    } else if (!shouldShake && wasShaking) {
      _controller.stop();
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool shouldShake = widget.isShaking && widget.isIncorrect;

    return AnimatedBuilder(
      animation: _shakeAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(shouldShake ? _shakeAnimation.value : 0, 0),
          child: child,
        );
      },
      child: Card(
        color: widget.isSelected ? Colors.blue[100] : null,
        child: InkWell(
          onTap: widget.onTap,
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

class ShakeCurve extends Curve {
  @override
  double transform(double t) {
    return sin(t * pi * 8);
  }
}
