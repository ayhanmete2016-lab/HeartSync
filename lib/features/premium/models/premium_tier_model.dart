/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
premium_tier_model.dart

Görevi:
Premium paket özelliklerini temsil eder.

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

class PremiumTierModel {
  final bool isPremium;
  final int flowerCount;
  final String effectStyle;
  final String themeName;

  const PremiumTierModel({
    required this.isPremium,
    required this.flowerCount,
    required this.effectStyle,
    required this.themeName,
  });
}