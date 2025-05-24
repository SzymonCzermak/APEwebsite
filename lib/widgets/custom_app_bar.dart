import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/page_type.dart';
import '../language_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function(PageType) onTabSelected;
  final PageType currentPage;

  const CustomAppBar({
    super.key,
    required this.onTabSelected,
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
            Color.fromARGB(255, 134, 76, 0),
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
              _buildTab(context, 'Wycieczka', 'Tour', PageType.tour),
              _buildDivider(),
              _buildTab(context, 'Wioska', 'Village', PageType.village),
            ],
          ),

          // Logo jako Home
          _buildLogoButton(),

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

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        '|',
        style: TextStyle(color: Colors.white54, fontSize: 24),
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
        icon = Icons.circle;
        iconOutlined = Icons.circle_outlined;
    }

    return GestureDetector(
      onTap: () => onTabSelected(pageType),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                isSelected ? icon : iconOutlined,
                color: isSelected ? Colors.amber : Colors.white,
                size: 18,
              ),
              const SizedBox(width: 4),
              Text(
                isPolish ? pl : en,
                style: TextStyle(
                  color: isSelected ? Colors.amber : Colors.white,
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

  Widget _buildLogoButton() {
    final isSelected = currentPage == PageType.home;

    return GestureDetector(
      onTap: () => onTabSelected(PageType.home),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/logos/logo_ap.png',
            height: 36,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 6),
          _buildUnderline(isSelected),
        ],
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

    return Row(
      children: [
        GestureDetector(
          onTap: () => controller.setLanguage(true),
          child: Text(
            'PL',
            style: TextStyle(
              color: isPolish
                  ? const Color.fromARGB(255, 0, 46, 172)
                  : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () => controller.setLanguage(false),
          child: Text(
            'ENG',
            style: TextStyle(
              color: !isPolish ? Colors.amber : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
