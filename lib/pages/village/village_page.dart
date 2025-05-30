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
          const AnimatedForestSpirits(),
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
                activeDotColor: const Color.fromARGB(255, 201, 114, 0),
                dotHeight: 12,
                dotWidth: 12,
                spacing: 16,
                dotColor:
                    const Color.fromARGB(255, 212, 212, 212).withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedVillageStep extends StatefulWidget {
  final String image;

  const _AnimatedVillageStep({required this.image});

  @override
  State<_AnimatedVillageStep> createState() => _AnimatedVillageStepState();
}

class _AnimatedVillageStepState extends State<_AnimatedVillageStep>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _offset = Tween<Offset>(begin: const Offset(0, 0.05), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final maxContentWidth = screenWidth * 0.7;
    final height = maxContentWidth / (11 / 8);

    return Center(
      child: SlideTransition(
        position: _offset,
        child: FadeTransition(
          opacity: _opacity,
          child: Container(
            width: maxContentWidth,
            height: height,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Image.asset(
              widget.image,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.medium,
            ),
          ),
        ),
      ),
    );
  }
}
