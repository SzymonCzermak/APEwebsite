import 'package:flutter/material.dart';
import 'package:apewebsite/models/page_type.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function(PageType) onTabSelected;
  final PageType currentPage;

  
   CustomAppBar({
    super.key,
    required this.onTabSelected,
    required this.currentPage,
  });

  @override
  final Size preferredSize = Size.fromHeight(kToolbarHeight);

  Widget _buildTab(String label, PageType pageType) {
    final isSelected = currentPage == pageType;

    return TextButton(
      onPressed: () => onTabSelected(pageType),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.amber : Colors.white,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('APE Website'),
      backgroundColor: Colors.indigo,
      actions: [
        _buildTab('Strona główna', PageType.home),
        _buildTab('Wycieczka', PageType.tour),
        _buildTab('Wioska', PageType.village),
        _buildTab('O nas', PageType.about),
        _buildTab('Kontakt', PageType.contact),
      ],
    );
  }
}
