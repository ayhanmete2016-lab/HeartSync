/*
══════════════════════════════════════════════════════════════

HeartSync

File:
relationship_controller.dart

Version:
1.0.0

Purpose:
• Load current relationship
• Load partner
• Get pair ID
• Get relationship document

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/relationship_service.dart';

class RelationshipController {
  RelationshipController();

  final _firestore = FirebaseFirestore.instance;

  /// Current user
  User? get currentUser => FirebaseAuth.instance.currentUser;

  /// Get current user's pairId
  Future<String?> getPairId() async {
    final user = currentUser;

    if (user == null) {
      return null;
    }

    final doc =
        await _firestore.collection("users").doc(user.uid).get();

    if (!doc.exists) {
      return null;
    }

    return doc.data()?["pairId"];
  }

  /// Load relationship document
  Future<DocumentSnapshot<Map<String, dynamic>>?> loadRelationship() async {
    final pairId = await getPairId();

    if (pairId == null || pairId.isEmpty) {
      return null;
    }

    return await RelationshipService.getRelationship(pairId);
  }

  /// Load relationship data
  Future<Map<String, dynamic>?> loadRelationshipData() async {
    final relationship = await loadRelationship();

    if (relationship == null) {
      return null;
    }

    return relationship.data();
  }

  /// Load partner information
  Future<Map<String, dynamic>?> loadPartner() async {
    final relationship = await loadRelationshipData();

    if (relationship == null) {
      return null;
    }

    final uid = currentUser!.uid;

    final partnerUid =
        relationship["partner1Uid"] == uid
            ? relationship["partner2Uid"]
            : relationship["partner1Uid"];

    final partner =
        await _firestore.collection("users").doc(partnerUid).get();

    if (!partner.exists) {
      return null;
    }

    return partner.data();
  }

  /// Check if relationship exists
  Future<bool> hasRelationship() async {
    final relationship = await loadRelationship();

    return relationship != null;
  }
}