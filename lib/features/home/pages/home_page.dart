/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
home_page.dart

Versiyon:
0.1.0

Görevi:
• Ana ekran
• Kullanıcı karşılama
• Kalp sistemi
• Partner durumu
• Premium
• Ayarlar

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text("HeartSync ❤️"),
      ),

      body: const Center(
        child: Text(
          "Hoş Geldin ❤️",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}