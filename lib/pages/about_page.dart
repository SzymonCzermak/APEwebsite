import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'To jest strona "O nas"',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
