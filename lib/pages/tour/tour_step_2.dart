import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:apewebsite/language_controller.dart';

class TourStep2 extends StatefulWidget {
  final VoidCallback onNext;

  const TourStep2({super.key, required this.onNext});

  @override
  State<TourStep2> createState() => _TourStep2State();
}

class _TourStep2State extends State<TourStep2> with TickerProviderStateMixin {
  late List<AnimationController> _wordControllers;
  late AnimationController _lineController;
  late AnimationController _descController;
  late AnimationController _buttonController;

  final Duration wordDelay = const Duration(milliseconds: 200);

  List<String> getWords(bool isPolish) {
    return isPolish
        ? ['Nie', 'wszystko,', 'co', 'widzisz', 'i', 'słyszysz', 'w', 'filmie,', 'jest', 'prawdą.']
        : ['Not', 'everything', 'you', 'see', 'and', 'hear', 'in', 'a', 'movie', 'is', 'true.'];
  }

  @override
  void initState() {
    super.initState();

    final isPolish = context.read<LanguageController>().isPolish;
    final words = getWords(isPolish);

    _wordControllers = List.generate(
      words.length,
      (_) => AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
      ),
    );

    _lineController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _descController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    _buttonController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);

    _startWordAnimation();
  }

  void _startWordAnimation() async {
    for (int i = 0; i < _wordControllers.length; i++) {
      await Future.delayed(wordDelay);
      _wordControllers[i].forward();
    }
    await Future.delayed(const Duration(milliseconds: 400));
    _lineController.forward();
    await Future.delayed(const Duration(milliseconds: 400));
    _descController.forward();
    await Future.delayed(const Duration(milliseconds: 400));
    _buttonController.forward();
  }

  @override
  void dispose() {
    for (var controller in _wordControllers) {
      controller.dispose();
    }
    _lineController.dispose();
    _descController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPolish = context.watch<LanguageController>().isPolish;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 750;
    final words = getWords(isPolish);
    final mainFontSize = isMobile ? 22.0 : 36.0;
    final descFontSize = isMobile ? 14.0 : 20.0;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                children: List.generate(words.length, (i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: _AnimatedFadeSlide(
                      animation: _wordControllers[i],
                      offset: const Offset(0, 0.3),
                      child: Text(
                        words[i],
                        style: GoogleFonts.robotoSlab(
                          fontSize: mainFontSize,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
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
                      Colors.orange,
                      Colors.deepOrange,
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
                      ? 'Iluzje, efekty specjalne i montaż potrafią zmylić każdego. Poznaj kulisy tworzenia filmów.'
                      : 'Illusions, special effects, and editing can fool anyone. Discover what goes on behind the scenes.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: descFontSize,
                    color: Colors.white,
                    height: 1.5,
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
                  backgroundColor: const Color.fromARGB(255, 222, 52, 0), // ten sam pomarańcz
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 28,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 8,
                  shadowColor: Colors.black.withOpacity(0.3),
                ),
                child: Text(
                  isPolish ? 'Dalej' : 'Next',
                  style: GoogleFonts.roboto(
                    fontSize: isMobile ? 16 : 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600, // dodane dla spójności z TextButton
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
