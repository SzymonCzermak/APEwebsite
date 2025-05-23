import 'dart:math';
import 'package:flutter/material.dart';

const double TWINKLE_SPEED = 40 * pi;
const int STAR_COUNT = 300;
const double HIGHLIGHT_RADIUS = 100.0;
const Color HIGHLIGHT_COLOR = Color.fromARGB(255, 186, 85, 211); // fiolet

class AnimatedStarsBackground extends StatefulWidget {
  const AnimatedStarsBackground({super.key});

  @override
  State<AnimatedStarsBackground> createState() =>
      _AnimatedStarsBackgroundState();
}

class _AnimatedStarsBackgroundState extends State<AnimatedStarsBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random _random = Random();
  final List<_Star> _stars = [];
  Offset? _cursorPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
    )..repeat();

    for (int i = 0; i < STAR_COUNT; i++) {
      _stars.add(_Star(
        offset: Offset(_random.nextDouble(), _random.nextDouble()),
        size: _random.nextDouble() * 1.5 + 0.5,
        opacityPhase: _random.nextDouble() * 2 * pi,
      ));
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
      onHover: (event) {
        setState(() {
          _cursorPosition = event.localPosition;
        });
      },
      onExit: (_) => setState(() {
        _cursorPosition = null;
      }),
      child: RepaintBoundary(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) => CustomPaint(
            size: MediaQuery.of(context).size,
            painter: _StarPainter(
              animationValue: _controller.value,
              stars: _stars,
              cursorPosition: _cursorPosition,
            ),
          ),
        ),
      ),
    );
  }
}

class _Star {
  final Offset offset;
  final double size;
  final double opacityPhase;

  _Star({
    required this.offset,
    required this.size,
    required this.opacityPhase,
  });
}

class _StarPainter extends CustomPainter {
  final double animationValue;
  final List<_Star> stars;
  final Offset? cursorPosition;

  _StarPainter({
    required this.animationValue,
    required this.stars,
    required this.cursorPosition,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = Colors.black,
    );

    for (final star in stars) {
      final dx = star.offset.dx * size.width;
      final dy = (star.offset.dy * size.height + animationValue * size.height) %
          size.height;

      final flicker =
          0.5 + 0.5 * sin(animationValue * TWINKLE_SPEED + star.opacityPhase);
      final radius = star.size * 2;

      bool isNearCursor = cursorPosition != null &&
          (Offset(dx, dy) - cursorPosition!).distance <= HIGHLIGHT_RADIUS;

      final gradient = RadialGradient(
        colors: isNearCursor
            ? [
                HIGHLIGHT_COLOR.withOpacity(flicker.clamp(0.0, 1.0)),
                HIGHLIGHT_COLOR.withOpacity(0),
              ]
            : [
                Colors.white.withOpacity(flicker.clamp(0.0, 1.0)),
                Colors.white.withOpacity(0),
              ],
      );

      final rect = Rect.fromCircle(center: Offset(dx, dy), radius: radius);
      final paint = Paint()..shader = gradient.createShader(rect);

      canvas.drawCircle(Offset(dx, dy), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
