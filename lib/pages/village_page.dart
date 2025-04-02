import 'package:apewebsite/widgets/footer_village.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VillagePage extends StatefulWidget {
  const VillagePage({super.key});

  @override
  State<VillagePage> createState() => _VillagePageState();
}

class _VillagePageState extends State<VillagePage> {
  final PageController _pageController = PageController();
  bool isScrolling = false;

  final List<String> _imagePaths = const [
    'assets/alverdorf_page/1.png',
    'assets/alverdorf_page/2.png',
    'assets/alverdorf_page/3.png',
    'assets/alverdorf_page/4.png',
    'assets/alverdorf_page/5.png',
    'assets/alverdorf_page/6.png',
  ];

  void _handleScroll(double delta, {required bool isMouse}) async {
    if (!isScrolling) {
      isScrolling = true;

      if (isMouse) {
        if (delta > 0) {
          await _pageController.nextPage(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOut,
          );
        } else if (delta < 0) {
          await _pageController.previousPage(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOut,
          );
        }
      } else {
        if (delta < 0) {
          await _pageController.nextPage(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOut,
          );
        } else if (delta > 0) {
          await _pageController.previousPage(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOut,
          );
        }
      }

      await Future.delayed(const Duration(milliseconds: 550));
      isScrolling = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Statyczne tło
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/backgrounds/BG1 alverdorf.png'), // Ścieżka do pliku PNG
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Przewijane obrazy
          GestureDetector(
            onVerticalDragUpdate: (details) {
              _handleScroll(details.primaryDelta ?? 0, isMouse: false);
            },
            child: Listener(
              onPointerSignal: (pointerSignal) {
                if (pointerSignal is PointerScrollEvent) {
                  _handleScroll(pointerSignal.scrollDelta.dy, isMouse: true);
                }
              },
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: _imagePaths.length + 1, // Dodajemy 1 na Footer
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // Wyświetl Footer jako pierwszy slajd
                    return const FooterVillage();
                  } else {
                    // Obrazki przesunięte o -1
                    return _AnimatedVillageStep(image: _imagePaths[index - 1]);
                  }
                },
              ),
            ),
          ),
          // Wskaźnik stron
          Positioned(
            right: 16,
            top: MediaQuery.of(context).size.height / 2 - 40,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: _imagePaths.length + 1, // Zwiększamy liczbę stron o 1
              axisDirection: Axis.vertical,
              effect: WormEffect(
                activeDotColor: Colors.blueAccent,
                dotHeight: 12,
                dotWidth: 12,
                spacing: 16,
                dotColor: Colors.grey.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedVillageStep extends StatelessWidget {
  final String image;

  const _AnimatedVillageStep({required this.image});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final maxContentWidth = screenWidth * 0.7; // 70% szerokości ekranu
    final height = maxContentWidth / (11 / 8); // Proporcja 11:8

    return Center(
      child: Container(
        width: maxContentWidth,
        height: height,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
            ),
          ],
        ),
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 700),
          builder: (context, opacity, child) {
            return Opacity(
              opacity: opacity,
              child: child,
            );
          },
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
