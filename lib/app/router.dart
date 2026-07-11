/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
router.dart

Görevi:
Uygulamadaki ekran geçişlerini yönetmek.

Yeni ekran eklendiğinde
ilk olarak buraya eklenir.

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

import '../features/onboarding/onboarding_page.dart';
import '../features/splash/splash_page.dart';
import '../features/welcome/welcome_page.dart';

class AppRouter {
  AppRouter._();

  static const splash = "/";
  static const onboarding = "/onboarding";
  static const welcome = "/welcome";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );

      case onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingPage(),
        );

      case welcome:
        return MaterialPageRoute(
          builder: (_) => const WelcomePage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Sayfa bulunamadı"),
            ),
          ),
        );
    }
  }
}