// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:apewebsite/language_controller.dart';
import 'package:apewebsite/styles/button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
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

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenSize = MediaQuery.of(context).size;
        final screenWidth = screenSize.width;
        final screenHeight = screenSize.height;

        final isMobile = screenWidth < 600;

        // szerokość iframe max. 95% szerokości ekranu lub 1200px
        final double iframeMaxWidth = screenWidth > 1200 ? 1200 : screenWidth * 0.95;

        // proporcja 16:9, ale nie więcej niż 60% wysokości ekranu
        final double iframeHeight = (iframeMaxWidth / 16) * 9;
        final double finalIframeHeight = iframeHeight > screenHeight * 0.6
            ? screenHeight * 0.6
            : iframeHeight;

        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1700),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Text(
                    isPolish
                        ? 'Wkrocz do świata baśni i legend'
                        : 'Step into a world of fairy tales and legends',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.imFellEnglishSc(
                      fontSize: 32,
                      color: Colors.white,
                      shadows: const [
                        Shadow(
                          blurRadius: 12,
                          color: Colors.black87,
                          offset: Offset(0, 3),
                        ),
                      ],
                      letterSpacing: 1.5,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // IFRAME
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: iframeMaxWidth,
                      height: finalIframeHeight,
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

                  const SizedBox(height: 20),

                  // PRZYCISK
                  ElevatedButton.icon(
                    onPressed: () {
                      html.window.open('https://alverniaplanet.bookero.pl/', '_blank');
                    },
                    style: AppButtonStyles.responsive(screenWidth: screenWidth),
                    icon: const Icon(Icons.calendar_month, color: Colors.white),
                    label: Text(
                      isPolish ? 'Przejdź do rezerwacji' : 'Go to reservation',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget _buildSocialIcon({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color.fromARGB(136, 0, 0, 0),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              blurRadius: 12,
              spreadRadius: 2,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(icon, color: color, size: 28),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
