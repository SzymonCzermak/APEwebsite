import 'package:flutter/material.dart';

class VillageStepContainer extends StatelessWidget {
  final Widget child;
  const VillageStepContainer({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Maksymalne sensowne rozmiary – ale nie wymuszamy minimum!
    final double maxW = size.width < 1280 ? size.width * 0.98 : 1200;
    final double maxH = size.height < 960 ? size.height * 0.98 : 900;

    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: maxW,
          maxHeight: maxH,
        ),
        // SingleChildScrollView chroni przed "ucinaniem" zawartości!
        child: SingleChildScrollView(
          // Scroll zawsze, jak coś się nie mieści (ale nie przewija, jeśli mieści się w całości)
          child: child,
        ),
      ),
    );
  }
}
