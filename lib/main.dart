import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'pages/tour_page.dart';
import 'pages/village_page.dart';
import 'widgets/custom_app_bar.dart';
import 'models/page_type.dart';

void main() {
  runApp(const MyWebsite());
}

class MyWebsite extends StatelessWidget {
  const MyWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web SPA',
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
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
      case PageType.home:
      default:
        return HomePage(onTabSelected: _changePage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTabSelected: _changePage,
        currentPage: _currentPage,
      ),
      body: _getPageWidget(),
    );
  }
}
