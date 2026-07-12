/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
router.dart

Versiyon:
0.2.1

Görevi:
Uygulamadaki tüm ekran geçişlerini yönetir.

Yeni bir ekran eklendiğinde;

1- Import edilir.
2- Route adı tanımlanır.
3- Switch içerisine eklenir.

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

import '../features/auth/login/login_page.dart';
import '../features/auth/register/register_page.dart';
import '../features/onboarding/onboarding_page.dart';
import '../features/splash/splash_page.dart';
import '../features/welcome/welcome_page.dart';
import '../features/legal/privacy_page.dart';
import '../features/legal/terms_page.dart';
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

  /// Register
  static const register = "/register";

static const terms = "/terms";
static const privacy = "/privacy";


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

      case register:
        return MaterialPageRoute(
          builder: (_) => const RegisterPage(),
        );

case terms:
  return MaterialPageRoute(
    builder: (_) => const TermsPage(),
  );

case privacy:
  return MaterialPageRoute(
    builder: (_) => const PrivacyPage(),
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