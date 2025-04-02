import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TourPage extends StatefulWidget {
  const TourPage({super.key});

  @override
  State<TourPage> createState() => _TourPageState();
}

class _TourPageState extends State<TourPage> {
  final PageController _pageController = PageController();
  bool isScrolling = false;

  final List<Widget> _pages = const [
    _TourStep(
      image: 'assets/tour/step1.png',
      title: 'Powitanie',
      description:
          'Rozpoczynamy wycieczkę edukacyjną od powitania i krótkiego wprowadzenia.',
    ),
    _TourStep(
      image: 'assets/tour/step2.png',
      title: 'Zwiedzanie obiektu',
      description:
          'Zobaczysz scenografię, technologię filmową i poznasz kulisy powstawania filmów.',
    ),
    _TourStep(
      image: 'assets/tour/step3.png',
      title: 'Warsztaty i zabawa',
      description:
          'Czas na kreatywność i ruch! Weź udział w warsztatach i zabawie edukacyjnej.',
    ),
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
      body: Listener(
        onPointerSignal: (event) {
          if (event is PointerScrollEvent) {
            _handleScroll(event.scrollDelta.dy, isMouse: true);
          }
        },
        child: GestureDetector(
          onVerticalDragUpdate: (details) {
            _handleScroll(details.primaryDelta ?? 0, isMouse: false);
          },
          child: Stack(
            children: [
              PageView(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                children: _pages,
              ),
              Positioned(
                right: 16,
                top: MediaQuery.of(context).size.height / 2 - 40,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: _pages.length,
                  axisDirection: Axis.vertical,
                  effect: WormEffect(
                    activeDotColor: Colors.redAccent,
                    dotHeight: 12,
                    dotWidth: 12,
                    spacing: 16,
                    dotColor: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TourStep extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const _TourStep({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
