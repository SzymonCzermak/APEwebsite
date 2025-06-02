import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  void _launchUrl(String url) {
    launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  void _navigate(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  Widget _buildGradientDivider({double width = 240}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: 2,
      width: width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black,
            Color.fromARGB(255, 0, 24, 75),
            Colors.black,
          ],
        ),
      ),
    );
  }

  Widget _hoverTextButton(BuildContext context, String label, String route) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _navigate(context, route),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _socialIconWithHandle({
    required IconData icon,
    required Color color,
    required String label,
    required String handle,
    required String url,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchUrl(url),
        child: Column(
          children: [
            FaIcon(icon, color: color, size: 28),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
            Text(handle, style: const TextStyle(color: Colors.white70, fontSize: 10)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black.withOpacity(0.7),
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Linki prawne
          Wrap(
            spacing: 20,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              _hoverTextButton(context, 'Regulamin', '/terms'),
              _hoverTextButton(context, 'Polityka prywatności', '/privacy'),
              _hoverTextButton(context, 'Polityka cookies', '/cookies'),
              _hoverTextButton(context, 'Ochrona małoletnich', '/children-protection'),
            ],
          ),

          _buildGradientDivider(width: 600),

          // Logo + autor
          GestureDetector(
  onTap: () => _launchUrl('https://zermuartweb.web.app'),
  child: Column(
    children: [
      const Text(
        'Design oraz realizacja strony',
        style: TextStyle(
          fontSize: 14,
          color: Colors.white70,
          decoration: TextDecoration.underline,
        ),
      ),
      const SizedBox(height: 6),
      Text(
        'Szymon Czermak (zermuart)',
        style: GoogleFonts.imFellEnglishSc(
          fontSize: 12,
          color: Colors.white,
          shadows: const [
            Shadow(blurRadius: 6, color: Colors.black87, offset: Offset(0, 2)),
          ],
        ),
      ),
      const SizedBox(height: 12),
      Image.asset('assets/logos/logo_zermuart.png', height: 32),
    ],
  ),
),


          _buildGradientDivider(width: 400),

          // Social Media
          Column(
            children: [
              const Text(
                'Nasze Social Media',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 32,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  _socialIconWithHandle(
                    icon: FontAwesomeIcons.instagram,
                    color: Colors.pinkAccent,
                    label: 'Instagram EDU',
                    handle: '@alverniaplanet_edu',
                    url: 'https://www.instagram.com/alverniaplanet_edu/',
                  ),
                  _socialIconWithHandle(
                    icon: FontAwesomeIcons.instagram,
                    color: Colors.pink,
                    label: 'Instagram',
                    handle: '@alverniaplanet',
                    url: 'https://www.instagram.com/alverniaplanet/',
                  ),
                  _socialIconWithHandle(
                    icon: FontAwesomeIcons.facebook,
                    color: Colors.blueAccent,
                    label: 'Facebook',
                    handle: '/alverniaplanet',
                    url: 'https://www.facebook.com/alverniaplanet/',
                  ),
                  _socialIconWithHandle(
                    icon: FontAwesomeIcons.tiktok,
                    color: Colors.white,
                    label: 'TikTok',
                    handle: '@alverniaplanetedu',
                    url: 'https://www.tiktok.com/@alverniaplanetedu',
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 32),
          const Text(
            '© 2025 Alvernia Planet. Wszystkie prawa zastrzeżone.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white38, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
