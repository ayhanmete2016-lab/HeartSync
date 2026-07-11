/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
welcome_page.dart

Versiyon:
0.3.0

Görevi:
Kullanıcıyı giriş veya kayıt ekranına yönlendirir.

İleride:
• Gerçek logo
• Arka plan animasyonu
• Hafif parıltılar
• Premium tanıtımı

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              const Text(
                "❤️",
                style: TextStyle(fontSize: 120),
              ),

              const SizedBox(height: 30),

              const Text(
                "HeartSync",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Birlikte büyüyen hikâyeler başlar.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 70),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed: () {},

                  child: const Text(
                    "❤️ Hesap Oluştur",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: OutlinedButton(
                  onPressed: () {},

                  child: const Text(
                    "🔑 Giriş Yap",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}