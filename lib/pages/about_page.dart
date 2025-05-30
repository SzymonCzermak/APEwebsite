import 'package:flutter/material.dart';
import 'package:apewebsite/widgets/custom_app_bar.dart';
import 'package:apewebsite/models/page_type.dart';
import 'package:provider/provider.dart';
import 'package:apewebsite/language_controller.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isPolish = context.watch<LanguageController>().isPolish;

    return Scaffold(
      appBar: const CustomAppBar(currentPage: PageType.about),
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.construction, size: 80, color: Colors.orangeAccent),
              const SizedBox(height: 24),
              Text(
                isPolish ? 'Strona w budowie' : 'Page under construction',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                isPolish
                    ? 'Wracaj wkrótce – pracujemy nad czymś wyjątkowym!'
                    : 'Check back soon – we\'re working on something special!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
