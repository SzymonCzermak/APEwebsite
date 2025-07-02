import 'package:flutter/material.dart';
import 'package:apewebsite/widgets/custom_app_bar.dart';
import 'package:apewebsite/models/page_type.dart';
import 'package:provider/provider.dart';
import 'package:apewebsite/language_controller.dart';
import 'package:apewebsite/background/AnimatedStarsBackground.dart';
import 'package:apewebsite/custom_footer.dart';
import 'package:photo_view/photo_view.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  void openImageFullscreen(BuildContext context, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          backgroundColor: Colors.black,
          body: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Center(
              child: Hero(
                tag: imagePath,
                child: PhotoView(
                  imageProvider: AssetImage(imagePath),
                  backgroundDecoration: const BoxDecoration(color: Colors.black),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered * 2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isPolish = context.watch<LanguageController>().isPolish;
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 800;

    double getFont(double large, double small) => isWide ? large : small;

    final people = [
      {
        'image': 'assets/o_nas/paulina.png',
        'name': isPolish ? 'Paulina' : 'Paulina',
        'desc': isPolish
            ? 'Pasjonatka makijażu i charakteryzacji, potrafi przemienić każdy pomysł w artystyczne dzieło.'
            : 'A makeup and special effects enthusiast who turns every idea into a work of art.',
      },
      {
        'image': 'assets/o_nas/asia.png',
        'name': isPolish ? 'Joanna' : 'Joanna',
        'desc': isPolish
            ? 'Miłośniczka kina, która kocha seriale i potrafi godzinami zanurzać się w filmowe światy.'
            : 'A film lover with a deep passion for series, able to dive into cinematic worlds for hours.',
      },
      {
        'image': 'assets/o_nas/michalina.png',
        'name': isPolish ? 'Michalina' : 'Michalina',
        'desc': isPolish
            ? 'Kreatywna dusza, która wnosi świeżość, energię i pomysłowość do każdego projektu.'
            : 'A creative soul who brings freshness, energy, and imagination to every project.',
      },
    ];

    Widget buildPersonCard(Map<String, String> person, double imageSize) {
      return Container(
        width: imageSize,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                person['image']!,
                width: imageSize,
                height: imageSize,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              person['name']!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              isPolish ? 'Przewodniczka' : 'Guide',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white60,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              person['desc']!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      );
    }

    List<Widget> buildGrid(double imageSize) {
      if (isWide) {
        return [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildPersonCard(people[0], imageSize),
              const SizedBox(width: 32),
              buildPersonCard(people[1], imageSize),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildPersonCard(people[2], imageSize),
            ],
          ),
        ];
      } else {
        return people
            .map((person) => Padding(
                  padding: const EdgeInsets.only(bottom: 64),
                  child: buildPersonCard(person, screenWidth * 0.7),
                ))
            .toList();
      }
    }

    final imageSize = isWide ? 350.0 : screenWidth * 0.7;

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
                ...buildGrid(imageSize),
                const SizedBox(height: 64),

                // Sekcja: Wnętrza Alverni
                Text(
                  isPolish ? 'Wnętrza Alverni' : 'Interiors of Alvernia',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: getFont(48, 28),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  isPolish
                      ? 'Przestrzenie, które budzą wyobraźnię – inspirowane kosmosem i technologią.'
                      : 'Spaces that spark imagination – inspired by space and technology.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: getFont(16, 13),
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 32),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 24,
                  runSpacing: 24,
                  children: List.generate(4, (index) {
                    final path = 'assets/galery/AP/${index + 1}.png';
                    return GestureDetector(
                      onTap: () => openImageFullscreen(context, path),
                      child: Hero(
                        tag: path,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            path,
                            width: isWide ? 300 : screenWidth * 0.8,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 64),

                // Sekcja: Wioska Netflixa
                Text(
                  isPolish ? 'Filmowa Wioska Netflixa' : 'Netflix Filming Village',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: getFont(48, 28),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  isPolish
                      ? 'Prawdziwa filmowa lokacja wykorzystywana w międzynarodowych produkcjach.'
                      : 'A real filming location used in international productions.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: getFont(16, 13),
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 32),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 24,
                  runSpacing: 24,
                  children: List.generate(4, (index) {
                    final path = 'assets/galery/VL/${index + 1}.png';
                    return GestureDetector(
                      onTap: () => openImageFullscreen(context, path),
                      child: Hero(
                        tag: path,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            path,
                            width: isWide ? 300 : screenWidth * 0.8,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
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
