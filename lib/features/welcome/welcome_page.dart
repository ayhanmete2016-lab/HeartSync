/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
welcome_page.dart

Versiyon:
0.3.1

Görevi:
Kullanıcıyı uygulamaya karşılar.

Bu ekrandan;

• Hesap Oluştur
• Giriş Yap

ekranlarına yönlendirme yapılır.

İleride eklenecek:

• Canlı logo
• Arka plan animasyonu
• Parlayan yıldızlar
• Premium tanıtımı
• Dil seçimi

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

import '../../app/router.dart';

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

              /// ❤️ Logo
              const Text(
                "❤️",
                style: TextStyle(fontSize: 120),
              ),

              const SizedBox(height: 30),

              /// Uygulama Adı
              const Text(
                "HeartSync",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              /// Slogan
              const Text(
                "Birlikte büyüyen hikâyeler başlar.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 70),

              /// Hesap Oluştur
              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed: () {

                    // Register ekranı hazır olana kadar
                    // Login ekranına yönlendiriyoruz.

                    Navigator.pushNamed(
                      context,
                      AppRouter.login,
                    );

                  },

                  child: const Text(
                    "❤️ Hesap Oluştur",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              /// Giriş Yap
              SizedBox(
                width: double.infinity,
                height: 55,

                child: OutlinedButton(
                  onPressed: () {

                    Navigator.pushNamed(
                      context,
                      AppRouter.login,
                    );

                  },

                  child: const Text(
                    "🔑 Giriş Yap",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 50),

              /// Alt Bilgi
              const Text(
                "Version 0.3.1",
                style: TextStyle(
                  color: Colors.white24,
                  fontSize: 12,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}