import 'package:apewebsite/pages/village/VillageStepContainer.dart';
import 'package:apewebsite/pages/village/village_step_1.dart';
import 'package:apewebsite/pages/village/village_step_2.dart';
import 'package:apewebsite/pages/village/village_step_3.dart';
import 'package:apewebsite/pages/village/village_step_4.dart';
import 'package:apewebsite/pages/village/village_step_5.dart';
import 'package:apewebsite/pages/village/footer_village.dart';
import 'package:apewebsite/background/AnimatedSlavicBackground.dart';
import 'package:apewebsite/widgets/custom_app_bar.dart';
import 'package:apewebsite/models/page_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class VillagePage extends StatefulWidget {
  const VillagePage({super.key});

  @override
  State<VillagePage> createState() => _VillagePageState();
}

class _VillagePageState extends State<VillagePage> {
  final PageController _pageController = PageController();
  bool isScrolling = false;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      VillageStepContainer(child: VillageStep1(onNext: _scrollToNextPage)),
      const VillageStepContainer(child: VillageStep2()),
      const VillageStepContainer(child: VillageStep3()),
      const VillageStepContainer(child: VillageStep4()),
      const VillageStepContainer(child: VillageStep5()),
      const VillageStepContainer(child: FooterVillage()),
    ];
  }

  void _handleScroll(double delta, {required bool isMouse}) async {
    if (!isScrolling) {
      final int page = _pageController.hasClients ? _pageController.page?.round() ?? 0 : 0;
      final int lastPage = _pages.length - 1;

      // Kierunek przewijania
      final bool goNext = isMouse ? delta > 0 : delta < 0;
      final bool goPrev = isMouse ? delta < 0 : delta > 0;

      // Sprawdź, czy można przewijać dalej!
      if ((goNext && page >= lastPage) || (goPrev && page <= 0)) {
        return; // nie rób nic, jesteś na końcu/początku
      }

      isScrolling = true;
      if (goNext) {
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
      await Future.delayed(const Duration(milliseconds: 600));
      isScrolling = false;
    }
  }

  void _scrollToNextPage() {
    final int page = _pageController.hasClients ? _pageController.page?.round() ?? 0 : 0;
    final int lastPage = _pages.length - 1;
    if (page < lastPage) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(currentPage: PageType.village),
      body: Stack(
        children: [
          const AnimatedForestSpirits(),
          GestureDetector(
            onVerticalDragUpdate: (details) =>
                _handleScroll(details.primaryDelta ?? 0, isMouse: false),
            child: Listener(
              onPointerSignal: (pointerSignal) {
                if (pointerSignal is PointerScrollEvent) {
                  // Reaguj tylko na przewijanie pionowe, ignoruj poziome scrollowanie
                  if (pointerSignal.scrollDelta.dy.abs() > pointerSignal.scrollDelta.dx.abs()) {
                    _handleScroll(pointerSignal.scrollDelta.dy, isMouse: true);
                  }
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
                activeDotColor: const Color.fromARGB(255, 201, 114, 0),
                dotHeight: 12,
                dotWidth: 12,
                spacing: 16,
                dotColor: const Color.fromARGB(255, 51, 72, 46).withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
