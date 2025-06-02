import 'package:apewebsite/background/AnimatedStarsBackground.dart';
import 'package:apewebsite/custom_footer.dart';
import 'package:flutter/material.dart';
import 'package:apewebsite/widgets/custom_app_bar.dart';
import 'package:apewebsite/models/page_type.dart';
import 'package:provider/provider.dart';
import 'package:apewebsite/language_controller.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _copyEmail(BuildContext context) {
    Clipboard.setData(const ClipboardData(text: 's.sambor@gremi.pl'));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          context.read<LanguageController>().isPolish
              ? 'Skopiowano adres e-mail!'
              : 'Email address copied!',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _makePhoneCall(String number) async {
    final uri = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            context.read<LanguageController>().isPolish
                ? 'Nie można wykonać połączenia.'
                : 'Could not launch phone dialer.',
          ),
        ),
      );
    }
  }

  Widget _buildContactContent(BuildContext context, bool isPolish) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.mail, size: 80, color: Colors.orangeAccent),
        const SizedBox(height: 24),
        Text(
          isPolish ? 'Skontaktuj się z nami' : 'Get in touch with us',
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          isPolish
              ? 'Napisz lub zadzwoń poniżej. Z chęcią odpowiemy na Twoje pytania i pomożemy w zaplanowaniu niezapomnianej wizyty!'
              : 'Write or call us below. We’re happy to answer your questions and help you plan an unforgettable visit!',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, color: Colors.white70),
        ),
        const SizedBox(height: 24),
        const Divider(color: Colors.white30, thickness: 1),
        const SizedBox(height: 16),
        Text(
          isPolish ? 'Telefon:' : 'Phone:',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '+48 123 444 000',
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),
        const SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: () => _makePhoneCall('+48123444000'),
          icon: const Icon(Icons.call, color: Colors.white),
          label: Text(isPolish ? 'Zadzwoń' : 'Call',
              style: const TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Divider(color: Colors.white30, thickness: 1),
        const SizedBox(height: 16),
        Text(
          isPolish ? 'Mail:' : 'Mail:',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: () => _copyEmail(context),
          icon: const Icon(Icons.copy, color: Colors.black),
          label: const Text(
            's.sambor@gremi.pl',
            style: TextStyle(color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            shadowColor: Colors.amberAccent,
            elevation: 8,
          ),
        ),
        const SizedBox(height: 32),
        
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isPolish = context.watch<LanguageController>().isPolish;
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return Scaffold(
      appBar: const CustomAppBar(currentPage: PageType.contact),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const AnimatedStarsBackground(),
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24.0 : 64.0,
                    vertical: 32.0,
                  ),
                  child: SlideTransition(
                    position: _offsetAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 800),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF2E2E2E), Color(0xFF1A1A1A)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orangeAccent.withOpacity(0.4),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(32.0),
                          child: _buildContactContent(context, isPolish),
                        ),
                      ),
                    ),
                  ),
                ),
                const CustomFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
