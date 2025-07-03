import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/page_type.dart';
import 'package:icons_plus/icons_plus.dart';
import '../language_controller.dart';
import 'package:apewebsite/styles/color.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PageType currentPage;

  const CustomAppBar({super.key, required this.currentPage});

  static const _bookeroUrl = 'https://alverniaplanet.bookero.pl/';

  Future<void> _launchBookero() async {
    final uri = Uri.parse(_bookeroUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $_bookeroUrl');
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    final isPolish = context.watch<LanguageController>().isPolish;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 1350;

    return Container(
      height: 90,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            
            Color.fromARGB(255, 0, 24, 75),
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
                PopupMenuButton<String>(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  color: Colors.black87,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onSelected: (value) {
                    if (value == 'bookero') {
                      _launchBookero();
                    } else {
                      Navigator.pushNamed(context, _routeFromPageType(PageType.values.firstWhere((e) => e.name == value)));
                    }
                  },
                  itemBuilder: (context) => [
                    _buildMenuItem(context, PageType.home, isPolish ? 'Strona Główna' : 'Home Page', Icons.home),
                    _buildMenuItem(context, PageType.village, isPolish ? 'Alverdorf' : 'Alverdorf', Icons.park),
                    _buildMenuItem(context, PageType.tour, isPolish ? 'Wycieczka' : 'Tour', Icons.school),
                    _buildMenuItem(context, PageType.about, isPolish ? 'O nas' : 'About', Icons.info),
                    _buildMenuItem(context, PageType.contact, isPolish ? 'Kontakt' : 'Contact', Icons.mail),
                    _buildMenuItem(context, PageType.social, isPolish ? 'Social' : 'Social', Icons.share),
                    PopupMenuItem<String>(
                      value: 'bookero',
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_month_rounded, color: Colors.amber, size: 18),
                          const SizedBox(width: 8),
                          const Text('Rezerwacja', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                )
              else
                Row(
                  children: [
                    _buildTab(context, 'Alverdorf', 'Alverdorf', PageType.village),
                    _buildDivider(),
                    _buildTab(context, 'Wycieczka', 'Tour', PageType.tour),
                    _buildDivider(),
                    _buildTab(context, 'Strona Główna', 'Home Page', PageType.home),
                  ],
                ),
              if (!isMobile)
                Row(
                  children: [
                    _buildTab(context, 'O nas', 'About', PageType.about),
                    _buildDivider(),
                    _buildTab(context, 'Kontakt', 'Contact', PageType.contact),
                    _buildDivider(),
                    _buildTab(context, 'Social', 'Social', PageType.social),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: _launchBookero,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(35),
                          border: Border.all(color: const Color.fromARGB(255, 117, 87, 0), width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 67, 50, 0),
                              offset: const Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_month_rounded, color: Colors.black87, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              isPolish ? 'Rezerwacja' : 'Booking',
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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

  PopupMenuItem<String> _buildMenuItem(BuildContext context, PageType page, String label, IconData icon) {
    return PopupMenuItem<String>(
      value: page.name,
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 18),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

Widget _buildTab(BuildContext context, String pl, String en, PageType pageType) {
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
    case PageType.social:
      icon = Icons.share;
      iconOutlined = Icons.share_outlined;
      break;
    default:
      icon = Icons.home;
      iconOutlined = Icons.home_outlined;
  }

  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        hoverColor: Colors.white10,
        onTap: () => Navigator.pushNamed(context, _routeFromPageType(pageType)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(
                    isSelected ? icon : iconOutlined,
                    color: isSelected ? mainColor : const Color.fromARGB(255, 180, 180, 180),
                    size: 18,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    isPolish ? pl : en,
                    style: TextStyle(
                      color: isSelected ? mainColor : const Color.fromARGB(255, 181, 180, 180),
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
        ),
      ),
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
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 6 : 10, vertical: 4),
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
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 6 : 10, vertical: 4),
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
      case PageType.social:
        return '/social-media';
      case PageType.home:
      default:
        return '/';
    }
  }
}
