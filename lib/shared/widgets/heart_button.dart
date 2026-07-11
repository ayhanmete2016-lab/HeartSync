/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
heart_button.dart

Görevi:
Uygulamanın ortak butonu.

İleride;

• Loading
• İkon
• Gradient
• Premium görünüm

buraya eklenecek.

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

class HeartButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

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