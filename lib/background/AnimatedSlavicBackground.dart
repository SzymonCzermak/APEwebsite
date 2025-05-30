import 'dart:math';
import 'package:flutter/material.dart';

const int FIREFLY_COUNT = 500;
const double CURSOR_RADIUS = 100.0;

const List<Color> FIREFLY_COLORS = [
  Color(0xFFE1FBE0),
  Color(0xFFD9FDD3),
  Color(0xFFC5F5C1),
  Color(0xFFA8E6A3),
  Color(0xFFB6F0B4),
  Color(0xFF9FDCA4),
  Color(0xFF8BCB88),
  Color(0xFF6DBB75),
  Color(0xFF5AAA61),
  Color(0xFF4C9E5A),
  Color(0xFF3C7F47),
  Color(0xFF2F6C3C),
  Color(0xFF1C4A2A),
  Color.fromARGB(255, 0, 255, 47),
  Color.fromARGB(255, 40, 200, 60),
  Color.fromARGB(255, 60, 255, 120),
  Color(0xFF7A714C),
  Color(0xFF3F2B1F),
  Color(0xFFCBB472),
  Color(0xFFAF9355),
  Color(0xFF9C7E4F),
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
  Offset? _cursor;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
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
    return MouseRegion(
      onHover: (event) => setState(() => _cursor = event.localPosition),
      onExit: (_) => setState(() => _cursor = null),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) => CustomPaint(
          size: MediaQuery.of(context).size,
          painter: _ForestPainter(
            fireflies: _fireflies,
            time: _controller.value,
            cursor: _cursor,
          ),
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
      radius: rand.nextDouble() * 8 + 2,
      speed: rand.nextDouble() * 0.5 + 0.1,
      offset: rand.nextDouble() * 2 * pi,
      color: FIREFLY_COLORS[rand.nextInt(FIREFLY_COLORS.length)],
      shapeType: rand.nextInt(4), // 4 różne kształty liści
    );
  }
}

class _ForestPainter extends CustomPainter {
  final List<_Firefly> fireflies;
  final double time;
  final Offset? cursor;

  _ForestPainter({
    required this.fireflies,
    required this.time,
    required this.cursor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    final t = time * 2 * pi;
    Color lerpBottom(Color a, Color b, double factor) =>
        Color.lerp(a, b, (sin(t) + 1) / 2 * factor)!;

    final Color color1 =
        lerpBottom(const Color(0xFF0E0C0A), const Color(0xFF0F0C0A), 0.3);
    final Color color2 = lerpBottom(Colors.black, const Color(0xFF0C0908), 0.3);
    final Color color3 = lerpBottom(Colors.black, const Color(0xFF0A0907), 0.3);

    final backgroundPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.black, color1, color2, color3],
        stops: [0.0, 0.4, 0.75, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Offset.zero & size, backgroundPaint);

    for (final firefly in fireflies) {
      final dx = (firefly.basePosition.dx +
              0.01 * sin(time * 2 * pi + firefly.offset)) %
          1.0;
      final dy = (firefly.basePosition.dy +
              0.01 * cos(time * 2 * pi + firefly.offset)) %
          1.0;

      final position = Offset(dx * size.width, dy * size.height);
      final distance =
          cursor != null ? (position - cursor!).distance : double.infinity;
      final proximity = (1 - (distance / CURSOR_RADIUS)).clamp(0.0, 1.0);
      final flicker = 0.6 + 0.4 * sin(time * 2 * pi + firefly.offset);
      final radius = firefly.radius * (1.0 + proximity * 1.2);

      paint.shader = RadialGradient(
        center: Alignment.center,
        radius: 0.9,
        colors: [
          firefly.color.withOpacity((0.4 + proximity * 0.6) * flicker),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: position, radius: radius * 4));

      final path = Path();
      switch (firefly.shapeType) {
        case 0:
          path
            ..moveTo(position.dx, position.dy)
            ..quadraticBezierTo(
              position.dx - radius * 0.7,
              position.dy - radius * 1.2,
              position.dx,
              position.dy - radius * 2.5,
            )
            ..quadraticBezierTo(
              position.dx + radius * 0.7,
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
              position.dx - radius * 0.6,
              position.dy - radius * 1.4,
              position.dx + radius * 0.8,
              position.dy - radius * 2.8,
              position.dx,
              position.dy - radius * 3.0,
            )
            ..quadraticBezierTo(
              position.dx + radius * 0.4,
              position.dy - radius * 1.5,
              position.dx,
              position.dy,
            )
            ..close();
          break;
        case 2:
          path
            ..moveTo(position.dx, position.dy)
            ..cubicTo(
              position.dx - radius * 0.6,
              position.dy - radius * 1.2,
              position.dx + radius * 0.6,
              position.dy - radius * 1.8,
              position.dx,
              position.dy - radius * 2.8,
            )
            ..quadraticBezierTo(
              position.dx,
              position.dy - radius * 1.4,
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
              position.dy - radius * 1.5,
              position.dx + radius * 0.6,
              position.dy - radius * 1.5,
              position.dx,
              position.dy - radius * 3,
            )
            ..quadraticBezierTo(
              position.dx + radius * 0.8,
              position.dy - radius * 1.5,
              position.dx,
              position.dy,
            )
            ..close();
      }

      canvas.drawPath(path, paint);
    }

    final mistPaint = Paint()
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: 1.0,
        colors: [
          const Color(0xFF7E4B00).withOpacity(0.06),
          const Color(0x004D4100),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Offset.zero & size, mistPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
