import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Glassmorphism extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  const Glassmorphism({
    super.key,
    required this.width,
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: screenWidth * width,
          height: screenHeight * height,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2)
          ),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
