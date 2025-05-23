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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget _buildTab(BuildContext context, String pl, String en, PageType pageType) {
    final isPolish = context.watch<LanguageController>().isPolish;
    final isSelected = currentPage == pageType;

    return TextButton(
      onPressed: () => onTabSelected(pageType),
      child: Text(
        isPolish ? pl : en,
        style: TextStyle(
          color: isSelected ? Colors.amber : Colors.white,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isPolish = context.watch<LanguageController>().isPolish;

    return AppBar(
      title: Text(isPolish ? 'APE Strona' : 'APE Website'),
      backgroundColor: Colors.indigo,
      actions: [
        _buildTab(context, 'Strona główna', 'Home', PageType.home),
        _buildTab(context, 'Wycieczka', 'Tour', PageType.tour),
        _buildTab(context, 'Wioska', 'Village', PageType.village),
        _buildTab(context, 'O nas', 'About', PageType.about),
        _buildTab(context, 'Kontakt', 'Contact', PageType.contact),
        const SizedBox(width: 12),
        _buildLangSwitcher(context),
      ],
    );
  }

  Widget _buildLangSwitcher(BuildContext context) {
    final controller = context.read<LanguageController>();
    final isPolish = controller.isPolish;

    return DropdownButton<bool>(
      value: isPolish,
      dropdownColor: Colors.indigo,
      underline: const SizedBox(),
      icon: const Icon(Icons.language, color: Colors.white),
      onChanged: (val) => controller.setLanguage(val ?? true),
      items: const [
        DropdownMenuItem(
          value: true,
          child: Text('PL', style: TextStyle(color: Colors.white)),
        ),
        DropdownMenuItem(
          value: false,
          child: Text('EN', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
