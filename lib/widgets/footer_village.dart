// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
// ignore: undefined_prefixed_name
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterVillage extends StatelessWidget {
  const FooterVillage({super.key});

  @override
  Widget build(BuildContext context) {
    const String viewId = 'bookero-iframe';

    if (kIsWeb) {
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
        viewId,
        (int viewId) => html.IFrameElement()
          ..src = 'https://alverniaplanet.bookero.pl/'
          ..style.border = 'none'
          ..style.width = '100%'
          ..style.height = '1000px'
          ..allowFullscreen = true,
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            'ZAREZERWUJ TĘ WSPANIAŁĄ PRZYGODĘ JUŻ TERAZ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 6,
                  color: Colors.black87,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              height: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const HtmlElementView(viewType: viewId),
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'Odwiedź nas na social mediach!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 32,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              _buildSocialIcon(
                icon: FontAwesomeIcons.instagram,
                label: 'Instagram',
                color: Colors.pinkAccent,
                onTap: () =>
                    html.window.open('https://instagram.com/example', '_blank'),
              ),
              _buildSocialIcon(
                icon: FontAwesomeIcons.facebook,
                label: 'Facebook',
                color: Colors.blueAccent,
                onTap: () =>
                    html.window.open('https://facebook.com/example', '_blank'),
              ),
              _buildSocialIcon(
                icon: FontAwesomeIcons.globe,
                label: 'Strona internetowa',
                color: const ui.Color.fromARGB(255, 3, 244, 15),
                onTap: () =>
                    html.window.open('https://twitter.com/example', '_blank'),
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildSocialIcon({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const ui.Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const ui.Color.fromARGB(136, 0, 0, 0),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              blurRadius: 12,
              spreadRadius: 2,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(icon, color: color, size: 28),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
