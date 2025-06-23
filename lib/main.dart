import 'package:apewebsite/language_controller.dart';
import 'package:apewebsite/pages/contact/privacy_policy_page.dart';
import 'package:apewebsite/pages/contact/terms_page.dart';
import 'package:apewebsite/pages/contact/children_protection_page.dart';
import 'package:apewebsite/pages/contact/coockie_policy_page.dart';
import 'package:apewebsite/pages/about_page.dart';
import 'package:apewebsite/pages/contact/contact_page.dart';
import 'package:apewebsite/pages/tour/tour_page.dart';
import 'package:apewebsite/pages/village/village_page.dart';
import 'package:apewebsite/pages/home/home_page.dart';
import 'package:apewebsite/social_media_page.dart';
import 'package:apewebsite/widgets/custom_app_bar.dart';
import 'package:apewebsite/models/page_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    ChangeNotifierProvider(
      create: (_) => LanguageController(),
      child: const MyWebsite(),
    ),
  );
}

class MyWebsite extends StatelessWidget {
  const MyWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alvernia Planet Edu - tu zaczyna się filmowa przygoda',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const MainScreen(),
        '/alverdorf': (context) => const VillagePage(),
        '/wycieczka': (context) => const TourPage(),
        '/kontakt': (context) => const ContactPage(),
        '/o-nas': (context) => const AboutPage(),
        '/terms': (context) => const TermsPage(),
        '/privacy': (context) => const PrivacyPolicyPage(),
        '/children-protection': (context) => const ChildrenProtectionPage(),
        '/cookies': (context) => const CookiesPolicyPage(),
        '/social-media': (context) => const SocialMediaPage(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageType _currentPage = PageType.home;

  void _changePage(PageType newPage) {
    setState(() {
      _currentPage = newPage;
    });
  }

  Widget _getPageWidget() {
    switch (_currentPage) {
      case PageType.about:
        return const AboutPage();
      case PageType.contact:
        return const ContactPage();
      case PageType.tour:
        return const TourPage();
      case PageType.village:
        return const VillagePage();
      case PageType.social:
        return const SocialMediaPage();
      case PageType.home:
      default:
        return HomePage(onTabSelected: _changePage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(currentPage: _currentPage),
      body: _getPageWidget(),
    );
  }
}
