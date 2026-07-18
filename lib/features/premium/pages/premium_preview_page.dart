import 'package:flutter/material.dart';

import '../services/premium_service.dart';

class PremiumPreviewPage extends StatelessWidget {
  const PremiumPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final basic = PremiumService.getTier(isPremium: false);
    final premium = PremiumService.getTier(isPremium: true);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Premium Deneyimi'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _TierCard(title: 'Temel', tier: basic),
            const SizedBox(height: 16),
            _TierCard(title: 'Premium', tier: premium),
          ],
        ),
      ),
    );
  }
}

class _TierCard extends StatelessWidget {
  const _TierCard({required this.title, required this.tier});

  final String title;
  final dynamic tier;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1E1E1E),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text('Çiçek sayısı: ${tier.flowerCount}', style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 6),
            Text('Efekt: ${tier.effectStyle}', style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 6),
            Text('Tema: ${tier.themeName}', style: const TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}
