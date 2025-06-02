// ignore: avoid_web_libraries_in_flutter
import 'dart:ui_web' as ui;
import 'dart:html' as html;
import 'package:apewebsite/custom_footer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apewebsite/language_controller.dart';
import 'package:apewebsite/widgets/custom_app_bar.dart';
import 'package:apewebsite/models/page_type.dart';
import 'package:apewebsite/background/AnimatedStarsBackground.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaPage extends StatelessWidget {
  const SocialMediaPage({super.key});

  Widget _iframeWidget(String url, String viewType,
      {double width = 300, double height = 500}) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(viewType, (int viewId) {
      final iframe = html.IFrameElement()
        ..src = url
        ..style.border = 'none'
        ..width = '${width.toInt()}'
        ..height = '${height.toInt()}';
      return iframe;
    });

    return SizedBox(
      width: width,
      height: height,
      child: HtmlElementView(viewType: viewType),
    );
  }

  void _launchURL(String url) {
    html.window.open(url, '_blank');
  }

  Widget _fancySocialButton({
    required String label,
    required IconData icon,
    required Color color,
    required String url,
    required String nickname,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: () => _launchURL(url),
          borderRadius: BorderRadius.circular(14),
          child: Container(
            width: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  blurRadius: 24,
                  spreadRadius: 2,
                  offset: const Offset(0, 6),
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.9),
                  color.withOpacity(0.6),
                  color.withOpacity(0.9),
                ],
                stops: const [0.0, 0.5, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(icon, color: Colors.white, size: 20),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                      shadows: [
                        Shadow(
                          color: Colors.black54,
                          offset: Offset(0, 1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          nickname,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.white70,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isPolish = context.watch<LanguageController>().isPolish;
    final screenWidth = MediaQuery.of(context).size.width;

    double getResponsiveFont(double large, double small) =>
        screenWidth > 800 ? large : small;

    return Scaffold(
      appBar: const CustomAppBar(currentPage: PageType.social),
      body: Stack(
        children: [
          const Positioned.fill(child: AnimatedStarsBackground()),
          Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 32),
                  Text(
                    isPolish ? 'Nasze Social Media' : 'Our Social Media',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: getResponsiveFont(80, 40),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isPolish
                        ? 'To nie tylko reklamy — to rozrywkowe, kreatywne i edukacyjne treści, które pokochasz!'
                        : 'Not just ads — entertaining, creative and educational content you\'ll love!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: getResponsiveFont(16, 14),
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 48),

                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 24,
                    runSpacing: 24,
                    children: [
                      _fancySocialButton(
                        label: 'Instagram EDU',
                        icon: FontAwesomeIcons.instagram,
                        color: Colors.pink,
                        url: 'https://www.instagram.com/alverniaplanet_edu/',
                        nickname: '@alverniaplanet_edu',
                      ),
                      _fancySocialButton(
                        label: 'Instagram',
                        icon: FontAwesomeIcons.instagram,
                        color: Colors.pinkAccent,
                        url: 'https://www.instagram.com/alverniaplanet/',
                        nickname: '@alverniaplanet',
                      ),
                      _fancySocialButton(
                        label: 'TikTok',
                        icon: FontAwesomeIcons.tiktok,
                        color: Colors.white,
                        url: 'https://www.tiktok.com/@alverniaplanetedu',
                        nickname: '@alverniaplanetedu',
                      ),
                      _fancySocialButton(
                        label: 'Facebook',
                        icon: FontAwesomeIcons.facebookF,
                        color: Colors.blueAccent,
                        url: 'https://www.facebook.com/alverniaplanet/',
                        nickname: '/alverniaplanet',
                      ),
                    ],
                  ),

                  const SizedBox(height: 64),
                  Text(
                    isPolish ? 'Polecane materiały' : 'Featured Content',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: getResponsiveFont(22, 18),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'TikTok',
                    style: TextStyle(
                      fontSize: getResponsiveFont(20, 16),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      _iframeWidget(
                        'https://www.tiktok.com/embed/v2/7392286367054662945',
                        'tiktok1',
                        height: 600,
                      ),
                      _iframeWidget(
                        'https://www.tiktok.com/embed/v2/7477934450861542678',
                        'tiktok2',
                        height: 600,
                      ),
                      _iframeWidget(
                        'https://www.tiktok.com/embed/v2/7506183746618526998',
                        'tiktok3',
                        height: 600,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Container(
                    height: 2,
                    width: 120,
                    color: Colors.white24,
                    margin: const EdgeInsets.symmetric(vertical: 24),
                  ),
                  Text(
                    'Instagram Reels',
                    style: TextStyle(
                      fontSize: getResponsiveFont(20, 16),
                      fontWeight: FontWeight.bold,
                      color: Colors.pink[200],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      _iframeWidget(
                        'https://www.instagram.com/reel/DHLinadtpso/embed',
                        'insta1',
                      ),
                      _iframeWidget(
                        'https://www.instagram.com/reel/DEkDZYit5h5/embed',
                        'insta2',
                      ),
                      _iframeWidget(
                        'https://www.instagram.com/reel/DBJ2b0eNJsg/embed',
                        'insta3',
                      ),
                    ],
                  ),
                  const SizedBox(height: 64),
                  const CustomFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
