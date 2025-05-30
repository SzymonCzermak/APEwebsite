import 'package:apewebsite/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home/home_page.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'pages/tour_page.dart';
import 'pages/village/village_page.dart';
import 'widgets/custom_app_bar.dart';
import 'models/page_type.dart';
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
      title: 'Alvernia Planet Education',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const MainScreen(),
        '/alverdorf': (context) => const VillagePage(),
        '/wycieczka': (context) => const TourPage(),
        '/kontakt': (context) => const ContactPage(),
        '/o-nas': (context) => const AboutPage(),
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
    String route;
    switch (newPage) {
      case PageType.village:
        route = '/wioska';
        break;
      case PageType.tour:
        route = '/wycieczka';
        break;
      case PageType.contact:
        route = '/kontakt';
        break;
      case PageType.about:
        route = '/o-nas';
        break;
      case PageType.home:
      default:
        route = '/';
    }

    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
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
      case PageType.home:
      default:
        return HomePage(onTabSelected: _changePage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        currentPage: _currentPage,
      ),
      body: HomePage(onTabSelected: _changePage),
    );
  }
}
