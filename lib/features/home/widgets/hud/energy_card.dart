/*
══════════════════════════════════════════════════════════════

HeartSync

File:
energy_widget.dart

Version:
1.0.0

Purpose:
• Display relationship energy
• Animated energy bar
• Energy percentage

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

class EnergyWidget extends StatelessWidget {
  final int energy;

  const EnergyWidget({
    super.key,
    required this.energy,
  });

  Color get energyColor {
    if (energy >= 70) {
      return Colors.green;
    }

    if (energy >= 40) {
      return Colors.orange;
    }

    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final value = (energy.clamp(0, 100)) / 100;

    return Card(
      color: Colors.white10,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Relationship Energy",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: value,
                minHeight: 12,
                valueColor: AlwaysStoppedAnimation(energyColor),
                backgroundColor: Colors.white24,
              ),
            ),

            const SizedBox(height: 12),

            Center(
              child: Text(
                "$energy%",
                style: TextStyle(
                  color: energyColor,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}