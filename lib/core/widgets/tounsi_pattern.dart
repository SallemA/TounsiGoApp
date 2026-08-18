import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class TounsiPattern extends StatelessWidget {
  const TounsiPattern({super.key, this.height = 64});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: CustomPaint(painter: _PatternPainter()),
    );
  }
}

class _PatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..color = AppColors.sand.withValues(alpha: 0.55);

    const step = 26.0;

    for (double y = 0; y < size.height + step; y += step) {
      for (double x = 0; x < size.width + step; x += step) {
        final center = Offset(x, y);
        final path = Path()
          ..moveTo(center.dx, center.dy - 8)
          ..lineTo(center.dx + 8, center.dy)
          ..lineTo(center.dx, center.dy + 8)
          ..lineTo(center.dx - 8, center.dy)
          ..close();

        canvas.drawPath(path, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
