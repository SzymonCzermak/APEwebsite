import 'package:apewebsite/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TourStep10 extends StatefulWidget {
  const TourStep10({super.key});

  @override
  State<TourStep10> createState() => _TourStep10State();
}

class _TourStep10State extends State<TourStep10> with TickerProviderStateMixin {
  late final AnimationController _titleController;
  late final AnimationController _descController;
  late final AnimationController _imageController;
  late final AnimationController _lineController;
  late final AnimationController _topBottomLineController;
  late final Animation<double> _lineAnimation;
  late final Animation<double> _topBottomLineAnimation;

  int _currentIndex = 0;

  final List<Map<String, String>> slides = [
    {
      'image': 'assets/tour_page/photo.png',
      'titlePL': 'Kosmobudka zdjęć',
      'descPL': 'Stań przed obiektywem w scenerii niczym z filmu science-fiction i zrób pamiątkowe zdjęcie, które zabierzesz ze sobą jako wspomnienie z wyprawy po Alvernia Planet.',
      'titleEN': 'Cosmo Photo Booth',
      'descEN': 'Step into a sci-fi scene and snap a souvenir photo to remember your journey through Alvernia Planet. A perfect memento from your cosmic adventure!'
    },
    {
      'image': 'assets/tour_page/quiz.png',
      'titlePL': 'Quiz filmowy',
      'descPL': 'Sprawdź, ile zapamiętałeś z wycieczki! Ukończ quiz i zgarnij zniżkę na gadżety.',
      'titleEN': 'Movie Quiz',
      'descEN': 'Test your memory from the tour! Finish the quiz and get a discount on merchandise.'
    },


    {
      'image': 'assets/tour_page/ai.png',
      'titlePL': 'Sztuczna inteligencja',
      'descPL': 'Masz pytania? Nasza AI zna odpowiedzi! Wejdź w interaktywną rozmowę i odkryj tajemnice planu filmowego i świata przyszłości.',
      'titleEN': 'Talk to our AI',
      'descEN': 'Curious minds welcome! Chat with our intelligent assistant and ask anything about the film set or the future world of technology.'
    },
    {
      'image': 'assets/tour_page/portals.png',
      'titlePL': 'Wrota wymiarów',
      'descPL': 'Przekrocz granicę rzeczywistości i zajrzyj do niezwykłych światów – dzięki naszym interaktywnym wrotom multimedialnym.',
      'titleEN': 'Dimensional Gates',
      'descEN': 'Step beyond reality and explore extraordinary universes through our immersive multimedia portals.'
    },
    {
      'image': 'assets/tour_page/stone.png',
      'titlePL': 'Lewitujące kamienie',
      'descPL': 'To nie magia – to technologia! Stań obok lewitujących kamieni i uchwyć ten wyjątkowy moment na zdjęciu.',
      'titleEN': 'Floating Stones',
      'descEN': 'It’s not magic – it’s tech! Stand by our levitating stones and capture the perfect futuristic photo moment.'
    },
  ];

  @override
  void initState() {
    super.initState();

    _titleController = AnimationController(duration: const Duration(milliseconds: 250), vsync: this);
    _descController = AnimationController(duration: const Duration(milliseconds: 150), vsync: this);
    _imageController = AnimationController(duration: const Duration(milliseconds: 400), vsync: this);
    _lineController = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _topBottomLineController = AnimationController(duration: const Duration(milliseconds: 450), vsync: this);

    _lineAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _lineController,
      curve: Curves.easeOutCubic,
    ));

    _topBottomLineAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _topBottomLineController, curve: Curves.easeOut),
    );

    Future.delayed(const Duration(milliseconds: 300), () {
      _titleController.forward().then((_) {
        _lineController.forward().then((_) {
          Future.delayed(const Duration(milliseconds: 200), () {
            _descController.forward().then((_) {
              Future.delayed(const Duration(milliseconds: 100), () {
                _topBottomLineController.forward();
                _imageController.forward();
              });
            });
          });
        });
      });
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _imageController.dispose();
    _lineController.dispose();
    _topBottomLineController.dispose();
    super.dispose();
  }

  void _goToPrevious() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + slides.length) % slides.length;
    });
  }

  void _goToNext() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % slides.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 750;
    final isPolish = context.watch<LanguageController>().isPolish;
    final screenHeight = MediaQuery.of(context).size.height;
    final shortestSide = screenWidth < screenHeight ? screenWidth : screenHeight;

    final titleFontSize = shortestSide.clamp(280, 800) * 0.05;
    final bodyFontSize = shortestSide.clamp(280, 800) * 0.03;

    final slide = slides[_currentIndex];
    final title = isPolish ? slide['titlePL']! : slide['titleEN']!;
    final desc = isPolish ? slide['descPL']! : slide['descEN']!;
    final imagePath = slide['image']!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  isPolish
                      ? 'Kopuła K-12 — czas wolny i swobodne eksplorowanie atrakcji'
                      : 'Dome K-12 — free time and open exploration of attractions',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.robotoSlab(
                    fontSize: titleFontSize * 0.85,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    shadows: const [
                      Shadow(blurRadius: 4, color: Colors.black87, offset: Offset(0, 2)),
                    ],
                  ),
                ),
              ),
              _AnimatedLine(animation: _topBottomLineAnimation, isTop: true),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: isMobile
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: const Color.fromARGB(255, 148, 0, 178).withOpacity(0.6),
                                radius: 24,
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                                  onPressed: _goToPrevious,
                                  iconSize: 20,
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: const Color.fromARGB(255, 148, 0, 178).withOpacity(0.6),
                                radius: 24,
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                                  onPressed: _goToNext,
                                  iconSize: 20,
                                ),
                              ),
                            ],
                          ),
                          _AnimatedSlideFade(
                            animation: _imageController,
                            beginOffset: const Offset(0, 0.15),
                            child: _buildImage(imagePath, isMobile),
                          ),
                          const SizedBox(height: 24),
                          _buildText(titleFontSize, bodyFontSize, title, desc),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: const Color.fromARGB(255, 148, 0, 178).withOpacity(0.6),
                            radius: 24,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                              onPressed: _goToPrevious,
                              iconSize: 20,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24.0),
                              child: _buildText(titleFontSize, bodyFontSize, title, desc),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: _AnimatedSlideFade(
                              animation: _imageController,
                              beginOffset: const Offset(0.15, 0),
                              child: _buildImage(imagePath, isMobile),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: const Color.fromARGB(255, 148, 0, 178).withOpacity(0.6),
                            radius: 24,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                              onPressed: _goToNext,
                              iconSize: 20,
                            ),
                          ),
                        ],
                      ),
              ),
              _AnimatedLine(animation: _topBottomLineAnimation, isTop: false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText(double titleSize, double bodySize, String title, String desc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _AnimatedSlideFade(
          animation: _titleController,
          beginOffset: const Offset(0, 0.2),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoSlab(
                  fontSize: titleSize,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: const [
                    Shadow(blurRadius: 6, color: Colors.black, offset: Offset(0, 2)),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              AnimatedBuilder(
                animation: _lineAnimation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _lineAnimation.value,
                    child: Transform.translate(
                      offset: Offset(0, 10 * (1 - _lineAnimation.value)),
                      child: Container(
                        height: 2,
                        width: 300,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.black,
                              Color(0xFFBA68C8),
                              Color.fromARGB(255, 91, 0, 107),
                              Colors.black,
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _AnimatedSlideFade(
          animation: _descController,
          beginOffset: const Offset(0, 0.25),
          child: Text(
            desc,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontSize: bodySize,
              color: Colors.white,
              height: 1.4,
              shadows: const [
                Shadow(blurRadius: 4, color: Colors.black, offset: Offset(0, 2)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImage(String imagePath, bool isMobile) {
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight = isMobile ? screenHeight * 0.3 : screenHeight * 0.5;
    final imageWidth = imageHeight * (9 / 16);

    return Center(
      child: SizedBox(
        height: imageHeight,
        width: imageWidth,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.medium,
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

class _AnimatedLine extends StatelessWidget {
  final Animation<double> animation;
  final bool isTop;

  const _AnimatedLine({
    required this.animation,
    required this.isTop,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) => Opacity(
        opacity: animation.value,
        child: Transform.translate(
          offset: Offset(0, (isTop ? -1 : 1) * 20 * (1 - animation.value)),
          child: Container(
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: 1200,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.black,
                  Color(0xFFBA68C8),
                  Color.fromARGB(255, 91, 0, 107),
                  Colors.black,
                ],
              ),
              borderRadius: BorderRadius.circular(1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.9),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
