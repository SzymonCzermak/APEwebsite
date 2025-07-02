import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:apewebsite/language_controller.dart';

class TourStep1 extends StatefulWidget {
  final VoidCallback onNext;

  const TourStep1({super.key, required this.onNext});

  @override
  State<TourStep1> createState() => _TourStep1State();
}

class _TourStep1State extends State<TourStep1> with TickerProviderStateMixin {
  late final AnimationController _titleController;
  late final AnimationController _descController;
  late final AnimationController _lineController;
  late final AnimationController _buttonController;

  @override
  void initState() {
    super.initState();

    _titleController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    _descController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    _lineController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _buttonController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);

    Future.delayed(const Duration(milliseconds: 200), () async {
      await _titleController.forward();
      await _descController.forward();
      await _lineController.forward();
      await _buttonController.forward();
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _lineController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPolish = context.watch<LanguageController>().isPolish;
    final isMobile = MediaQuery.of(context).size.width < 750;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _AnimatedFadeSlide(
                animation: _titleController,
                offset: const Offset(0, 0.2),
                child: Text(
                  isPolish ? 'Witaj w Alvernia Planet Edu' : 'Welcome to Alvernia Planet Edu',
                  style: GoogleFonts.robotoSlab(
                    fontSize: isMobile ? 26 : 46,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _AnimatedFadeSlide(
                animation: _lineController,
                offset: const Offset(0, 0.1),
                child: Container(
                  height: 2,
                  width: 280,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Color(0xFFBA68C8),
                        Color.fromARGB(255, 91, 0, 107),
                        Colors.black,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _AnimatedFadeSlide(
                animation: _descController,
                offset: const Offset(0, 0.2),
                child: Text(
                  isPolish
                      ? 'Przed Tobą edukacyjna podróż po świecie filmu i iluzji.'
                      : 'An educational journey through the world of film and illusion awaits you.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: isMobile ? 16 : 20,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              _AnimatedFadeSlide(
                animation: _buttonController,
                offset: const Offset(0, 0.1),
                child: ElevatedButton(
                  onPressed: widget.onNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 91, 0, 107),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    isPolish ? 'Rozpocznij wycieczkę' : 'Start the tour',
                    style: GoogleFonts.roboto(
                      fontSize: isMobile ? 16 : 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedFadeSlide extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  final Offset offset;

  const _AnimatedFadeSlide({
    required this.child,
    required this.animation,
    required this.offset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final slideOffset = Offset(offset.dx * (1 - animation.value),
        offset.dy * (1 - animation.value));
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) => Opacity(
        opacity: animation.value,
        child: Transform.translate(
          offset: slideOffset * 50,
          child: child,
        ),
      ),
    );
  }
}
