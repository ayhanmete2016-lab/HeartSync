/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
heart_button.dart

Versiyon:
0.3.1

Görevi:
Uygulamanın ortak butonu.

Özellikler:
• Disabled (Pasif) desteği
• Firebase'e hazır
• Ortak tasarım

İleride;

• Loading
• İkon
• Gradient
• Premium görünüm
• Haptic Feedback
• Ripple Animation

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

class HeartButton extends StatelessWidget {
  final String text;

  /// null ise buton pasif olur.
  final VoidCallback? onPressed;

  const HeartButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}