import '../models/premium_tier_model.dart';

class PremiumService {
  PremiumService._();

  static PremiumTierModel getTier({
    required bool isPremium,
  }) {
    if (isPremium) {
      return const PremiumTierModel(
        isPremium: true,
        flowerCount: 80,
        effectStyle: 'diamond-heart',
        themeName: 'Lüks',
      );
    }

    return const PremiumTierModel(
      isPremium: false,
      flowerCount: 12,
      effectStyle: 'classic-heart',
      themeName: 'Temel',
    );
  }
}