import 'package:apewebsite/pages/village/village_step_3.dart';
import 'package:apewebsite/pages/village/village_step_4.dart';
import 'package:apewebsite/pages/village/village_step_5.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:apewebsite/background/AnimatedSlavicBackground.dart';
import 'package:apewebsite/pages/village/footer_village.dart';
import 'package:apewebsite/pages/village/village_step_2.dart';
import 'package:apewebsite/widgets/custom_app_bar.dart';
import 'package:apewebsite/models/page_type.dart';

class VillagePage extends StatefulWidget {
  const VillagePage({super.key});

  @override
  State<VillagePage> createState() => _VillagePageState();
}

class _VillagePageState extends State<VillagePage> {
  final PageController _pageController = PageController();
  bool isScrolling = false;

  final List<Widget> _pages = const [
    _AnimatedVillageStep(image: 'assets/alverdorf_page/1.png'),
    VillageStep2(),
    VillageStep3(),
    VillageStep4(),
    VillageStep5(),

    FooterVillage(),
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

      await Future.delayed(const Duration(milliseconds: 800));
      isScrolling = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(currentPage: PageType.village),
      body: Stack(
        children: [
          const AnimatedSlavicBackground(),
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
    final maxContentWidth = screenWidth * 0.7;
    final height = maxContentWidth / (11 / 8);

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
