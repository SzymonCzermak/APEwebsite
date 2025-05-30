import 'package:apewebsite/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VillageStep3 extends StatelessWidget {
  const VillageStep3({super.key});

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
                          flex: 2,
                          child: _buildImage(isMobile: isMobile), // obrazek po lewej
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: _buildText(titleFontSize, bodyFontSize, isPolish), // tekst po prawej
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
          isPolish
              ? 'Czego spodziewać się na miejscu?'
              : 'What to expect on site?',
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
              ? '''Przekraczając bramy wioski, zanurzysz się w jej historię – legendę opowiedzianą nie tylko słowami. To sami mieszkańcy wprowadzą Cię w opowieść o Alverdorfu, a jej ślady dostrzeżesz, odkrywając najskrytsze zakamarki osady. Każde spotkanie to nowa lekcja – nauczysz się strzelać z łuku pod czujnym okiem łowczyni, poznasz sekrety magicznych istot, a jeśli masz w sobie ducha wojownika, sprawdzisz się w fechtunku. Każdy element tego świata stanie się Twoim doświadczeniem, każda chwila – częścią Twojej własnej opowieści.'''
              : '''As you cross the gates of the village, you’ll immerse yourself in its history – a legend told not only through words. It’s the villagers themselves who will guide you through the story of Alverdorf, and its traces you’ll uncover in the village’s hidden corners. Each encounter is a new lesson – you’ll learn archery under the watchful eye of a huntress, discover the secrets of magical beings, and if you have the spirit of a warrior, you’ll try your hand at fencing. Every element of this world becomes your experience, every moment – part of your own story.''',
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
              'assets/alverdorf_page/step/2.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
