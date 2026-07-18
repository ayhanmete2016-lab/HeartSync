/*
══════════════════════════════════════════════════════════════

HeartSync

File:
firefly_widget.dart

Version:
1.0.0

Purpose:
• Fireflies
• Forest ambience

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'dart:math';

import 'package:flutter/material.dart';

class FireflyWidget extends StatelessWidget {
  const FireflyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final random = Random();

    return IgnorePointer(
      child: Stack(
        children: List.generate(
          18,
          (index) {
            return Positioned(
              left: random.nextDouble() * 360,
              top: random.nextDouble() * 450,
              child: Opacity(
                opacity: 0.4 + random.nextDouble() * 0.6,
                child: Container(
                  width: 3 + random.nextDouble() * 4,
                  height: 3 + random.nextDouble() * 4,
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.yellow,
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}