import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:examplearch/core/res/colors.dart';

class AnimatedCircularButton extends StatefulWidget {
  final double size;
  final VoidCallback onComplete;
  const AnimatedCircularButton({required this.size, required this.onComplete});
  @override
  _AnimatedCircularButtonState createState() => _AnimatedCircularButtonState();
}

class _AnimatedCircularButtonState extends State<AnimatedCircularButton>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fillAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: Curves.easeInOut,
      ),
    );

    _fillAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    _scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed && _isPressed) {
        // Do something when animation completes on long press
        widget.onComplete.call();
      }
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _scaleController.forward();
    setState(() {
      _isPressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    _scaleController.reverse();
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: () {
        _scaleController.reverse();
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Container(
            width: widget.size * _scaleAnimation.value,
            height: widget.size * _scaleAnimation.value,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.vividOrange,
                width: 2.r,
              ),
              color: _isPressed
                  ? AppColors.vividOrange.withOpacity(_fillAnimation.value)
                  : AppColors.backgroundColor,
            ),
            child: Center(
              child: Container(
                height: widget.size / 2,
                width: widget.size / 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.vividOrange,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
