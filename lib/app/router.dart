/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
router.dart

Versiyon:
0.2.0

Görevi:
Uygulamadaki tüm ekran geçişlerini yönetir.

Yeni bir ekran eklendiğinde;

1- İmport edilir.
2- Route adı tanımlanır.
3- Switch içerisine eklenir.

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

import '../features/auth/login/login_page.dart';
import '../features/onboarding/onboarding_page.dart';
import '../features/splash/splash_page.dart';
import '../features/welcome/welcome_page.dart';

class AppRouter {
  AppRouter._();

  /// Splash
  static const splash = "/";

  /// Onboarding
  static const onboarding = "/onboarding";

  /// Welcome
  static const welcome = "/welcome";

  /// Login
  static const login = "/login";

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

      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
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