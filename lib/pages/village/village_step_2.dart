import 'package:apewebsite/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:apewebsite/styles/color.dart';
import 'package:apewebsite/models/page_type.dart';

class VillageStep2 extends StatefulWidget {
  const VillageStep2({super.key});

  @override
  State<VillageStep2> createState() => _VillageStep2State();
}

class _VillageStep2State extends State<VillageStep2>
    with TickerProviderStateMixin {
  late final AnimationController _titleController;
  late final AnimationController _descController;
  late final AnimationController _imageController;
  late final AnimationController _lineController;
  late final AnimationController _topBottomLineController;
  late final Animation<double> _lineAnimation;
  late final Animation<double> _topBottomLineAnimation;

  @override
  void initState() {
    super.initState();

    _titleController = AnimationController(
      duration: const Duration(milliseconds: 500), // szybciej
      vsync: this,
    );
    _descController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _imageController = AnimationController(
      duration: const Duration(milliseconds: 800), // wolniej
      vsync: this,
    );
    _lineController = AnimationController(
      duration: const Duration(milliseconds: 400), // szybciej
      vsync: this,
    );
    _topBottomLineController = AnimationController(
      duration: const Duration(milliseconds: 900), // wolniej
      vsync: this,
    );

    _lineAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _lineController,
      curve: Curves.easeOutCubic,
    ));

    _topBottomLineAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _topBottomLineController, curve: Curves.easeOut),
    );

    Future.delayed(const Duration(milliseconds: 300), () {
      _titleController.forward().then((_) {
        _lineController.forward().then((_) {
          Future.delayed(const Duration(milliseconds: 200), () {
            _descController.forward().then((_) {
              Future.delayed(const Duration(milliseconds: 600), () {
                // <- większa przerwa
                _topBottomLineController.forward();
                _imageController.forward();
              });
            });
          });
        });
      });
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _imageController.dispose();
    _lineController.dispose();
    _topBottomLineController.dispose();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final isMobile = screenWidth < 750;
  final isPolish = context.watch<LanguageController>().isPolish;
  final screenHeight = MediaQuery.of(context).size.height;
  final shortestSide = screenWidth < screenHeight ? screenWidth : screenHeight;

  final titleFontSize = shortestSide.clamp(280, 800) * 0.045;
  final bodyFontSize = shortestSide.clamp(280, 800) * 0.025;

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _AnimatedLine(animation: _topBottomLineAnimation, isTop: true),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: isMobile
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildText(titleFontSize, bodyFontSize, isPolish),
                          const SizedBox(height: 24),
                          _AnimatedSlideFade(
                            animation: _imageController,
                            beginOffset: const Offset(0, 0.15),
                            child: _buildImage(isMobile: isMobile),
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 24.0),
                              child: _buildText(
                                  titleFontSize, bodyFontSize, isPolish),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: _AnimatedSlideFade(
                              animation: _imageController,
                              beginOffset: const Offset(0.15, 0),
                              child: _buildImage(isMobile: isMobile),
                            ),
                          ),
                        ],
                      ),
              ),
              _AnimatedLine(animation: _topBottomLineAnimation, isTop: false),
            ],
          ),
        ),
      ),
    ),
  );
}


  Widget _buildText(double titleSize, double bodySize, bool isPolish) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _AnimatedSlideFade(
          animation: _titleController,
          beginOffset: const Offset(0, 0.2),
          child: Column(
            children: [
              Text(
                isPolish ? 'Czym jest Alverdorf?' : 'What is Alverdorf?',
                textAlign: TextAlign.center,
                style: GoogleFonts.imFellEnglishSc(
                  fontSize: titleSize,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: const [
                    Shadow(
                      blurRadius: 6,
                      color: Colors.black,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              AnimatedBuilder(
                animation: _lineAnimation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _lineAnimation.value,
                    child: Transform.translate(
                      offset: Offset(0, 10 * (1 - _lineAnimation.value)),
                      child: Container(
                        height: 2,
                        width: 300,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFF000000), // czarny początek
                              Color(0xFF8BC34A), // zieleń
                              Color.fromARGB(255, 128, 94, 0), // brąz
                              Color(0xFF000000), // czarny koniec
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(1)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _AnimatedSlideFade(
          animation: _descController,
          beginOffset: const Offset(0, 0.25),
          child: Text(
            isPolish
                ? '''Gdzieś na skraju rzeczywistości i baśni, w sercu pradawnej puszczy, istnieje miejsce utkane z opowieści – Alverdorf. To nie jest zwykła wioska, lecz przestrzeń, gdzie historia ożywa, a każdy, kto tu przybywa, staje się jej częścią.'''
                : '''Somewhere on the edge of reality and fairy tales, deep in an ancient forest, lies a place woven from stories – Alverdorf. It is not just a village, but a realm where history comes to life and everyone who enters becomes part of it.''',
            textAlign: TextAlign.center,
            style: GoogleFonts.imFellEnglishSc(
              fontSize: bodySize,
              color: Colors.white,
              height: 1.4,
              shadows: const [
                Shadow(
                  blurRadius: 4,
                  color: Colors.black,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImage({required bool isMobile}) {
    return Center(
      child: SizedBox(
        width: isMobile ? 180 : 320,
        height: isMobile ? 280 : null,
        child: AspectRatio(
          aspectRatio: 9 / 16,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/alverdorf_page/step/1.png',
              fit: BoxFit.cover,
              filterQuality: FilterQuality.medium,
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedSlideFade extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  final Offset beginOffset;

  const _AnimatedSlideFade({
    required this.child,
    required this.animation,
    this.beginOffset = const Offset(0, 0.12),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final offset = Offset(
          beginOffset.dx * (1 - animation.value),
          beginOffset.dy * (1 - animation.value),
        );
        return Opacity(
          opacity: animation.value,
          child: Transform.translate(
            offset: offset * 60,
            child: child,
          ),
        );
      },
    );
  }
}

class _AnimatedLine extends StatelessWidget {
  final Animation<double> animation;
  final bool isTop;

  const _AnimatedLine({
    required this.animation,
    required this.isTop,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) => Opacity(
        opacity: animation.value,
        child: Transform.translate(
          offset: Offset(0, (isTop ? -1 : 1) * 20 * (1 - animation.value)),
          child: Container(
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: 1200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: isTop
                    ? [
                        const Color.fromARGB(
                            255, 0, 0, 0), // ciemniejszy zielony bok
                        const Color(0xFF5A7F2E), // ciemniejszy zielony bok
                        const Color(0xFF8BC34A), // główny zielony
                        const Color(0xFF5A7F2E), // ciemniejszy zielony bok
                        const Color.fromARGB(
                            255, 0, 0, 0), // ciemniejszy zielony bok
                      ]
                    : [
                        const Color.fromARGB(
                            255, 0, 0, 0), // ciemniejszy zielony bok

                        const Color(0xFF5E4300), // ciemniejszy brązowy bok
                        const Color(0xFF805E00), // główny brązowy
                        const Color(0xFF5E4300), // ciemniejszy brązowy bok
                        const Color.fromARGB(
                            255, 0, 0, 0), // ciemniejszy zielony bok
                      ],
              ),
              borderRadius: BorderRadius.circular(1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.9),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
