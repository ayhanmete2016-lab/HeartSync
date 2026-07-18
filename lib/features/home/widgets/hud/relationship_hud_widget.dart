/*
══════════════════════════════════════════════════════════════

HeartSync

File:
relationship_hud_widget.dart

Version:
1.0.0

Purpose:
• Relationship HUD
• Partner
• Together Days
• Energy
• Golden Leaves

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

class RelationshipHudWidget extends StatelessWidget {
  final Map<String, dynamic>? relationship;
  final Map<String, dynamic>? partner;

  const RelationshipHudWidget({
    super.key,
    required this.relationship,
    required this.partner,
  });

  int get togetherDays {
    final date = relationship?["relationshipDate"];

    if (date == null) {
      return 0;
    }

    return DateTime.now().difference(date.toDate()).inDays;
  }

  @override
  Widget build(BuildContext context) {
    final energy = relationship?["energy"] ?? 100;
    final goldLeaves = relationship?["goldLeaves"] ?? 0;
    final partnerName = partner?["fullName"] ?? "Partner";

    return Positioned(
      top: 15,
      left: 15,
      right: 15,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.45),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.white24,
          ),
        ),
        child: Column(
          children: [
            Text(
              partnerName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _item(
                  Icons.favorite,
                  "$energy%",
                  Colors.red,
                ),
                _item(
                  Icons.calendar_month,
                  "$togetherDays",
                  Colors.lightBlue,
                ),
                _item(
                  Icons.eco,
                  "$goldLeaves",
                  Colors.amber,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(
    IconData icon,
    String value,
    Color color,
  ) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}