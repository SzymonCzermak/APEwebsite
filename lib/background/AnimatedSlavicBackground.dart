import 'dart:math';
import 'package:flutter/material.dart';

const int FLAME_COUNT = 350;
const double FLAME_SPEED = 0.4;
const double CURSOR_RADIUS = 120.0;
const List<Color> FLAME_COLORS = [
  Color(0xFFFFD700), // złoty
  Color(0xFFFF8C00), // ciemnopomarańczowy
  Color(0xFFB22222), // ceglasty czerwony
];

class AnimatedSlavicBackground extends StatefulWidget {
  const AnimatedSlavicBackground({super.key});

  @override
  State<AnimatedSlavicBackground> createState() => _AnimatedSlavicBackgroundState();
}

class _AnimatedSlavicBackgroundState extends State<AnimatedSlavicBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random _random = Random();
  final List<_FlameParticle> _flames = [];
  Offset? _cursorPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    for (int i = 0; i < FLAME_COUNT; i++) {
      _flames.add(_FlameParticle.random(_random));
    }
  }

  void _addBurst(Offset position) {
    for (int i = 0; i < 10; i++) {
      _flames.add(_FlameParticle.burst(position, _random));
    }
    if (_flames.length > FLAME_COUNT + 30) {
      _flames.removeRange(0, 10);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => setState(() => _addBurst(details.localPosition)),
      child: MouseRegion(
        onHover: (event) => setState(() => _cursorPosition = event.localPosition),
        onExit: (_) => setState(() => _cursorPosition = null),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) => CustomPaint(
            size: MediaQuery.of(context).size,
            painter: _SlavicPainter(
              flames: _flames,
              time: _controller.value,
              cursor: _cursorPosition,
            ),
          ),
        ),
      ),
    );
  }
}

class _FlameParticle {
  Offset position;
  final double size;
  final double flickerOffset;
  final double speed;
  final Color color;

  _FlameParticle({
    required this.position,
    required this.size,
    required this.flickerOffset,
    required this.speed,
    required this.color,
  });

  factory _FlameParticle.random(Random rand) {
    return _FlameParticle(
      position: Offset(rand.nextDouble(), rand.nextDouble()),
      size: rand.nextDouble() * 2 + 2,
      flickerOffset: rand.nextDouble() * 2 * pi,
      speed: rand.nextDouble() * 0.5 + 0.3,
      color: FLAME_COLORS[rand.nextInt(FLAME_COLORS.length)],
    );
  }

  factory _FlameParticle.burst(Offset pos, Random rand) {
    return _FlameParticle(
      position: pos,
      size: rand.nextDouble() * 3 + 2,
      flickerOffset: rand.nextDouble() * 2 * pi,
      speed: rand.nextDouble() * 1.0 + 0.5,
      color: FLAME_COLORS[rand.nextInt(FLAME_COLORS.length)],
    );
  }
}

class _SlavicPainter extends CustomPainter {
  final List<_FlameParticle> flames;
  final double time;
  final Offset? cursor;

  _SlavicPainter({
    required this.flames,
    required this.time,
    required this.cursor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    final backgroundPaint = Paint()
  ..shader = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.black,
      const Color.fromARGB(255, 0, 0, 0),
      const Color.fromARGB(255, 0, 0, 0),
      const Color.fromARGB(255, 54, 41, 0),
    ],
  ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

canvas.drawRect(Offset.zero & size, backgroundPaint);


    for (final flame in flames) {
      final dx = (flame.position.dx + 0.02 * sin(time * 2 * pi + flame.flickerOffset)) % 1.0;
      final dy = (flame.position.dy - time * flame.speed * FLAME_SPEED) % 1.0;

      final screenPos = Offset(dx * size.width, dy * size.height);

      double distance = cursor != null ? (screenPos - cursor!).distance : double.infinity;
      bool isNearCursor = distance < CURSOR_RADIUS;

      final proximity = (1 - (distance / CURSOR_RADIUS)).clamp(0.0, 1.0);
      final radius = flame.size * (1.0 + proximity * 1.5);
      final flicker = 0.5 + 0.5 * sin(time * 2 * pi + flame.flickerOffset);

      paint.shader = RadialGradient(
        center: Alignment.center,
        radius: 0.6,
        colors: [
          flame.color.withOpacity((isNearCursor ? 0.9 : 0.6) * flicker),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: screenPos, radius: radius * 2));

      canvas.drawOval(
        Rect.fromCenter(center: screenPos, width: radius * 1.4, height: radius * 2),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
