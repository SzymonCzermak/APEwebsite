import 'package:flutter/material.dart';
import '../models/page_type.dart';

class AppColors {
  static LinearGradient getGradientForPage(PageType pageType) {
    switch (pageType) {
      case PageType.home:
        return const LinearGradient(
          colors: [Color(0xFFFFA726), Color.fromARGB(255, 100, 23, 0)],
        );
      case PageType.tour:
        return const LinearGradient(
          colors: [Color(0xFFBA68C8), Color.fromARGB(255, 91, 0, 107)],
        );
      case PageType.village:
        return const LinearGradient(
          colors: [Color(0xFF8BC34A), Color.fromARGB(255, 128, 94, 0)],
        );
      default:
        return const LinearGradient(
          colors: [Colors.amber, Colors.orangeAccent],
        );
    }
  }

  static Color getColorForPage(PageType pageType) {
    switch (pageType) {
      case PageType.home:
        return const Color(0xFFFFA726);
      case PageType.tour:
        return const Color(0xFFBA68C8);
      case PageType.village:
        return const Color(0xFF8BC34A);
      default:
        return Colors.amber;
    }
  }
}
