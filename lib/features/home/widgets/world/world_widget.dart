/*
══════════════════════════════════════════════════════════════

HeartSync

File:
world_widget.dart

Version:
1.5.0

Purpose:
• World Screen
• Relationship HUD
• Background
• Stars
• Moon
• Clouds
• Fireflies
• Falling Leaves
• Tree
• Heart

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

import 'background_widget.dart';
import 'clouds_widget.dart';
import 'falling_leaf_widget.dart';
import 'firefly_widget.dart';
import 'heart_widget.dart';
import 'moon_widget.dart';
import '../hud/relationship_hud_widget.dart';
import 'stars_widget.dart';
import 'tree_widget.dart';

class WorldWidget extends StatelessWidget {
  final Map<String, dynamic>? relationship;
  final Map<String, dynamic>? partner;

  const WorldWidget({
    super.key,
    required this.relationship,
    required this.partner,
  });

  @override
  Widget build(BuildContext context) {
    final int energy = relationship?["energy"] ?? 100;
    final int treeLevel = relationship?["treeLevel"] ?? 1;
    final int treeHealth = relationship?["treeHealth"] ?? 100;

    return SizedBox(
      width: 380,
      height: 500,
      child: Stack(
        children: [
          // Background
          const BackgroundWidget(),

          // Stars
          const StarsWidget(),

          // Moon
          const Positioned(
            top: 15,
            right: 20,
            child: MoonWidget(),
          ),

          // Clouds
          const CloudsWidget(),

          // Fireflies
          const FireflyWidget(),

          // Falling Leaves
          const FallingLeafWidget(),

          // Tree
          Align(
            alignment: Alignment.bottomCenter,
            child: TreeWidget(
              level: treeLevel,
              health: treeHealth,
            ),
          ),

          // Heart
          Positioned(
            bottom: 55,
            left: 0,
            right: 0,
            child: Center(
              child: HeartWidget(
                energy: energy,
              ),
            ),
          ),

          // Relationship HUD
          RelationshipHudWidget(
            relationship: relationship,
            partner: partner,
          ),
        ],
      ),
    );
  }
}