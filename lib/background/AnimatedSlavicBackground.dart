import 'dart:math';
import 'package:flutter/material.dart';

const int FIREFLY_COUNT = 200;

const List<Color> FIREFLY_COLORS = [
  Color(0xFFA8E6A3),
  Color(0xFF8BCB88),
  Color(0xFF6DBB75),
  Color(0xFF4C9E5A),
  Color(0xFF3C7F47),
  Color(0xFF2F6C3C),
  Color(0xFF1C4A2A),
  Color(0xFFCBB472),
  Color(0xFFAF9355),
];

class AnimatedForestSpirits extends StatefulWidget {
  const AnimatedForestSpirits({super.key});

  @override
  State<AnimatedForestSpirits> createState() => _AnimatedForestSpiritsState();
}

class _AnimatedForestSpiritsState extends State<AnimatedForestSpirits>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random _random = Random();
  final List<_Firefly> _fireflies = [];

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 12))
          ..repeat();

    for (int i = 0; i < FIREFLY_COUNT; i++) {
      _fireflies.add(_Firefly.random(_random));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => CustomPaint(
        size: MediaQuery.of(context).size,
        painter: _ForestPainter(
          fireflies: _fireflies,
          time: _controller.value,
        ),
      ),
    );
  }
}

class _Firefly {
  Offset basePosition;
  final double radius;
  final double speed;
  final double offset;
  final Color color;
  final int shapeType;

  _Firefly({
    required this.basePosition,
    required this.radius,
    required this.speed,
    required this.offset,
    required this.color,
    required this.shapeType,
  });

  factory _Firefly.random(Random rand) {
    return _Firefly(
      basePosition: Offset(rand.nextDouble(), rand.nextDouble()),
      radius: rand.nextDouble() * 10 + 3,
      speed: rand.nextDouble() * 0.5 + 0.2,
      offset: rand.nextDouble() * 2 * pi,
      color: FIREFLY_COLORS[rand.nextInt(FIREFLY_COLORS.length)],
      shapeType: rand.nextInt(4),
    );
  }
}

class _ForestPainter extends CustomPainter {
  final List<_Firefly> fireflies;
  final double time;

  _ForestPainter({
    required this.fireflies,
    required this.time,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Gradient tła
    final backgroundPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color.fromARGB(255, 0, 0, 0),
          const Color(0xFF0F0C0A),
          const Color(0xFF0C0908),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Offset.zero & size, backgroundPaint);

    final t = time * 2 * pi;

    for (final firefly in fireflies) {
      final dx =
          (firefly.basePosition.dx + 0.005 * sin(t + firefly.offset)) % 1.0;
      final dy =
          (firefly.basePosition.dy + 0.005 * cos(t + firefly.offset)) % 1.0;

      final position = Offset(dx * size.width, dy * size.height);
      final flicker = 0.5 + 0.5 * sin(t + firefly.offset);
      final radius = firefly.radius * (0.8 + 0.2 * flicker);

      paint.color = firefly.color.withOpacity(0.4 + 0.6 * flicker);

      final path = Path();
      switch (firefly.shapeType) {
        case 0:
          path
            ..moveTo(position.dx, position.dy)
            ..quadraticBezierTo(
              position.dx - radius * 0.6,
              position.dy - radius * 1.2,
              position.dx,
              position.dy - radius * 2,
            )
            ..quadraticBezierTo(
              position.dx + radius * 0.6,
              position.dy - radius * 1.2,
              position.dx,
              position.dy,
            )
            ..close();
          break;
        case 1:
          path
            ..moveTo(position.dx, position.dy)
            ..cubicTo(
              position.dx - radius * 0.4,
              position.dy - radius * 1.0,
              position.dx + radius * 0.6,
              position.dy - radius * 2.0,
              position.dx,
              position.dy - radius * 2.2,
            )
            ..quadraticBezierTo(
              position.dx + radius * 0.4,
              position.dy - radius * 1.0,
              position.dx,
              position.dy,
            )
            ..close();
          break;
        case 2:
          path
            ..moveTo(position.dx, position.dy)
            ..cubicTo(
              position.dx - radius * 0.5,
              position.dy - radius * 1.2,
              position.dx + radius * 0.5,
              position.dy - radius * 1.6,
              position.dx,
              position.dy - radius * 2.4,
            )
            ..quadraticBezierTo(
              position.dx,
              position.dy - radius * 1.0,
              position.dx,
              position.dy,
            )
            ..close();
          break;
        default:
          path
            ..moveTo(position.dx, position.dy)
            ..cubicTo(
              position.dx - radius * 0.6,
              position.dy - radius * 1.4,
              position.dx + radius * 0.6,
              position.dy - radius * 1.4,
              position.dx,
              position.dy - radius * 2.5,
            )
            ..quadraticBezierTo(
              position.dx + radius * 0.6,
              position.dy - radius * 1.4,
              position.dx,
              position.dy,
            )
            ..close();
      }

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
