/*
══════════════════════════════════════════════════════════════

HeartSync

File:
partner_card.dart

Version:
1.0.0

Purpose:
• Display partner information
• Display relationship information
• Display together days

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:flutter/material.dart';

class PartnerCard extends StatelessWidget {
  final String partnerName;
  final int togetherDays;
  final String pairId;
  final DateTime? relationshipDate;

  const PartnerCard({
    super.key,
    required this.partnerName,
    required this.togetherDays,
    required this.pairId,
    required this.relationshipDate,
  });

  String get formattedDate {
    if (relationshipDate == null) {
      return "-";
    }

    final date = relationshipDate!;

    return "${date.day}.${date.month}.${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white10,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 36,
              child: Icon(
                Icons.favorite,
                size: 34,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              partnerName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Together",
                  style: TextStyle(color: Colors.white70),
                ),
                Text(
                  "$togetherDays Days",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Relationship",
                  style: TextStyle(color: Colors.white70),
                ),
                Text(
                  formattedDate,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Pair ID",
                  style: TextStyle(color: Colors.white70),
                ),
                SelectableText(
                  pairId,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}