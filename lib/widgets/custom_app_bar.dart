import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/page_type.dart';
import '../language_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PageType currentPage;

  const CustomAppBar({
    super.key,
    required this.currentPage,
  });

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    final isPolish = context.watch<LanguageController>().isPolish;

    return Container(
      height: 90,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 0, 21, 65),
            Color.fromARGB(255, 0, 0, 0),
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Lewa część
          Row(
            children: [
              _buildTab(context, 'Alverdorf', 'Alverdorf', PageType.village),
              _buildDivider(),
              _buildTab(context, 'Wycieczka', 'Tour', PageType.tour),
              _buildDivider(),
              _buildTab(context, 'Strona Główna', 'Home Page', PageType.home),
            ],
          ),

          // Logo (możesz też dać jako button do /)
          _buildLogoButton(context),

          // Prawa część
          Row(
            children: [
              _buildTab(context, 'O nas', 'About', PageType.about),
              _buildDivider(),
              _buildTab(context, 'Kontakt', 'Contact', PageType.contact),
              const SizedBox(width: 16),
              _buildLangSwitcher(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTab(
    BuildContext context,
    String pl,
    String en,
    PageType pageType,
  ) {
    final isPolish = context.watch<LanguageController>().isPolish;
    final isSelected = currentPage == pageType;

    IconData icon;
    IconData iconOutlined;

    switch (pageType) {
      case PageType.tour:
        icon = Icons.school;
        iconOutlined = Icons.school_outlined;
        break;
      case PageType.village:
        icon = Icons.park;
        iconOutlined = Icons.park_outlined;
        break;
      case PageType.about:
        icon = Icons.info;
        iconOutlined = Icons.info_outline;
        break;
      case PageType.contact:
        icon = Icons.mail;
        iconOutlined = Icons.mail_outline;
        break;
      default:
        icon = Icons.home;
        iconOutlined = Icons.home_outlined;
    }

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, _routeFromPageType(pageType)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                isSelected ? icon : iconOutlined,
                color: isSelected
                    ? const Color.fromARGB(195, 255, 193, 7)
                    : const Color.fromARGB(255, 180, 180, 180),
                size: 18,
              ),
              const SizedBox(width: 4),
              Text(
                isPolish ? pl : en,
                style: TextStyle(
                  color: isSelected
                      ? Colors.amber
                      : const Color.fromARGB(255, 181, 180, 180),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          _buildUnderline(isSelected),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        '|',
        style: TextStyle(color: Colors.white54, fontSize: 24),
      ),
    );
  }

  Widget _buildUnderline(bool isSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      height: 3,
      width: isSelected ? 40 : 0,
      decoration: BoxDecoration(
        gradient: isSelected
            ? const LinearGradient(
                colors: [Colors.amber, Colors.orangeAccent],
              )
            : null,
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }

  Widget _buildLangSwitcher(BuildContext context) {
    final controller = context.read<LanguageController>();
    final isPolish = controller.isPolish;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white24),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Row(
        children: [
          InkWell(
            onTap: () => controller.setLanguage(true),
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isPolish ? Colors.amber : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'PL',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () => controller.setLanguage(false),
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: !isPolish ? Colors.amber : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'ENG',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoButton(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.pushNamed(context, '/'),
    child: Image.asset(
      'assets/logos/logo_ap.png',
      height: 45,
      fit: BoxFit.contain,
    ),
  );
}


  String _routeFromPageType(PageType page) {
    switch (page) {
      case PageType.village:
        return '/alverdorf';
      case PageType.tour:
        return '/wycieczka';
      case PageType.contact:
        return '/kontakt';
      case PageType.about:
        return '/o-nas';
      case PageType.home:
      default:
        return '/';
    }
  }
}
