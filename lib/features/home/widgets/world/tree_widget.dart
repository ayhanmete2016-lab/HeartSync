/*
══════════════════════════════════════════════════════════════

HeartSync

File:
tree_widget.dart

Version:
2.0.0

Purpose:
• World Tree
• Relationship Tree
• Tree Health
• Tree Level

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

class TreeWidget extends StatelessWidget {
  final int level;
  final int health;

  const TreeWidget({
    super.key,
    required this.level,
    required this.health,
  });

  Color get treeColor {
    if (health >= 80) {
      return Colors.green;
    }

    if (health >= 60) {
      return Colors.lightGreen;
    }

    if (health >= 40) {
      return Colors.orange;
    }

    if (health >= 20) {
      return Colors.deepOrange;
    }

    return Colors.brown;
  }

  double get scale {
    if (health >= 80) return 1.0;
    if (health >= 60) return 0.97;
    if (health >= 40) return 0.94;
    if (health >= 20) return 0.91;

    return 0.88;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      scale: scale,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.park,
            size: 260,
            color: treeColor,
            shadows: [
              Shadow(
                color: treeColor.withValues(alpha: 0.45),
                blurRadius: 25,
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            "Tree Level $level",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}