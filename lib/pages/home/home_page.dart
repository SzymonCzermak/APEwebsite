import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'home_step_1.dart';
import 'home_step_2.dart';
import 'home_step_3.dart';
import '../../models/page_type.dart';

class HomePage extends StatefulWidget {
  final void Function(PageType)? onTabSelected;

  const HomePage({super.key, this.onTabSelected});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  bool isScrolling = false;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
  HomeStep1(
    onTabSelected: widget.onTabSelected ?? (page) {},
  ),
];

  }

  void _handleScroll(double delta, {required bool isMouse}) async {
    if (!isScrolling) {
      isScrolling = true;
      if (isMouse) {
        if (delta > 0) {
          await _pageController.nextPage(
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeInOut);
        } else {
          await _pageController.previousPage(
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeInOut);
        }
      } else {
        if (delta < 0) {
          await _pageController.nextPage(
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeInOut);
        } else {
          await _pageController.previousPage(
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeInOut);
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
          GestureDetector(
            onVerticalDragUpdate: (details) =>
                _handleScroll(details.primaryDelta ?? 0, isMouse: false),
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
                dotColor: Colors.white38,
                spacing: 16,
                dotHeight: 12,
                dotWidth: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
