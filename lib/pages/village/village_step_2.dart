import 'package:apewebsite/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VillageStep2 extends StatefulWidget {
  const VillageStep2({super.key});

  @override
  State<VillageStep2> createState() => _VillageStep2State();
}

class _VillageStep2State extends State<VillageStep2> with TickerProviderStateMixin {
  late final AnimationController _textController;
  late final AnimationController _imageController;

  @override
  void initState() {
    super.initState();
    _textController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _imageController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    // Start text animation, then image after slight delay
    _textController.forward().then((_) => _imageController.forward());
  }

  @override
  void dispose() {
    _textController.dispose();
    _imageController.dispose();
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
          constraints: const BoxConstraints(maxWidth: 1500),
          child: AspectRatio(
            aspectRatio: isMobile ? 3 / 4 : 16 / 9,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(24),
              ),
              child: isMobile
                  ? Column(
                      children: [
                        _AnimatedSlideFade(
                          animation: _textController,
                          child: _buildText(titleFontSize, bodyFontSize, isPolish),
                        ),
                        const SizedBox(height: 24),
                        _AnimatedSlideFade(
                          animation: _imageController,
                          beginOffset: const Offset(0, 0.15),
                          child: _buildImage(isMobile: isMobile),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: _AnimatedSlideFade(
                              animation: _textController,
                              child: _buildText(titleFontSize, bodyFontSize, isPolish),
                            ),
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
        Text(
          isPolish ? 'Czym jest Alverdorf?' : 'What is Alverdorf?',
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          style: GoogleFonts.imFellEnglishSc(
            fontSize: titleSize,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            shadows: const [
              Shadow(
                blurRadius: 6,
                color: Colors.black87,
                offset: Offset(0, 2),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          isPolish
              ? '''Gdzieś na skraju rzeczywistości i baśni, w sercu pradawnej puszczy, istnieje miejsce utkane z opowieści – Alverdorf. To nie jest zwykła wioska, lecz przestrzeń, gdzie historia ożywa, a każdy, kto tu przybywa, staje się jej częścią.'''
              : '''Somewhere on the edge of reality and fairy tales, deep in an ancient forest, lies a place woven from stories – Alverdorf. It is not just a village, but a realm where history comes to life and everyone who enters becomes part of it.''',
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
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
        final double opacity = animation.value;
        final offset = Offset(
          beginOffset.dx * (1 - animation.value),
          beginOffset.dy * (1 - animation.value),
        );
        return Opacity(
          opacity: opacity,
          child: Transform.translate(
            offset: offset * 60, // delikatny przesuw na start
            child: child,
          ),
        );
      },
    );
  }
}
