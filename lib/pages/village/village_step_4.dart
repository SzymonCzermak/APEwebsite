import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:apewebsite/language_controller.dart';
class VillageStep4 extends StatelessWidget {
  const VillageStep4({super.key});

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
                        _buildImage(isMobile: isMobile),
                        const SizedBox(height: 24),
                        _buildText(titleFontSize, bodyFontSize, isPolish),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: _buildText(titleFontSize, bodyFontSize, isPolish), // tekst po lewej
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: _buildImage(isMobile: isMobile), // obrazek po prawej
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
          isPolish
              ? 'Czas trwania i atrakcje'
              : 'Duration and attractions',
          textAlign: TextAlign.center,
          style: GoogleFonts.imFellEnglishSc(
            fontSize: titleSize,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            shadows: const [
              Shadow(blurRadius: 6, color: Colors.black87, offset: Offset(0, 2)),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          isPolish
              ? '''Wizyta w Alverdorfie to dwugodzinne, immersyjne doświadczenie w formie gry fabularnej. Przemierzając osadę, pomożesz jej mieszkańcom rozwiązać dawne tajemnice i odkryć sekrety przeszłości. Czeka Cię eksploracja, aktywności na świeżym powietrzu oraz spotkanie z dawnymi wierzeniami i tradycjami. Nauczysz się walki mieczem, strzelania z łuku, poznasz naturę słowiańskich bestii, zgłębisz wiedzę o ziołach, a na koniec stworzysz własny amulet szczęścia. To wyjątkowa okazja, by doświadczyć świata rodem dawnych opowieści – w sposób aktywny, angażujący i pełen magii.'''
              : '''A visit to Alverdorf is a two-hour immersive experience in the form of a role-playing game. As you explore the village, you'll help its inhabitants uncover ancient secrets and solve old mysteries. You'll enjoy outdoor activities, discover old beliefs and traditions, learn sword fighting and archery, uncover the nature of Slavic creatures, explore herbal knowledge, and finally create your own lucky amulet. It’s a unique opportunity to live a tale-like adventure – in an active, engaging, and magical way.''',
          textAlign: TextAlign.center,
          style: GoogleFonts.imFellEnglishSc(
            fontSize: bodySize,
            color: Colors.white,
            height: 1.4,
            shadows: const [
              Shadow(blurRadius: 4, color: Colors.black, offset: Offset(0, 2)),
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
              'assets/alverdorf_page/step/3.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
