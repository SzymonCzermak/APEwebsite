import 'dart:math';
import 'package:flutter/material.dart';

const int ELEMENT_COUNT = 100;
const double FLY_SPEED = 20 * pi;

class AnimatedEducationalBackground extends StatefulWidget {
  const AnimatedEducationalBackground({super.key});

  @override
  State<AnimatedEducationalBackground> createState() =>
      _AnimatedEducationalBackgroundState();
}

class _AnimatedEducationalBackgroundState extends State<AnimatedEducationalBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random _random = Random();
  final List<_Element> _elements = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 120),
      vsync: this,
    )..repeat();

    for (int i = 0; i < ELEMENT_COUNT; i++) {
      _elements.add(_Element(
        offset: Offset(_random.nextDouble(), _random.nextDouble()),
        size: _random.nextDouble() * 1.5 + 1.0,
        opacityPhase: _random.nextDouble() * 2 * pi,
        type: _random.nextBool() ? ElementType.butterfly : ElementType.leaf,
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
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) => CustomPaint(
          size: MediaQuery.of(context).size,
          painter: _EducationalPainter(
            animationValue: _controller.value,
            elements: _elements,
          ),
        ),
      ),
    );
  }
}

enum ElementType { butterfly, leaf }

class _Element {
  final Offset offset;
  final double size;
  final double opacityPhase;
  final ElementType type;

  _Element({
    required this.offset,
    required this.size,
    required this.opacityPhase,
    required this.type,
  });
}

class _EducationalPainter extends CustomPainter {
  final double animationValue;
  final List<_Element> elements;

  _EducationalPainter({
    required this.animationValue,
    required this.elements,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Gradientowe tło w stylu edukacyjnym (zielonkawo-fioletowe)
    final bgGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    const Color(0xFF000000),      // czarny u góry
    const Color.fromARGB(151, 55, 0, 53),       // ciemny granat
    const Color.fromARGB(134, 0, 14, 137),       // fiolet
    const Color.fromARGB(103, 92, 37, 141),       // mocniejszy fiolet
    const Color.fromARGB(255, 0, 0, 0),       // mięta
  ],
  stops: const [0.0, 0.2, 0.5, 0.8, 1.0],
);


    final backgroundPaint = Paint()
      ..shader = bgGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Offset.zero & size, backgroundPaint);

    final t = animationValue * 2 * pi;

    for (final element in elements) {
      final dx = element.offset.dx * size.width;
      final dy = (element.offset.dy * size.height + animationValue * size.height) % size.height;

      final flicker = 0.5 + 0.5 * sin(t * FLY_SPEED + element.opacityPhase);
      final radius = element.size * 6.0;

      final paint = Paint()
        ..color = (element.type == ElementType.butterfly
                ? const Color.fromARGB(140, 118, 69, 0)
                : const Color.fromARGB(164, 118, 112, 0))
            .withOpacity(0.3 + 0.6 * flicker);

      final center = Offset(dx, dy);
      final path = Path();

      if (element.type == ElementType.butterfly) {
        path
          ..moveTo(center.dx, center.dy)
          ..quadraticBezierTo(center.dx - radius, center.dy - radius * 1.5,
              center.dx, center.dy - radius * 2)
          ..quadraticBezierTo(center.dx + radius, center.dy - radius * 1.5,
              center.dx, center.dy)
          ..close();
      } else {
        path.addOval(Rect.fromCircle(center: center, radius: radius / 2));
      }

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
