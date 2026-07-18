/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
router.dart

Versiyon:
0.3.1

Görevi:
Uygulamadaki tüm ekran geçişlerini yönetir.

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

import '../features/auth/login/login_page.dart';
import '../features/auth/register/register_page.dart';
import '../features/home/pages/home_page.dart';
import '../features/legal/privacy_page.dart';
import '../features/legal/terms_page.dart';
import '../features/memories/pages/memories_page.dart';
import '../features/notifications/pages/notifications_page.dart';
import '../features/notifications/pages/send_notification_page.dart';
import '../features/onboarding/onboarding_page.dart';
import '../features/premium/pages/premium_preview_page.dart';
import '../features/relationship/pages/partner_profile_page.dart';
import '../features/relationship_tree/pages/relationship_tree_page.dart';
import '../features/splash/splash_page.dart';
import '../features/welcome/welcome_page.dart';

class AppRouter {
  AppRouter._();

  static const splash = "/";
  static const onboarding = "/onboarding";
  static const welcome = "/welcome";

  static const login = "/login";
  static const register = "/register";

  static const home = "/home";

  static const relationshipTree = "/relationship-tree";

  static const notifications = "/notifications";
  static const sendNotification = "/send-notification";

  static const memories = "/memories";

  static const partnerProfile = "/partner-profile";

  static const premiumPreview = "/premium-preview";

  static const terms = "/terms";
  static const privacy = "/privacy";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());

      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());

      case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomePage());

      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());

      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case relationshipTree:
        return MaterialPageRoute(
          builder: (_) => const RelationshipTreePage(),
        );

      case notifications:
        return MaterialPageRoute(
          builder: (_) => const NotificationsPage(),
        );

      case sendNotification:
        return MaterialPageRoute(
          builder: (_) => const SendNotificationPage(),
        );

      case memories:
        return MaterialPageRoute(
          builder: (_) => const MemoriesPage(),
        );

      case partnerProfile:
        return MaterialPageRoute(
          builder: (_) => const PartnerProfilePage(),
        );

      case premiumPreview:
        return MaterialPageRoute(
          builder: (_) => const PremiumPreviewPage(),
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