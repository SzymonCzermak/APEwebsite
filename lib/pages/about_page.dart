import 'package:flutter/material.dart';
import 'package:apewebsite/widgets/custom_app_bar.dart';
import 'package:apewebsite/models/page_type.dart';
import 'package:provider/provider.dart';
import 'package:apewebsite/language_controller.dart';
import 'package:apewebsite/background/AnimatedStarsBackground.dart';
import 'package:apewebsite/custom_footer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isPolish = context.watch<LanguageController>().isPolish;
    final screenWidth = MediaQuery.of(context).size.width;

    double getFont(double large, double small) =>
        screenWidth > 800 ? large : small;

    final people = [
      {
        'image': 'assets/o_nas/gaba.png',
        'name': isPolish ? 'Gabriela Rzepa' : 'Gabriela Rzepa',
        'desc': isPolish
            ? 'CEO & wizjonerka. Odpowiada za rozwój i strategię.'
            : 'CEO & visionary. Responsible for development and strategy.',
      },
      {
        'image': 'assets/o_nas/paulina.png',
        'name': isPolish ? 'Paulina Brożek' : 'Paulina Brożek',
        'desc': isPolish
            ? 'Kierowniczka projektów edukacyjnych i copywriterka.'
            : 'Education project manager and copywriter.',
      },
      {
        'image': 'assets/o_nas/michalina.png',
        'name': isPolish ? 'Michalina Duda' : 'Michalina Duda',
        'desc': isPolish
            ? 'Koordynatorka social mediów i kreatywna dusza.'
            : 'Social media coordinator and creative spirit.',
      },
      {
        'image': 'assets/o_nas/asia.png',
        'name': isPolish ? 'Joanna Majda' : 'Joanna Majda',
        'desc': isPolish
            ? 'Specjalistka ds. edukacji i animacji wideo.'
            : 'Education and video animation specialist.',
      },
    ];

    return Scaffold(
      appBar: const CustomAppBar(currentPage: PageType.about),
      body: Stack(
        children: [
          const Positioned.fill(child: AnimatedStarsBackground()),
          SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 32),
                Text(
                  isPolish ? 'Poznaj nasz zespół' : 'Meet our team',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: getFont(64, 36),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  isPolish
                      ? 'Tworzymy z pasją, edukujemy z radością.'
                      : 'We create with passion and educate with joy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: getFont(18, 14),
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 48),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth > 800;
                    return Wrap(
                      spacing: 32,
                      runSpacing: 32,
                      alignment: WrapAlignment.center,
                      children: people.map((person) {
                        return SizedBox(
                          width: isWide ? constraints.maxWidth / 2 - 48 : 300,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  person['image']!,
                                  width: 250,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                person['name']!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                person['desc']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
                const SizedBox(height: 64),
                const CustomFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
