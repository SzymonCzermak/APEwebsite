import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/page_type.dart';
import 'package:icons_plus/icons_plus.dart';
import '../language_controller.dart';
import 'package:apewebsite/styles/color.dart'; // poprawiony import

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PageType currentPage;

  const CustomAppBar({super.key, required this.currentPage});

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    final isPolish = context.watch<LanguageController>().isPolish;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (isMobile)
                PopupMenuButton<PageType>(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  color: Colors.black87,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onSelected: (page) {
                    Navigator.pushNamed(context, _routeFromPageType(page));
                  },
                  itemBuilder: (context) => [
                    _buildMenuItem(context, PageType.home,
                        isPolish ? 'Strona Główna' : 'Home Page', Icons.home),
                    _buildMenuItem(context, PageType.village,
                        isPolish ? 'Alverdorf' : 'Alverdorf', Icons.park),
                    _buildMenuItem(context, PageType.tour,
                        isPolish ? 'Wycieczka' : 'Tour', Icons.school),
                    _buildMenuItem(context, PageType.about,
                        isPolish ? 'O nas' : 'About', Icons.info),
                    _buildMenuItem(context, PageType.contact,
                        isPolish ? 'Kontakt' : 'Contact', Icons.mail),
                  ],
                )
              else
                Row(
                  children: [
                    _buildTab(
                        context, 'Alverdorf', 'Alverdorf', PageType.village),
                    _buildDivider(),
                    _buildTab(context, 'Wycieczka', 'Tour', PageType.tour),
                    _buildDivider(),
                    _buildTab(
                        context, 'Strona Główna', 'Home Page', PageType.home),
                  ],
                ),
              if (!isMobile)
                Row(
                  children: [
                    _buildTab(context, 'O nas', 'About', PageType.about),
                    _buildDivider(),
                    _buildTab(context, 'Kontakt', 'Contact', PageType.contact),
                    const SizedBox(width: 16),
                    _buildLangSwitcher(context, isMobile: false),
                  ],
                )
              else
                _buildLangSwitcher(context, isMobile: true),
            ],
          ),
          _buildLogoButton(context, isMobile),
        ],
      ),
    );
  }

  PopupMenuItem<PageType> _buildMenuItem(
      BuildContext context, PageType page, String label, IconData icon) {
    return PopupMenuItem<PageType>(
      value: page,
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 18),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Colors.white)),
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
    final gradient = AppColors.getGradientForPage(pageType);
    final mainColor = AppColors.getColorForPage(pageType);

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
                    ? mainColor
                    : const Color.fromARGB(255, 180, 180, 180),
                size: 18,
              ),
              const SizedBox(width: 4),
              Text(
                isPolish ? pl : en,
                style: TextStyle(
                  color: isSelected
                      ? mainColor
                      : const Color.fromARGB(255, 181, 180, 180),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          _buildUnderline(isSelected, gradient),
        ],
      ),
    );
  }

  Widget _buildUnderline(bool isSelected, LinearGradient gradient) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      height: 3,
      width: isSelected ? 40 : 0,
      decoration: BoxDecoration(
        gradient: isSelected ? gradient : null,
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text('|', style: TextStyle(color: Colors.white54, fontSize: 24)),
    );
  }

  Widget _buildLangSwitcher(BuildContext context, {required bool isMobile}) {
    final controller = context.read<LanguageController>();
    final isPolish = controller.isPolish;

    return Container(
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white24),
      ),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 4 : 6, vertical: 2),
      child: Row(
        children: [
          InkWell(
            onTap: () => controller.setLanguage(true),
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 6 : 10, vertical: 4),
              decoration: BoxDecoration(
                color: isPolish ? Colors.amber : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                width: isMobile ? 24 : 30,
                height: isMobile ? 16 : 20,
                child: Flag(Flags.poland),
              ),
            ),
          ),
          InkWell(
            onTap: () => controller.setLanguage(false),
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 6 : 10, vertical: 4),
              decoration: BoxDecoration(
                color: !isPolish ? Colors.amber : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                width: isMobile ? 24 : 30,
                height: isMobile ? 16 : 20,
                child: Flag(Flags.united_kingdom),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoButton(BuildContext context, bool isMobile) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/'),
      child: Image.asset(
        'assets/logos/logo_ap.png',
        height: isMobile ? 38 : 45,
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
