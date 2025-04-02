import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'widgets/custom_app_bar.dart';
import 'models/page_type.dart'; // <- enum jest tutaj

void main() {
  runApp(MyWebsite());
}

class MyWebsite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web SPA',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
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
        return AboutPage();
      case PageType.contact:
        return ContactPage();
      case PageType.home:
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onTabSelected: _changePage),
      body: _getPageWidget(),
    );
  }
}
