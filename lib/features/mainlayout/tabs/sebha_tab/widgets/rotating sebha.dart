import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:islami20/core/colors_manager.dart';

class RotatingSebha extends StatelessWidget {
  final int rotationTicks;
  final String dhikrText;
  final int count;

  const RotatingSebha({
    super.key,
    required this.rotationTicks,
    required this.dhikrText,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final double turns = rotationTicks / 33;

    return SizedBox(
      width: 260,
      height: 260,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedRotation(
            turns: turns,
            duration: const Duration(milliseconds: 200),
            child: CustomPaint(
              size: const Size(240, 240),
              painter: BeadsCirclePainter(),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: 24,
              height: 40,
              decoration: BoxDecoration(
                color: ColorsManager.gold ,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                dhikrText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: ColorsManager.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '$count',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: ColorsManager.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BeadsCirclePainter extends CustomPainter {
  static const int beadCount = 33;

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final Paint beadPaint = Paint()..color = ColorsManager.gold;
    final double beadRadius = 10;

    for (int i = 0; i < beadCount; i = i + 1) {
      final double angle = (2 * math.pi / beadCount) * i;
      final double dx = center.dx + radius * 0.85 * math.cos(angle);
      final double dy = center.dy + radius * 0.85 * math.sin(angle);
      canvas.drawCircle(Offset(dx, dy), beadRadius, beadPaint);
    }
  }

  @override
  bool shouldRepaint(covariant BeadsCirclePainter oldDelegate) => false;
}