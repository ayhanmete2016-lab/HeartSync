/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
heart_logo.dart

Görevi:
Uygulamanın ortak logosu.

İleride;

• SVG logo
• Parlama efekti
• Nabız animasyonu
• Premium logo

buraya eklenecek.

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

class HeartLogo extends StatelessWidget {
  final double size;

  const HeartLogo({
    super.key,
    this.size = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "❤️",
      style: TextStyle(
        fontSize: size,
      ),
    );
  }
}