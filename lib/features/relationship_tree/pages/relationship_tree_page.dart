import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class RelationshipTreePage extends StatefulWidget {
  const RelationshipTreePage({super.key});

  @override
  State<RelationshipTreePage> createState() => _RelationshipTreePageState();
}

class _RelationshipTreePageState extends State<RelationshipTreePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  double _relationshipEnergy = 0.72;
  double _motionX = 0.0;
  double _motionY = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('İlişki Ağacı'),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
      ),
      body: SafeArea(
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              _motionX += details.delta.dx / 180;
              _motionY += details.delta.dy / 180;
              _relationshipEnergy = (_relationshipEnergy - (details.delta.dy / 9000)).clamp(0.0, 1.0);
            });
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF07111F), Color(0xFF1B2E48)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              _buildSkyEffects(),
              _buildHeartCore(),
              _buildAnimatedTree(),
              _buildStatusChip(),
              _buildEnergyHint(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkyEffects() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = _controller.value;
        return Stack(
          children: [
            Positioned(
              top: 90 + math.sin(t * math.pi * 2) * 8,
              left: 58,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.white70,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 140 + math.cos(t * math.pi * 2) * 6,
              right: 80,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.white54,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            ...List.generate(6, (index) {
              final baseLeft = 30 + index * 44.0;
              final drift = math.sin(t * math.pi * 2 + index) * 8;
              return Positioned(
                top: 180 + index * 18 + drift,
                left: baseLeft,
                child: Opacity(
                  opacity: 0.25 + (index % 2) * 0.12,
                  child: const Icon(Icons.cloud, color: Colors.white24, size: 24),
                ),
              );
            }),
          ],
        );
      },
    );
  }

  Widget _buildHeartCore() {
    return Positioned.fill(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final t = _controller.value;
          final pulse = 1.0 + 0.06 * math.sin(t * math.pi * 2);
          final sway = _motionX * 0.02;
          final wobble = _motionY * 0.01;

          return Stack(
            children: [
              Positioned(
                top: 110,
                left: 0,
                right: 0,
                child: Center(
                  child: Transform.translate(
                    offset: Offset(sway, wobble),
                    child: Transform.scale(
                      scale: pulse,
                      child: SizedBox(
                        width: 160,
                        height: 160,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: CustomPaint(
                                painter: HeartLiquidPainter(_relationshipEnergy),
                              ),
                            ),
                            Center(
                              child: Icon(
                                Icons.favorite,
                                color: Color.lerp(Colors.white, AppColors.secondary, 0.65),
                                size: 84,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAnimatedTree() {
    return Positioned.fill(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final t = _controller.value;
          final sway = Tween<double>(begin: -0.04, end: 0.04).transform(t);
          final growth = 0.78 + (_relationshipEnergy * 0.38) + (0.06 * math.sin(t * math.pi * 2));
          final leafPulse = 0.9 + (_relationshipEnergy * 0.16) + (0.04 * math.sin(t * math.pi * 2));
          final season = _relationshipEnergy > 0.82
              ? 1.0
              : _relationshipEnergy > 0.5
                  ? 0.6
                  : _relationshipEnergy > 0.25
                      ? 0.3
                      : 0.0;
          final showAutumn = season < 0.35;
          final showBloom = season > 0.6;
          final showBirds = season > 0.75;

          return Stack(
            children: [
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: Center(
                  child: Transform.rotate(
                    angle: sway + (_motionX * 0.01),
                    child: Transform.scale(
                      scale: growth,
                      child: Column(
                        children: [
                          Transform.translate(
                            offset: Offset(0, 6 * (1 - growth)),
                            child: const Text('🌱', style: TextStyle(fontSize: 74)),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            width: 210,
                            height: 230,
                            decoration: BoxDecoration(
                              color: Color.lerp(const Color(0xFF2E7D32), AppColors.tree, 0.25),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Stack(
                              children: [
                                if (showBloom)
                                  Positioned(
                                    top: 28,
                                    left: 36,
                                    child: Transform.scale(
                                      scale: leafPulse,
                                      child: const Text('🌸', style: TextStyle(fontSize: 24)),
                                    ),
                                  ),
                                if (showBloom)
                                  Positioned(
                                    top: 54,
                                    right: 30,
                                    child: Transform.scale(
                                      scale: leafPulse,
                                      child: const Text('🌼', style: TextStyle(fontSize: 22)),
                                    ),
                                  ),
                                if (showAutumn)
                                  Positioned(
                                    top: 24,
                                    left: 48,
                                    child: const Text('🍂', style: TextStyle(fontSize: 24)),
                                  ),
                                if (showAutumn)
                                  Positioned(
                                    top: 58,
                                    right: 40,
                                    child: const Text('🍁', style: TextStyle(fontSize: 20)),
                                  ),
                                if (showBirds)
                                  Positioned(
                                    top: 22,
                                    right: 8,
                                    child: const Text('🐦', style: TextStyle(fontSize: 22)),
                                  ),
                                if (showBirds)
                                  Positioned(
                                    top: 70,
                                    left: 16,
                                    child: const Text('🪺', style: TextStyle(fontSize: 24)),
                                  ),
                                Positioned(
                                  top: 94,
                                  left: 72,
                                  child: Transform.scale(
                                    scale: leafPulse,
                                    child: const Text('🍃', style: TextStyle(fontSize: 28)),
                                  ),
                                ),
                                Positioned(
                                  bottom: 26,
                                  left: 58,
                                  child: Transform.scale(
                                    scale: leafPulse,
                                    child: const Text('🌿', style: TextStyle(fontSize: 24)),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      _relationshipEnergy > 0.85
                                          ? 'İlişki güçlü, yaşam coşkulu'
                                          : _relationshipEnergy > 0.55
                                              ? 'İlişki dengede, büyüyor'
                                              : _relationshipEnergy > 0.25
                                                  ? 'İlişki zayıflıyor, sonbahar yaklaşır'
                                                  : 'İlişki yoruldu, yapraklar dökülüyor',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white.withValues(alpha: 0.95),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ...List.generate(5, (index) {
                final startX = 48 + index * 58.0;
                final drift = math.sin(t * math.pi * 2 + index) * 10;
                return Positioned(
                  top: 150 + index * 42 + drift,
                  left: startX,
                  child: Opacity(
                    opacity: 0.45 + (_relationshipEnergy * 0.35),
                    child: const Text('🦋', style: TextStyle(fontSize: 20)),
                  ),
                );
              }),
              ...List.generate(10, (index) {
                final left = 10 + index * 28.0;
                final top = 120 + (index % 4) * 60.0 + math.sin(t * math.pi * 2 + index) * 12;
                final fall = (t + index / 10) % 1.0;
                return Positioned(
                  left: left,
                  top: top + fall * 120,
                  child: Transform.rotate(
                    angle: math.sin(t * math.pi * 2 + index) * 0.25,
                    child: const Text('🍂', style: TextStyle(fontSize: 15)),
                  ),
                );
              }),
              ...List.generate(6, (index) {
                final left = 276 + index * 16.0;
                final top = 220 + index * 16.0 + math.sin(t * math.pi * 2 + index) * 8;
                return Positioned(
                  left: left,
                  top: top,
                  child: Opacity(
                    opacity: 0.35 + (_relationshipEnergy * 0.25),
                    child: const Text('💧', style: TextStyle(fontSize: 16)),
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStatusChip() {
    return Positioned(
      top: 24,
      right: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          children: [
            const Icon(Icons.favorite, color: AppColors.secondary, size: 18),
            const SizedBox(width: 8),
            Text(
              _relationshipEnergy > 0.8
                  ? 'Enerji yüksek'
                  : _relationshipEnergy > 0.5
                      ? 'Enerji dengede'
                      : _relationshipEnergy > 0.25
                          ? 'Enerji düşüyor'
                          : 'Enerji çok düşük',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnergyHint() {
    return Positioned(
      bottom: 24,
      left: 24,
      right: 24,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.28),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          'Telefonu kaydırdıkça kalp içindeki enerji değişir. Enerji arttıkça ağaç daha canlı olur, düştükçe yapraklar sararır.',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.9),
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

class HeartLiquidPainter extends CustomPainter {
  HeartLiquidPainter(this.energy);

  final double energy;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = RadialGradient(
        colors: [
          Color.lerp(const Color(0xFFFF6B81), const Color(0xFFB71C1C), energy)! ,
          Color.lerp(const Color(0xFFFFCDD2), const Color(0xFF7F0000), energy)! ,
        ],
      ).createShader(Rect.fromCircle(center: size.center(Offset.zero), radius: size.width));

    final path = Path();
    path.moveTo(size.width * 0.5, size.height * 0.2);
    path.cubicTo(size.width * 0.15, size.height * 0.0, 0, size.height * 0.45, size.width * 0.25, size.height * 0.65);
    path.cubicTo(size.width * 0.35, size.height * 0.78, size.width * 0.45, size.height * 0.82, size.width * 0.5, size.height * 0.9);
    path.cubicTo(size.width * 0.55, size.height * 0.82, size.width * 0.65, size.height * 0.78, size.width * 0.75, size.height * 0.65);
    path.cubicTo(size.width, size.height * 0.45, size.width * 0.85, size.height * 0.0, size.width * 0.5, size.height * 0.2);
    path.close();

    canvas.drawPath(path, paint..style = PaintingStyle.fill);

    final outline = Paint()
      ..color = Colors.white.withValues(alpha: 0.65)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2;
    canvas.drawPath(path, outline);
  }

  @override
  bool shouldRepaint(covariant HeartLiquidPainter oldDelegate) {
    return oldDelegate.energy != energy;
  }
}
