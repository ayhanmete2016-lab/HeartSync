/*
══════════════════════════════════════════════════════════════

HeartSync

File:
couple_home_controller.dart

Version:
1.1.0

Purpose:
• Load relationship
• Load partner
• Get together days
• Get energy
• Get tree level
• Get tree health

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import '../../relationship/controllers/relationship_controller.dart';

class CoupleHomeController {
  CoupleHomeController();

  final RelationshipController _relationshipController =
      RelationshipController();

  /// Relationship bilgisi
  Future<Map<String, dynamic>?> loadRelationship() {
    return _relationshipController.loadRelationshipData();
  }

  /// Partner bilgisi
  Future<Map<String, dynamic>?> loadPartner() {
    return _relationshipController.loadPartner();
  }

  /// Birlikte geçirilen gün
  Future<int> getTogetherDays() async {
    final relationship = await loadRelationship();

    if (relationship == null) {
      return 0;
    }

    final date = relationship["relationshipDate"];

    if (date == null) {
      return 0;
    }

    final relationshipDate = date.toDate();

    return DateTime.now().difference(relationshipDate).inDays;
  }

  /// Kalp enerjisi
  Future<int> getEnergy() async {
    final relationship = await loadRelationship();

    if (relationship == null) {
      return 0;
    }

    return relationship["energy"] ?? 100;
  }

  /// Ağaç seviyesi
  Future<int> getTreeLevel() async {
    final relationship = await loadRelationship();

    if (relationship == null) {
      return 1;
    }

    return relationship["treeLevel"] ?? 1;
  }

  /// Ağaç sağlığı
  Future<int> getTreeHealth() async {
    final relationship = await loadRelationship();

    if (relationship == null) {
      return 100;
    }

    return relationship["treeHealth"] ?? 100;
  }

  /// Relationship var mı?
  Future<bool> hasRelationship() {
    return _relationshipController.hasRelationship();
  }
}