import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:apewebsite/language_controller.dart';
import 'package:apewebsite/AnimatedStarsBackground.dart';

class HomeStep1 extends StatefulWidget {
  const HomeStep1({super.key});

  @override
  State<HomeStep1> createState() => _HomeStep1State();
}

class _HomeStep1State extends State<HomeStep1> with TickerProviderStateMixin {
  late AnimationController _headerController;
  late AnimationController _descriptionController;
  late AnimationController _cardsController;

  late Animation<double> _headerOpacity;
  late Animation<double> _descriptionOpacity;
  late Animation<Offset> _leftCardOffset;
  late Animation<Offset> _rightCardOffset;
  late Animation<double> _cardsOpacity;

  @override
  void initState() {
    super.initState();

    _headerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _descriptionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _cardsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    _headerOpacity = Tween(begin: 0.0, end: 1.0).animate(_headerController);
    _descriptionOpacity =
        Tween(begin: 0.0, end: 1.0).animate(_descriptionController);
    _cardsOpacity = Tween(begin: 0.0, end: 1.0).animate(_cardsController);

    _leftCardOffset = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _cardsController, curve: Curves.easeOut));

    _rightCardOffset = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _cardsController, curve: Curves.easeOut));

    _startAnimations();
  }

  Future<void> _startAnimations() async {
    await _headerController.forward();
    await Future.delayed(const Duration(milliseconds: 500));
    await _descriptionController.forward();
    await Future.delayed(const Duration(milliseconds: 700));
    await _cardsController.forward();
  }

  @override
  void dispose() {
    _headerController.dispose();
    _descriptionController.dispose();
    _cardsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPolish = context.watch<LanguageController>().isPolish;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 700;

    final String leftTitle =
        isPolish ? 'Ścieżka Edukacyjna' : 'Educational Path';
    final String leftText = isPolish
        ? 'Dowiedz się, że nie wszystko w filmie jest prawdą.\nZajrzyj za kulisy magii kina.'
        : 'Discover that not everything in film is real.\nPeek behind the scenes of movie magic.';

    final String rightTitle = 'Alverberg';
    final String rightText = isPolish
        ? 'Baśń w sercu lasu.\nImmersyjna wioska fantasy w scenografii serialu Netflixa.'
        : 'A fairy tale in the heart of the forest.\nAn immersive fantasy village from a Netflix set.';

    return Stack(
      children: [
        const Positioned.fill(child: AnimatedStarsBackground()),
        Positioned.fill(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 16 : 32, vertical: 48),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FadeTransition(
                      opacity: _headerOpacity,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: isPolish ? 'Witamy w\n' : 'Welcome to\n',
                              style: GoogleFonts.orbitron(
                                fontSize: isSmallScreen ? 30 : 54,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: 'Alvernia Planet!',
                              style: GoogleFonts.orbitron(
                                fontSize: isSmallScreen ? 38 : 66,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 161, 80, 25),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeTransition(
                      opacity: _descriptionOpacity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: isSmallScreen ? 12 : 60),
                        child: Text(
                          isPolish
                              ? 'Miejscu, gdzie rzeczywistość zakłada maskę iluzji, światło przecina mrok szklanych tuneli, a między futurystycznymi kopułami rozbrzmiewa echo dawnych wierzeń.'
                              : 'A place where reality wears the mask of illusion, light cuts the darkness of glass tunnels, and between futuristic domes echoes of ancient beliefs still whisper.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: isSmallScreen ? 14 : 25,
                            color: Colors.white70,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    isSmallScreen
                        ? Column(
                            children: [
                              SlideTransition(
                                position: _leftCardOffset,
                                child: FadeTransition(
                                  opacity: _cardsOpacity,
                                  child: _buildCard(
                                    title: leftTitle,
                                    text: leftText,
                                    color:
                                        const Color.fromARGB(255, 0, 35, 139),
                                    textColor: Colors.white70,
                                    accentColor: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              SlideTransition(
                                position: _rightCardOffset,
                                child: FadeTransition(
                                  opacity: _cardsOpacity,
                                  child: _buildCard(
                                    title: rightTitle,
                                    text: rightText,
                                    color: const Color.fromARGB(
                                        255, 151, 133, 126),
                                    textColor:
                                        const Color.fromARGB(255, 22, 20, 20),
                                    accentColor: const Color.fromARGB(
                                        255, 212, 197, 163),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: SlideTransition(
                                  position: _leftCardOffset,
                                  child: FadeTransition(
                                    opacity: _cardsOpacity,
                                    child: _buildCard(
                                      title: leftTitle,
                                      text: leftText,
                                      color:
                                          const Color.fromARGB(255, 0, 35, 139),
                                      textColor: Colors.white70,
                                      accentColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 32),
                              Expanded(
                                child: SlideTransition(
                                  position: _rightCardOffset,
                                  child: FadeTransition(
                                    opacity: _cardsOpacity,
                                    child: _buildCard(
                                      title: rightTitle,
                                      text: rightText,
                                      color: const Color.fromARGB(
                                          255, 151, 133, 126),
                                      textColor:
                                          const Color.fromARGB(255, 22, 20, 20),
                                      accentColor: const Color.fromARGB(
                                          255, 212, 197, 163),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard({
    required String title,
    required String text,
    required Color color,
    required Color textColor,
    required Color accentColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color.withOpacity(0.85),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            title.contains('Alverberg')
                ? 'assets/logos/logo_alverdorf.png'
                : 'assets/logos/logo_ap.png',
            height: 170,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: accentColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: textColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
