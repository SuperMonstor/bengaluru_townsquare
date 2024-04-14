import 'package:flutter/material.dart';

class LoadingIndicatorPainter extends CustomPainter {
  final Animation<double> rotation;

  LoadingIndicatorPainter(this.rotation) : super(repaint: rotation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    final radius = size.width / 2;
    final rect =
        Rect.fromCircle(center: Offset(radius, radius), radius: radius - 10.0);
    canvas.save();
    canvas.translate(radius, radius);
    canvas.rotate(2 * 3.1415 * rotation.value);
    canvas.translate(-radius, -radius);

    canvas.drawArc(rect, 0, 1.5 * 3.1415, false, paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
