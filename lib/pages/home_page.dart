import 'package:apewebsite/widgets/background_conteiner.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:apewebsite/models/page_type.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class HomePage extends StatelessWidget {
  final void Function(PageType) onTabSelected;

  const HomePage({super.key, required this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BackgroundContainer(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        
                        Text(
                          'Wytamy w Alvernia Planet!',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Wybierz atrakcję!',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                  _buildBox(
                    context,
                    'Wycieczka Edukacyjna',
                    'Weź udział w niezapomnianej podróży po świecie nauki i filmu!',
                    'assets/home_page/Education.png',
                    PageType.tour,
                  ),
                  _buildBox(
                    context,
                    'Wioska Alverdorf',
                    'Przenieś się do etnicznej wioski i wciel się w bohaterów z różnych kultur!',
                    'assets/home_page/Alvdorf.png',
                    PageType.village,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBox(
    BuildContext context,
    String title,
    String description,
    String backgroundImagePath,
    PageType destinationType,
  ) {
    final ValueNotifier<bool> isHovered = ValueNotifier(false);

    return GestureDetector(
      onTap: () => onTabSelected(destinationType),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1000),
          child: MouseRegion(
            // 🔁 teraz tu!
            onEnter: (_) => isHovered.value = true,
            onExit: (_) => isHovered.value = false,
            child: AspectRatio(
              aspectRatio: 17.05 / 10,
              child: Container(
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(backgroundImagePath),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.3),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    ValueListenableBuilder<bool>(
                      valueListenable: isHovered,
                      builder: (context, hovered, _) {
                        final visible = hovered || !kIsWeb;
                        return AnimatedOpacity(
                          opacity: visible ? 0.6 : 0.0,
                          duration: Duration(milliseconds: 300),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: ValueListenableBuilder<bool>(
                        valueListenable: isHovered,
                        builder: (context, hovered, _) {
                          final showText = hovered || !kIsWeb;
                          return AnimatedOpacity(
                            opacity: showText ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 250),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Expanded(
                                  child: Text(
                                    description,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Dowiedz się więcej →',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
