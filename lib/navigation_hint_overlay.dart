import 'package:flutter/material.dart';

class NavigationHintOverlay extends StatefulWidget {
  const NavigationHintOverlay({super.key});

  @override
  State<NavigationHintOverlay> createState() => _NavigationHintOverlayState();
}

class _NavigationHintOverlayState extends State<NavigationHintOverlay>
    with TickerProviderStateMixin {
  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;

  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  late final AnimationController _arrowSpreadController;
  late final Animation<double> _arrowOffsetAnimation;

  bool _visible = false;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _pulseAnimation = Tween<double>(begin: 0.98, end: 1.03).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _arrowSpreadController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _arrowOffsetAnimation = Tween<double>(begin: 0, end: 8).animate(
      CurvedAnimation(parent: _arrowSpreadController, curve: Curves.easeInOut),
    );

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeOut),
    );

    // Startuj dopiero po 2 sekundach
    Future.delayed(const Duration(seconds: 10), () {
      if (!mounted) return;
      setState(() => _visible = true);
      _pulseController.repeat(reverse: true);
      _arrowSpreadController.repeat(reverse: true);

      Future.delayed(const Duration(milliseconds: 5000), () {
        if (!mounted) return;
        _pulseController.stop();
        _arrowSpreadController.stop();
        _fadeController.forward().then((_) {
          if (mounted) setState(() => _visible = false);
        });
      });
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _fadeController.dispose();
    _arrowSpreadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_visible) return const SizedBox.shrink();

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Stack(
        children: [
          Opacity(
            opacity: 0.2,
            child: Container(color: Colors.black),
          ),
          Center(
            child: ScaleTransition(
              scale: _pulseAnimation,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: AnimatedBuilder(
                  animation: _arrowOffsetAnimation,
                  builder: (context, _) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Transform.translate(
                          offset: Offset(0, -_arrowOffsetAnimation.value),
                          child: const Icon(Icons.keyboard_arrow_up,
                              size: 26, color: Colors.white70),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Scrolluj lub przeciągnij\nw górę/w dół',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                        const SizedBox(height: 4),
                        Transform.translate(
                          offset: Offset(0, _arrowOffsetAnimation.value),
                          child: const Icon(Icons.keyboard_arrow_down,
                              size: 26, color: Colors.white70),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
