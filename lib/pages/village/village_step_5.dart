import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:apewebsite/language_controller.dart';

class VillageStep5 extends StatefulWidget {
  const VillageStep5({super.key});

  @override
  State<VillageStep5> createState() => _VillageStep5State();
}

class _VillageStep5State extends State<VillageStep5>
    with TickerProviderStateMixin {
  late final AnimationController _titleController;
  late final AnimationController _descController;
  late final AnimationController _imageController;

  @override
  void initState() {
    super.initState();
    _titleController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _descController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _imageController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    _titleController.forward().then((_) {
      Future.delayed(const Duration(milliseconds: 300), () {
        _descController.forward().then((_) {
          Future.delayed(const Duration(milliseconds: 800), () {
            _imageController.forward();
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 750;
    final isPolish = context.watch<LanguageController>().isPolish;
    final screenHeight = MediaQuery.of(context).size.height;
    final shortestSide =
        screenWidth < screenHeight ? screenWidth : screenHeight;

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
                        _AnimatedSlideFade(
                          animation: _imageController,
                          beginOffset: const Offset(0, 0.15),
                          child: _buildImage(isMobile: isMobile),
                        ),
                        const SizedBox(height: 24),
                        _buildText(titleFontSize, bodyFontSize, isPolish),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: _AnimatedSlideFade(
                            animation: _imageController,
                            beginOffset: const Offset(0.15, 0),
                            child: _buildImage(isMobile: isMobile),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: _buildText(
                                titleFontSize, bodyFontSize, isPolish),
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
        _AnimatedSlideFade(
          animation: _titleController,
          beginOffset: const Offset(0, 0.2),
          child: Text(
            isPolish
                ? 'Oprawa aktorska – animatorzy'
                : 'Theatrical setting – animators',
            textAlign: TextAlign.center,
            style: GoogleFonts.imFellEnglishSc(
              fontSize: titleSize,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: const [
                Shadow(
                    blurRadius: 6, color: Colors.black87, offset: Offset(0, 2)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        _AnimatedSlideFade(
          animation: _descController,
          beginOffset: const Offset(0, 0.25),
          child: Text(
            isPolish
                ? '''Na miejscu grupą odwiedzających zajmie się pięciu doświadczonych animatorów, którzy zadbają o pełne zanurzenie w realia Alverdorfu. Wcielając się w mieszkańców wioski, nie tylko poprowadzą warsztaty i aktywności, ale także ożywią opowieść, wciągając uczestników w fabularną rozgrywkę. Animatorzy posiadają doświadczenie w pracy z różnymi grupami wiekowymi – od dzieci, przez młodzież, aż po osoby dorosłe. Elastyczna formuła scenariusza sprawia, że każdy odwiedzający znajdzie coś dla siebie. Każda z postaci ma swoją historię, sekrety i zadania, a relacje między nimi tworzą autentyczną atmosferę dawnej osady. Dzięki profesjonalnej oprawie aktorskiej, dialogom i dynamicznej narracji, poczujesz się jak pełnoprawny bohater tej opowieści.'''
                : '''On site, a team of five experienced animators will guide the visiting group, ensuring full immersion in the world of Alverdorf. As village residents, they will lead activities and workshops while bringing the story to life through interactive role-play. The animators have experience working with all age groups – from children and teens to adults. Thanks to a flexible script, every visitor can find something for themselves. Each character has their own backstory, secrets, and tasks, and the relationships between them create an authentic village atmosphere. With professional acting, dialogue, and storytelling, you'll feel like a true hero of this tale.''',
            textAlign: TextAlign.center,
            style: GoogleFonts.imFellEnglishSc(
              fontSize: bodySize,
              color: Colors.white,
              height: 1.4,
              shadows: const [
                Shadow(
                    blurRadius: 4, color: Colors.black, offset: Offset(0, 2)),
              ],
            ),
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
              'assets/alverdorf_page/step/4.png',
              fit: BoxFit.cover,
            ),
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
