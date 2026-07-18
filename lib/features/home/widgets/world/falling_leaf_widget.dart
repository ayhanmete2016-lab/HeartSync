/*
══════════════════════════════════════════════════════════════

HeartSync

File:
falling_leaf_widget.dart

Version:
1.0.0

Purpose:
• Falling Leaves
• Forest Ambience

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'dart:math';

import 'package:flutter/material.dart';

class FallingLeafWidget extends StatelessWidget {
  const FallingLeafWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final random = Random();

    final colors = <Color>[
      Colors.green,
      Colors.lightGreen,
      Colors.orange,
      Colors.amber,
    ];

    return IgnorePointer(
      child: Stack(
        children: List.generate(
          15,
          (index) {
            return Positioned(
              left: random.nextDouble() * 360,
              top: random.nextDouble() * 500,
              child: Transform.rotate(
                angle: random.nextDouble(),
                child: Icon(
                  Icons.eco,
                  size: 10 + random.nextDouble() * 12,
                  color: colors[random.nextInt(colors.length)]
                      .withValues(alpha: 0.7),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}