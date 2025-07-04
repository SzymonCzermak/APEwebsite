import 'package:apewebsite/pages/tour/tour_page_10.dart';
import 'package:apewebsite/pages/tour/tour_page_11.dart';
import 'package:apewebsite/pages/tour/tour_page_3.dart';
import 'package:apewebsite/pages/tour/tour_page_4.dart';
import 'package:apewebsite/pages/tour/tour_page_5.dart';
import 'package:apewebsite/pages/tour/tour_page_7.dart';
import 'package:apewebsite/pages/tour/tour_page_8.dart';
import 'package:apewebsite/pages/tour/tour_page_9.dart';
import 'package:apewebsite/pages/tour/tour_step_6.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:apewebsite/background/AnimatedEducationalBackground.dart';
import 'package:apewebsite/pages/tour/tour_step_1.dart';
import 'package:apewebsite/pages/tour/tour_step_2.dart';
import 'package:apewebsite/widgets/custom_app_bar.dart';
import 'package:apewebsite/models/page_type.dart';

class TourPage extends StatefulWidget {
  const TourPage({super.key});

  @override
  State<TourPage> createState() => _TourPageState();
}

class _TourPageState extends State<TourPage> {
  final PageController _pageController = PageController();
  bool isScrolling = false;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      TourStep1(onNext: _scrollToNextPage),
      TourStep2(onNext: _scrollToNextPage),
      const TourStep3(),
      const TourStep4(),
      const TourStep5(),
      const TourStep6(),
      const TourStep7(),
      const TourStep8(),
      const TourStep9(),
      const TourStep10(),
      const TourStep11(),
    ];
  }

  void _handleScroll(double delta, {required bool isMouse}) async {
  if (!isScrolling) {
    final currentPage = _pageController.page?.round() ?? 0;

    // Ograniczenia na podstawie typu wejścia i kierunku przewijania
    if ((isMouse && delta > 0 && currentPage == _pages.length - 1) || // myszka: dół na końcu
        (isMouse && delta < 0 && currentPage == 0) ||                 // myszka: góra na początku
        (!isMouse && delta < 0 && currentPage == _pages.length - 1) ||// touch: dół na końcu
        (!isMouse && delta > 0 && currentPage == 0)) {                // touch: góra na początku
      return;
    }

    isScrolling = true;

    if (isMouse) {
      if (delta > 0) {
        await _pageController.nextPage(
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOut,
        );
      } else {
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
      } else {
        await _pageController.previousPage(
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOut,
        );
      }
    }

    await Future.delayed(const Duration(milliseconds: 800));
    isScrolling = false;
  }
}


  void _scrollToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(currentPage: PageType.tour),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const AnimatedEducationalBackground(),
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
                itemCount: _pages.length,
                itemBuilder: (context, index) => _pages[index],
              ),
            ),
          ),
          Positioned(
            right: 16,
            top: MediaQuery.of(context).size.height / 2 - 40,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: _pages.length,
              axisDirection: Axis.vertical,
              effect: WormEffect(
                activeDotColor: Colors.white,
                dotColor: Colors.white.withOpacity(0.3),
                dotHeight: 10,
                dotWidth: 10,
                spacing: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
