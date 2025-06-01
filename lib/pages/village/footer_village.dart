// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:apewebsite/language_controller.dart';
import 'package:apewebsite/styles/button.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterVillage extends StatelessWidget {
  const FooterVillage({super.key});

  @override
  Widget build(BuildContext context) {
    const String viewId = 'bookero-iframe';

    if (kIsWeb) {
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
        viewId,
        (int viewId) => html.IFrameElement()
          ..src = 'https://alverniaplanet.bookero.pl/'
          ..style.border = 'none'
          ..style.width = '100%'
          ..style.height = '100%'
          ..setAttribute('scrolling', 'yes')
          ..allowFullscreen = true,
      );
    }

    final isPolish = context.watch<LanguageController>().isPolish;
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final isMobile = screenWidth < 600;

    final double contentMaxWidth =
        screenWidth > 1400 ? 1400 : screenWidth * 0.95;
    final double iframeMaxWidth =
        isMobile ? screenWidth * 0.95 : screenWidth * 0.9;
    final double iframeHeight =
        isMobile ? screenHeight * 0.65 : (iframeMaxWidth / 16) * 9;

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
              Text(
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
              const SizedBox(height: 24),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: iframeMaxWidth,
                  height: iframeHeight,
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
                  child: const HtmlElementView(viewType: viewId),
                ),
              ),
              const SizedBox(height: 24),
              TextButton.icon(
                onPressed: () {
                  html.window
                      .open('https://alverniaplanet.bookero.pl/', '_blank');
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
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
