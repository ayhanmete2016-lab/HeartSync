/*
══════════════════════════════════════════════════════════════

HeartSync

File:
relationship_model.dart

Version:
1.1.0

Purpose:
Relationship document model.

This document represents the shared relationship
between two partners.

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:cloud_firestore/cloud_firestore.dart';

class RelationshipModel {
  final String pairId;

  final String partner1Uid;
  final String partner2Uid;

  final Timestamp relationshipDate;

  /// active
  /// disconnected
  /// blocked
  final String status;

  /// 0 - 100
  final int energy;

  /// Tree progression
  final int treeLevel;

  /// 0 - 100
  final int treeHealth;

  /// Shared golden leaves
  final int goldLeaves;

  /// Number of celebrated anniversaries
  final int anniversaryCount;

  final Timestamp createdAt;
  final Timestamp updatedAt;

  const RelationshipModel({
    required this.pairId,
    required this.partner1Uid,
    required this.partner2Uid,
    required this.relationshipDate,
    required this.status,
    required this.energy,
    required this.treeLevel,
    required this.treeHealth,
    required this.goldLeaves,
    required this.anniversaryCount,
    required this.createdAt,
    required this.updatedAt,
  });

  /// UID sırası fark etmeksizin tek Pair ID üretir.
  static String generatePairId(
    String uid1,
    String uid2,
  ) {
    final ids = [uid1, uid2]..sort();
    return "${ids[0]}_${ids[1]}";
  }

  Map<String, dynamic> toMap() {
    return {
      "pairId": pairId,
      "partner1Uid": partner1Uid,
      "partner2Uid": partner2Uid,
      "relationshipDate": relationshipDate,
      "status": status,
      "energy": energy,
      "treeLevel": treeLevel,
      "treeHealth": treeHealth,
      "goldLeaves": goldLeaves,
      "anniversaryCount": anniversaryCount,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }

  factory RelationshipModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return RelationshipModel(
      pairId: map["pairId"] ?? "",
      partner1Uid: map["partner1Uid"] ?? "",
      partner2Uid: map["partner2Uid"] ?? "",
      relationshipDate:
          map["relationshipDate"] ?? Timestamp.now(),
      status: map["status"] ?? "active",
      energy: map["energy"] ?? 100,
      treeLevel: map["treeLevel"] ?? 1,
      treeHealth: map["treeHealth"] ?? 100,
      goldLeaves: map["goldLeaves"] ?? 0,
      anniversaryCount: map["anniversaryCount"] ?? 0,
      createdAt: map["createdAt"] ?? Timestamp.now(),
      updatedAt: map["updatedAt"] ?? Timestamp.now(),
    );
  }
}