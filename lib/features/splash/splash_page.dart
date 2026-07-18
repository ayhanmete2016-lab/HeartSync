/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
splash_page.dart

Versiyon:
0.2.2

Görevi:
• Açılış ekranı
• Kalp animasyonu
• Yazı animasyonu
• Geliştirme modunda Login ekranına geçiş

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../app/router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      if (!mounted) return;

      // Geliştirme aşamasında her zaman Login ekranına git.
      // Böylece farklı hesaplarla kolayca test yapılabilir.
      Navigator.pushReplacementNamed(
        context,
        AppRouter.login,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// ❤️ Kalp
            const Text(
              "❤️",
              style: TextStyle(fontSize: 90),
            )
                .animate(onPlay: (controller) => controller.repeat())
                .scale(
                  begin: const Offset(.90, .90),
                  end: const Offset(1.10, 1.10),
                  duration: 900.ms,
                ),

            const SizedBox(height: 25),

            /// HeartSync Yazısı
            const Text(
              "HeartSync",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
                .animate()
                .fadeIn(duration: 900.ms)
                .slideY(begin: .6),

            const SizedBox(height: 10),

            /// Slogan
            const Text(
              "Mesafe değil, hisler bağlar.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            )
                .animate(delay: 700.ms)
                .fadeIn(duration: 900.ms),

            const SizedBox(height: 80),

            /// Versiyon
            const Text(
              "Version 0.2.2",
              style: TextStyle(
                color: Colors.white24,
                fontSize: 12,
              ),
            )
                .animate(delay: 1400.ms)
                .fadeIn(),
          ],
        ),
      ),
    );
  }
}