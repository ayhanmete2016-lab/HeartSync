/*
══════════════════════════════════════════════════════════════

HeartSync

File:
heart_widget.dart

Version:
2.0.0

Purpose:
• Animated Relationship Heart
• Heart Energy
• World Heart

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

class HeartWidget extends StatelessWidget {
  final int energy;

  const HeartWidget({
    super.key,
    required this.energy,
  });

  Color get heartColor {
    if (energy >= 80) {
      return Colors.red;
    }

    if (energy >= 60) {
      return Colors.pink;
    }

    if (energy >= 40) {
      return Colors.orange;
    }

    if (energy >= 20) {
      return Colors.deepOrange;
    }

    return Colors.grey;
  }

  double get scale {
    if (energy >= 80) return 1.0;
    if (energy >= 60) return 0.92;
    if (energy >= 40) return 0.84;
    if (energy >= 20) return 0.76;

    return 0.68;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      scale: scale,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.favorite,
            size: 120,
            color: heartColor,
            shadows: [
              Shadow(
                color: heartColor.withValues(alpha: 0.6),
                blurRadius: 25,
              ),
            ],
          ),

          const SizedBox(height: 10),

          Text(
            "$energy%",
            style: TextStyle(
              color: heartColor,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}