import 'package:flutter/material.dart';

class AppButtonStyles {
  static ButtonStyle responsive({
    required double screenWidth,
    Color backgroundColor = const Color(0xFF673AB7),
    Color textColor = Colors.white,
    double borderRadius = 12,
  }) {
    final bool isMobile = screenWidth < 600;
    final bool isTablet = screenWidth >= 600 && screenWidth < 900;

    double fontSize = isMobile
        ? 16
        : isTablet
            ? 18
            : 20;

    EdgeInsets padding = isMobile
        ? const EdgeInsets.symmetric(horizontal: 20, vertical: 12)
        : isTablet
            ? const EdgeInsets.symmetric(horizontal: 24, vertical: 14)
            : const EdgeInsets.symmetric(horizontal: 28, vertical: 16);

    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: textColor,
      padding: padding,
      textStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: 4,
    );
  }
}
