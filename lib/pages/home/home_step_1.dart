import 'package:apewebsite/models/page_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:apewebsite/language_controller.dart';
import 'package:apewebsite/background/AnimatedStarsBackground.dart';

class HomeStep1 extends StatefulWidget {
  final void Function(PageType) onTabSelected;

  const HomeStep1({super.key, required this.onTabSelected});

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
        vsync: this, duration: const Duration(milliseconds: 1200));
    _descriptionController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _cardsController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));

    _headerOpacity = Tween(begin: 0.0, end: 1.0).animate(_headerController);
    _descriptionOpacity =
        Tween(begin: 0.0, end: 1.0).animate(_descriptionController);
    _cardsOpacity = Tween(begin: 0.0, end: 1.0).animate(_cardsController);

    _leftCardOffset =
        Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
            CurvedAnimation(parent: _cardsController, curve: Curves.easeOut));
    _rightCardOffset =
        Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
            CurvedAnimation(parent: _cardsController, curve: Curves.easeOut));

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
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 700;
    final cardHeight = size.height * 0.2;
    final cardWidth = size.width * 0.7;

    final leftTitle = isPolish ? 'Ścieżka Edukacyjna' : 'Educational Path';
    final leftText = isPolish
        ? 'Dowiedz się, że nie wszystko w filmie jest prawdą.\nZajrzyj za kulisy magii kina.'
        : 'Discover that not everything in film is real.\nPeek behind the scenes of movie magic.';

    final rightTitle = 'Alverdorf';
    final rightText = isPolish
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
                              SizedBox(
                                height: cardHeight,
                                width: cardWidth,
                                child: SlideTransition(
                                  position: _leftCardOffset,
                                  child: FadeTransition(
                                    opacity: _cardsOpacity,
                                    child: _buildCard(
                                      title: leftTitle,
                                      text: leftText,
                                      useGradient: true,
                                      textColor: Colors.white70,
                                      accentColor: Colors.white,
                                      onTap: () => Navigator.pushNamed(context, '/wycieczka'),

                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                height: cardHeight,
                                width: cardWidth,
                                child: SlideTransition(
                                  position: _rightCardOffset,
                                  child: FadeTransition(
                                    opacity: _cardsOpacity,
                                    child: _buildCard(
                                      title: rightTitle,
                                      text: rightText,
                                      useGradient: false,
                                      color: const Color.fromARGB(255, 163, 150, 129),
                                      textColor: const Color.fromARGB(255, 22, 20, 20),
                                      accentColor: const Color.fromARGB(255, 61, 40, 26),
                                      onTap: () => Navigator.pushNamed(
                                          context, '/alverdorf'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: SlideTransition(
                                    position: _leftCardOffset,
                                    child: FadeTransition(
                                      opacity: _cardsOpacity,
                                      child: _buildCard(
                                        title: leftTitle,
                                        text: leftText,
                                        useGradient: true,
                                        textColor: Colors.white70,
                                        accentColor: Colors.white,
                                        onTap: () => Navigator.pushNamed(context, '/wycieczka'),

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
                                        useGradient: false,
                                        color: const Color.fromARGB(255, 163, 150, 129),
                                        textColor: const Color.fromARGB(255, 22, 20, 20),
                                        accentColor: const Color.fromARGB(255, 61, 40, 26),
onTap: () => Navigator.pushNamed(context, '/alverdorf'),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
    Color? color,
    required Color textColor,
    required Color accentColor,
    required VoidCallback onTap,
    required bool useGradient,
  }) {
    final isSmallScreen = MediaQuery.of(context).size.width < 700;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(isSmallScreen ? 16 : 24),
        decoration: useGradient
    ? BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0D0026), // bardzo ciemny granat
            Color(0xFF160033), // głęboka noc
            Color(0xFF24004F), // fiolet w cieniu
            Color(0xFF310069), // ciemna purpura
            Color(0xFF3F0085), // klasyczny fiolet
            Color(0xFF5800B0), // żywszy fiolet
            Color(0xFF7200D5), // purpurowy błysk
            Color(0xFF8F00F9), // neonowy fiolet
            Color(0xFFB000FF), // magenta
            Color(0xFFC400FF), // różowo-fiolet
            Color(0xFFE000FF), // pastelowy róż
            Color(0xFFF5D0FF), // bardzo jasny fiolet/róż – mgiełka
          ],
          stops: [
            0.0, 0.08, 0.15, 0.25, 0.35, 0.45, 0.55,
            0.65, 0.75, 0.85, 0.92, 1.0
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFB000FF).withOpacity(0.4),
            blurRadius: 30,
            offset: Offset(0, 12),
          ),
        ],
      )
    : BoxDecoration(
        color: color!.withOpacity(0.85),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),

        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                title.contains('Alverdorf')
                    ? 'assets/logos/logo_alverdorf.png'
                    : 'assets/logos/logo_ap.png',
                height: 150,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
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
                  fontWeight: FontWeight.bold,
                  color: accentColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
