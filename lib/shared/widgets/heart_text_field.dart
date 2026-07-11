/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
heart_text_field.dart

Görevi:
Uygulamanın ortak giriş kutusu.

İleride;

• Şifre gizleme
• Doğrulama
• Hata gösterimi
• İkon desteği

buraya eklenecek.

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

class HeartTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscureText;

  const HeartTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,

      decoration: InputDecoration(
        hintText: hint,
      ),
    );
  }
}