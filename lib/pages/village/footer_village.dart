import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:apewebsite/language_controller.dart';

class FooterVillage extends StatefulWidget {
  const FooterVillage({super.key});

  @override
  State<FooterVillage> createState() => _FooterVillageState();
}

class _FooterVillageState extends State<FooterVillage>
    with TickerProviderStateMixin {
  late final AnimationController _titleController;
  late final AnimationController _iframeController;
  late final AnimationController _buttonController;

  @override
  void initState() {
    super.initState();

    if (kIsWeb) {
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
        'bookero-iframe',
        (int viewId) => html.IFrameElement()
          ..src = 'https://alverniaplanet.bookero.pl/'
          ..style.border = 'none'
          ..style.width = '100%'
          ..style.height = '100%'
          ..setAttribute('scrolling', 'yes')
          ..allowFullscreen = true,
      );
    }

    _titleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _iframeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );
    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    Future.delayed(const Duration(milliseconds: 200), () {
      _titleController.forward().then((_) {
        Future.delayed(const Duration(milliseconds: 200), () {
          _iframeController.forward().then((_) {
            Future.delayed(const Duration(milliseconds: 200), () {
              _buttonController.forward();
            });
          });
        });
      });
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _iframeController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  final isPolish = context.watch<LanguageController>().isPolish;
  final screenSize = MediaQuery.of(context).size;
  final screenWidth = screenSize.width;
  final screenHeight = screenSize.height;
  final isMobile = screenWidth < 600;

  final double contentMaxWidth = screenWidth > 1400 ? 1400 : screenWidth * 0.97;
  // ile pikseli potrzebujemy na tytuł, odstępy, button itp. (mniej więcej)
  final double reservedHeightForOtherWidgets =
      (isMobile ? 80 : 120) + 24 + 24 + 70 + 60; // title+gaps+button+padding
  // niech iframe nie przekracza 60% ekranu na mobile, 65% na desktop, i max 500-600 px
  final double iframeMaxHeight =
      (screenHeight - reservedHeightForOtherWidgets).clamp(
        isMobile ? 180.0 : 260.0,
        isMobile ? screenHeight * 0.62 : 500.0,
      );
  final double iframeMaxWidth = contentMaxWidth;
  final double iframeAspect = 16 / 9;
  final double iframeTargetWidth = isMobile
      ? iframeMaxWidth
      : iframeMaxWidth > iframeMaxHeight * iframeAspect
          ? iframeMaxHeight * iframeAspect
          : iframeMaxWidth;
  final double iframeTargetHeight = isMobile
      ? iframeMaxHeight
      : iframeTargetWidth / iframeAspect;

  final double titleFontSize = isMobile ? 22 : 32;
  final double buttonFontSize = isMobile ? 14 : 18;

  return SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: contentMaxWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _AnimatedSlideFade(
              animation: _titleController,
              beginOffset: const Offset(0, 0.2),
              child: Text(
                isPolish
                    ? 'Wkrocz do świata baśni i legend'
                    : 'Step into a world of fairy tales and legends',
                textAlign: TextAlign.center,
                style: GoogleFonts.imFellEnglishSc(
                  fontSize: titleFontSize,
                  color: Colors.white,
                  height: 1.3,
                  letterSpacing: 1.5,
                  shadows: const [
                    Shadow(
                      blurRadius: 12,
                      color: Colors.black87,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            _AnimatedSlideFade(
              animation: _iframeController,
              beginOffset: const Offset(0, 0.15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: iframeTargetWidth,
                  height: iframeTargetHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 12,
                        spreadRadius: 2,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const HtmlElementView(viewType: 'bookero-iframe'),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _AnimatedSlideFade(
              animation: _buttonController,
              beginOffset: const Offset(0, 0.15),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      blurRadius: 8,
                      offset: const Offset(2, 4),
                    ),
                  ],
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextButton.icon(
                  onPressed: () {
                    html.window.open('https://alverniaplanet.bookero.pl/', '_blank');
                  },
                  icon: const Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                  ),
                  label: Text(
                    isPolish ? 'Przejdź do rezerwacji' : 'Go to reservation',
                    style: GoogleFonts.imFellEnglishSc(
                      fontSize: buttonFontSize,
                      color: Colors.white,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 128, 94, 0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 2),
          ],
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
