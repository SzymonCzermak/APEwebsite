// Plik: home_page.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:apewebsite/language_controller.dart';
import 'package:apewebsite/models/page_type.dart';
import 'package:apewebsite/custom_footer.dart';
import 'package:apewebsite/background/AnimatedStarsBackground.dart';

class HomePage extends StatefulWidget {
  final void Function(PageType)? onTabSelected;

  const HomePage({super.key, this.onTabSelected});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _headerController;
  late AnimationController _descriptionController;
  late AnimationController _cardsController;
  late AnimationController _ctaController;

  late Animation<double> _headerOpacity;
  late Animation<double> _descriptionOpacity;
  late Animation<double> _cardsOpacity;
  late Animation<double> _ctaOpacity;

  late Animation<Offset> _leftCardOffset;
  late Animation<Offset> _rightCardOffset;

  @override
  void initState() {
    super.initState();

    _headerController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _descriptionController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _cardsController = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _ctaController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));

    _headerOpacity = Tween(begin: 0.0, end: 1.0).animate(_headerController);
    _descriptionOpacity = Tween(begin: 0.0, end: 1.0).animate(_descriptionController);
    _cardsOpacity = Tween(begin: 0.0, end: 1.0).animate(_cardsController);
    _ctaOpacity = Tween(begin: 0.0, end: 1.0).animate(_ctaController);

    _leftCardOffset = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(parent: _cardsController, curve: Curves.easeOut),
    );
    _rightCardOffset = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(parent: _cardsController, curve: Curves.easeOut),
    );

    _startAnimations();
  }

  Future<void> _startAnimations() async {
    await _headerController.forward();
    await Future.delayed(const Duration(milliseconds: 250));
    await _descriptionController.forward();
    await Future.delayed(const Duration(milliseconds: 350));
    await _cardsController.forward();
    await Future.delayed(const Duration(milliseconds: 400));
    await _ctaController.forward();
  }

  @override
  void dispose() {
    _headerController.dispose();
    _descriptionController.dispose();
    _cardsController.dispose();
    _ctaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPolish = context.watch<LanguageController>().isPolish;
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 700;
    final cardHeight = size.height * 0.18;
    final cardWidth = size.width * 0.6;

    final leftTitle = isPolish ? 'Ścieżka Edukacyjna' : 'Educational Path';
    final leftText = isPolish
        ? 'Dowiedz się, że nie wszystko w filmie jest prawdą.\nZajrzyj za kulisy magii kina.'
        : 'Discover that not everything in film is real.\nPeek behind the scenes of movie magic.';

    final rightTitle = 'Alverdorf';
    final rightText = isPolish
        ? 'Baśń w sercu lasu.\nImmersyjna wioska fantasy w scenografii serialu Netflixa.'
        : 'A fairy tale in the heart of the forest.\nAn immersive fantasy village from a Netflix set.';

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: AnimatedStarsBackground()),
          Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header
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

                    // Description
                    FadeTransition(
                      opacity: _descriptionOpacity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 12 : 60),
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

                    // Cards
                    FadeTransition(
                      opacity: _cardsOpacity,
                      child: isSmallScreen
                          ? Column(
                              children: [
                                SlideTransition(
                                  position: _leftCardOffset,
                                  child: _buildCard(
                                    title: leftTitle,
                                    text: leftText,
                                    useGradient: true,
                                    textColor: Colors.white70,
                                    accentColor: Colors.white,
                                    onTap: () => Navigator.pushNamed(context, '/wycieczka'),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                SlideTransition(
                                  position: _rightCardOffset,
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
                              ],
                            )
                          : IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: SlideTransition(
                                      position: _leftCardOffset,
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
                                  const SizedBox(width: 32),
                                  Expanded(
                                    child: SlideTransition(
                                      position: _rightCardOffset,
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
                                ],
                              ),
                            ),
                    ),
                    const SizedBox(height: 80),

                    // CTA Buttons
                    FadeTransition(
                      opacity: _ctaOpacity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            isPolish
                                ? 'Chcesz dowiedzieć się więcej o obiekcie i ludziach go tworzących?'
                                : 'Want to learn more about the place and the people behind it?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isSmallScreen ? 20 : 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            isPolish
                                ? 'Poznaj historie, pasje i przestrzeń, która inspiruje.'
                                : 'Discover the stories, passion, and space that inspire.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isSmallScreen ? 14 : 18,
                              color: Colors.white70,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 28),
                          _buildGradientButton(
                            context,
                            label: isPolish ? 'Zobacz więcej o nas' : 'Learn more about us',
                            icon: Icons.group,
                            onTap: () => Navigator.pushNamed(context, '/o-nas'),
                            big: true,
                          ),
                          const SizedBox(height: 32),
                          Text(
                            isPolish ? 'Masz pytania? Skontaktuj się z nami:' : 'Got questions? Contact us:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isSmallScreen ? 12 : 14,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildGradientButton(
                            context,
                            label: isPolish ? 'Kontakt' : 'Contact',
                            icon: Icons.mail_outline,
                            onTap: () => Navigator.pushNamed(context, '/kontakt'),
                            big: false,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 80),
                    const CustomFooter(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
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
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: useGradient
            ? BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF0D0026),
                    Color(0xFF7200D5),
                    Color(0xFFB000FF),
                    Color(0xFFF5D0FF),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFB000FF).withOpacity(0.4),
                    blurRadius: 30,
                    offset: const Offset(0, 12),
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
                fontWeight: FontWeight.bold,
                color: accentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required VoidCallback onTap,
    bool big = false,
  }) {
    final gradient = const LinearGradient(
      colors: [Color(0xFFA45018), Color(0xFFA45018)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 51, 138).withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          padding: EdgeInsets.symmetric(
            vertical: big ? 14 : 10,
            horizontal: big ? 24 : 16,
          ),
          textStyle: TextStyle(
            fontSize: big ? 16 : 13,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        icon: Icon(icon, size: big ? 22 : 18, color: Colors.white),
        label: Text(label, style: const TextStyle(color: Colors.white)),
        onPressed: onTap,
      ),
    );
  }
}
