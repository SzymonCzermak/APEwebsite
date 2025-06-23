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
  late final Animation<Offset> _offsetAnim1;
  late final Animation<Offset> _offsetAnim2;
  late final Animation<double> _fadeAnim1;
  late final Animation<double> _fadeAnim2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _offsetAnim1 = Tween<Offset>(
      begin: const Offset(0.0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
    ));

    _offsetAnim2 = Tween<Offset>(
      begin: const Offset(0.0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 0.7, curve: Curves.easeOut),
    ));

    _fadeAnim1 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
    ));

    _fadeAnim2 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 0.7, curve: Curves.easeIn),
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _copyEmail(BuildContext context, String email) {
    Clipboard.setData(ClipboardData(text: email));
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

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
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
    );
  }

  ButtonStyle _greenButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  ButtonStyle _amberButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.amber,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadowColor: Colors.amberAccent,
      elevation: 8,
      foregroundColor: Colors.black,
    );
  }

  ButtonStyle _pinkButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 56, 0, 239),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadowColor: const Color.fromARGB(255, 64, 86, 255).withOpacity(0.4),
      elevation: 8,
      foregroundColor: Colors.white,
    );
  }

  Widget _buildReservationBox(BuildContext context, bool isPolish) {
    return Container(
      decoration: _boxDecoration(),
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.calendar_today, size: 80, color: Colors.amber),
          const SizedBox(height: 24),
          Text(
            isPolish ? 'Rezerwacja' : 'Reservation',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            isPolish
                ? 'Skontaktuj się z naszym opiekunem rezerwacji lub zarezerwuj online.'
                : 'Get in touch with our reservation coordinator for details or book your visit online in just a few clicks.',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.white70),
          ),
          const SizedBox(height: 24),
          const Divider(color: Colors.white30, thickness: 1),
          const SizedBox(height: 16),
          const Text(
            'Bartłomiej Jacoń',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '+48 723 999 099',
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: () => _makePhoneCall('+48723999099'),
            icon: const Icon(Icons.call, color: Colors.white),
            label: Text(
              isPolish ? 'Zadzwoń' : 'Call',
              style: const TextStyle(color: Colors.white),
            ),
            style: _greenButtonStyle(),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => _copyEmail(context, 'b.jacon@gremi.pl'),
            icon: const Icon(Icons.copy, color: Colors.black),
            label: const Text(
              'b.jacon@gremi.pl',
              style: TextStyle(color: Colors.black),
            ),
            style: _amberButtonStyle(),
          ),
          const SizedBox(height: 24),
          const Divider(color: Colors.white30, thickness: 1),
          const SizedBox(height: 18),
          Text(
            isPolish ? 'Rezerwacja online:' : 'Online reservation:',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () async {
              final url = Uri.parse('https://alverniaplanet.bookero.pl');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            icon: const Icon(Icons.open_in_new, color: Colors.white),
            label: Text(
              isPolish ? 'Zarezerwuj online' : 'Book online',
              style: const TextStyle(color: Colors.white),
            ),
            style: _pinkButtonStyle(),
          ),
        ],
      ),
    );
  }

  Widget _buildContactBox(BuildContext context, bool isPolish) {
    return Container(
      decoration: _boxDecoration(),
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.mail, size: 90, color: Colors.orangeAccent),
          const SizedBox(height: 8),
          Text(
            isPolish ? 'Infolinia' : 'Hotline',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            isPolish
                ? 'Zadzwoń lub napisz – chętnie odpowiemy na pytania i pomożemy w planowaniu wizyty!'
                : 'Call or write – we’ll gladly answer your questions and help plan your visit!',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.white70),
          ),
          const SizedBox(height: 35),
          const Divider(color: Colors.white30, thickness: 1),
          const SizedBox(height: 32),
          Text(
            isPolish ? 'Telefon:' : 'Phone:',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            '+48 123 444 000',
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () => _makePhoneCall('+48123444000'),
            icon: const Icon(Icons.call, color: Colors.white),
            label: Text(
              isPolish ? 'Zadzwoń' : 'Call',
              style: const TextStyle(color: Colors.white),
            ),
            style: _greenButtonStyle(),
          ),
          const SizedBox(height: 50),
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
            onPressed: () => _copyEmail(context, 's.sambor@gremi.pl'),
            icon: const Icon(Icons.copy, color: Colors.black),
            label: const Text(
              's.sambor@gremi.pl',
              style: TextStyle(color: Colors.black),
            ),
            style: _amberButtonStyle(),
          ),
        ],
      ),
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
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 24,
                    runSpacing: 24,
                    children: [
                      FadeTransition(
                        opacity: _fadeAnim1,
                        child: SlideTransition(
                          position: _offsetAnim1,
                          child: SizedBox(
                            width: 400,
                            height: 600,
                            child: _buildReservationBox(context, isPolish),
                          ),
                        ),
                      ),
                      FadeTransition(
                        opacity: _fadeAnim2,
                        child: SlideTransition(
                          position: _offsetAnim2,
                          child: SizedBox(
                            width: 400,
                            height: 600,
                            child: _buildContactBox(context, isPolish),
                          ),
                        ),
                      ),
                    ],
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
