import 'package:flutter/material.dart';
import '../utils/colors.dart';

class ChatBackground extends StatelessWidget {
  final Widget child;

  const ChatBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: ChatBackgroundPainter(), child: child);
  }
}

class ChatBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()..color = AppColors.chatBgColor;

    // Draw background
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      backgroundPaint,
    );

    // Draw pattern
    final Paint patternPaint =
        Paint()
          ..color = AppColors.chatPatternColor
          ..style = PaintingStyle.fill;

    final double patternSize = 20;
    final double spacing = 5;

    for (double y = 0; y < size.height; y += patternSize + spacing) {
      for (double x = 0; x < size.width; x += patternSize + spacing) {
        canvas.drawCircle(
          Offset(x + patternSize / 2, y + patternSize / 2),
          patternSize / 6,
          patternPaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
