import 'package:apewebsite/navigation_hint_overlay.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:apewebsite/language_controller.dart';

class VillageStep1 extends StatefulWidget {
  final VoidCallback onNext;

  const VillageStep1({super.key, required this.onNext});

  @override
  State<VillageStep1> createState() => _VillageStep1State();
}

class _VillageStep1State extends State<VillageStep1>
    with TickerProviderStateMixin {
  late final AnimationController _word1Controller;
  late final AnimationController _word2Controller;
  late final AnimationController _word3Controller;
  late final AnimationController _titleController;
  late final AnimationController _descController;
  late final AnimationController _lineController;
  late final AnimationController _buttonController;
  late final AnimationController _logoQEventsController;

  @override
  void initState() {
    super.initState();

    _word1Controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _word2Controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _word3Controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _titleController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _descController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _lineController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _buttonController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _logoQEventsController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));

    Future.delayed(const Duration(milliseconds: 200), () {
      _word1Controller.forward();
      Future.delayed(const Duration(milliseconds: 500), () {
        _word2Controller.forward();
        Future.delayed(const Duration(milliseconds: 500), () {
          _word3Controller.forward();
          Future.delayed(const Duration(milliseconds: 800), () {
            _titleController.forward();
            Future.delayed(const Duration(milliseconds: 600), () {
              _descController.forward();
              _lineController.forward();
              Future.delayed(const Duration(milliseconds: 500), () {
                _buttonController.forward();
                _logoQEventsController.forward();
              });
            });
          });
        });
      });
    });
  }

  @override
  void dispose() {
    _word1Controller.dispose();
    _word2Controller.dispose();
    _word3Controller.dispose();
    _titleController.dispose();
    _descController.dispose();
    _lineController.dispose();
    _buttonController.dispose();
    _logoQEventsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 750;
    final isPolish = context.watch<LanguageController>().isPolish;

    final titleFontSize = isMobile ? 26.0 : 46.0;
    final bodyFontSize = isMobile ? 15.0 : 21.0;

    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1500),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _AnimatedFadeSlide(
                          animation: _word1Controller,
                          offset: const Offset(0, 0.2),
                          child: Text(
                            isPolish ? 'Dawno,' : 'Long,',
                            style: GoogleFonts.imFellEnglishSc(
                              fontSize: isMobile ? 20 : 28,
                              color: Colors.white70,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        _AnimatedFadeSlide(
                          animation: _word2Controller,
                          offset: const Offset(0, 0.2),
                          child: Text(
                            isPolish ? 'dawno,' : 'long,',
                            style: GoogleFonts.imFellEnglishSc(
                              fontSize: isMobile ? 20 : 28,
                              color: Colors.white70,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        _AnimatedFadeSlide(
                          animation: _word3Controller,
                          offset: const Offset(0, 0.2),
                          child: Text(
                            isPolish ? 'dawno temu...' : 'long ago...',
                            style: GoogleFonts.imFellEnglishSc(
                              fontSize: isMobile ? 20 : 28,
                              color: Colors.white70,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    _AnimatedFadeSlide(
                      animation: _titleController,
                      offset: const Offset(0, 0.2),
                      child: Column(
                        children: [
                          Text(
                            isPolish ? 'Witaj w' : 'Welcome to',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.imFellEnglishSc(
                              fontSize: titleFontSize,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            'assets/logos/logo_alverdorf.png',
                            height: isMobile ? 100 : 200,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    _AnimatedFadeSlide(
                      animation: _lineController,
                      offset: const Offset(0, 0.1),
                      child: Container(
                        height: 2,
                        width: 300,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black,
                              Color(0xFF8BC34A),
                              Color.fromARGB(255, 128, 94, 0),
                              Colors.black,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    _AnimatedFadeSlide(
                      animation: _descController,
                      offset: const Offset(0, 0.25),
                      child: Text(
                        isPolish
                            ? 'Przed Tobą niezwykła podróż w świat magii i opowieści.'
                            : 'An extraordinary journey into a world of magic and stories awaits you.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.imFellEnglishSc(
                          fontSize: bodyFontSize,
                          color: Colors.white,
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    _AnimatedFadeSlide(
                      animation: _buttonController,
                      offset: const Offset(0, 0.1),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 128, 94, 0).withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(2, 4),
                            ),
                          ],
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextButton(
                          onPressed: widget.onNext,
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                            backgroundColor: const Color.fromARGB(255, 128, 94, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            isPolish ? 'Rozpocznij przygodę' : 'Start the journey',
                            style: GoogleFonts.imFellEnglishSc(
                              fontSize: bodyFontSize,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    _AnimatedFadeSlide(
                      animation: _logoQEventsController,
                      offset: const Offset(0, 0.1),
                      child: Opacity(
                        opacity: 0.7,
                        child: Image.asset(
                          'assets/logos/logo_qevents.png',
                          height: isMobile ? 75 : 125,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
        const NavigationHintOverlay(),
      ],
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
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final currentOffset = Offset(
          offset.dx * (1 - animation.value),
          offset.dy * (1 - animation.value),
        );
        return Opacity(
          opacity: animation.value,
          child: Transform.translate(
            offset: currentOffset * 60,
            child: child,
          ),
        );
      },
    );
  }
}
