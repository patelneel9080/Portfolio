
import 'package:flutter/material.dart';

import 'const.dart';

class StatItem extends StatefulWidget {
  final String initialValue;
  final String label;

  const StatItem({
    Key? key,
    required this.initialValue,
    required this.label,
  }) : super(key: key);

  @override
  _StatItemState createState() => _StatItemState();
}

class _StatItemState extends State<StatItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0,
      end: double.parse(widget.initialValue),
    ).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Column(
          children: [
            Text(
              '${_animation.value.toInt()}+',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: themecolor),
            ),
            Text(widget.label,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white54)),
          ],
        );
      },
    );
  }
}