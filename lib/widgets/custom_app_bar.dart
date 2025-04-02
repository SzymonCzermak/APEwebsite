import 'package:apewebsite/models/page_type.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function(PageType) onTabSelected;

  CustomAppBar({required this.onTabSelected});

  @override
  final Size preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('APE Website'),
      backgroundColor: Colors.indigo,
      actions: [
        TextButton(
          onPressed: () => onTabSelected(PageType.home),
          child: Text('Strona główna', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () => onTabSelected(PageType.about),
          child: Text('O nas', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () => onTabSelected(PageType.contact),
          child: Text('Kontakt', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
