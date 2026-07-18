/*
══════════════════════════════════════════════════════════════

HeartSync

File:
relationship_service.dart

Version:
2.0.0

Purpose:
• Create relationship
• Load relationship
• Update relationship
• Delete relationship
• Check relationship exists
• Listen relationship changes
• Get partner
• Get partner uid
• Get relationship date
• Get together days

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/relationship_model.dart';

class RelationshipService {
  RelationshipService._();

  static final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  static final CollectionReference<Map<String, dynamic>>
      _relationships =
      _firestore.collection("relationships");

  static final CollectionReference<Map<String, dynamic>>
      _users =
      _firestore.collection("users");

  /// ----------------------------------------------------------
  /// CREATE
  /// ----------------------------------------------------------

  static Future<void> createRelationship(
    RelationshipModel relationship,
  ) async {
    await _relationships
        .doc(relationship.pairId)
        .set(relationship.toMap());
  }

  /// ----------------------------------------------------------
  /// READ BY PAIR ID
  /// ----------------------------------------------------------

  static Future<DocumentSnapshot<Map<String, dynamic>>?>
      getRelationship(
    String pairId,
  ) async {
    final doc =
        await _relationships.doc(pairId).get();

    if (!doc.exists) {
      return null;
    }

    return doc;
  }

  /// ----------------------------------------------------------
  /// CURRENT USER DATA
  /// ----------------------------------------------------------

  static Future<Map<String, dynamic>?> getCurrentUserData() async {
    final currentUser =
        FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return null;
    }

    final doc =
        await _users.doc(currentUser.uid).get();

    return doc.data();
  }

  /// ----------------------------------------------------------
  /// PARTNER UID
  /// ----------------------------------------------------------

  static Future<String?> getPartnerUid() async {
    final data = await getCurrentUserData();

    if (data == null) {
      return null;
    }

    return data["partnerUid"];
  }

  /// ----------------------------------------------------------
  /// PARTNER
  /// ----------------------------------------------------------

  static Future<Map<String, dynamic>?> getPartner() async {
    final partnerUid = await getPartnerUid();

    if (partnerUid == null ||
        partnerUid.isEmpty) {
      return null;
    }

    final doc =
        await _users.doc(partnerUid).get();

    return doc.data();
  }

  /// ----------------------------------------------------------
  /// RELATIONSHIP DATE
  /// ----------------------------------------------------------

  static Future<DateTime?> getRelationshipDate() async {
    final data = await getCurrentUserData();

    if (data == null) {
      return null;
    }

    final value = data["relationshipDate"];

    if (value == null) {
      return null;
    }

    return (value as Timestamp).toDate();
  }

  /// ----------------------------------------------------------
  /// TOGETHER DAYS
  /// ----------------------------------------------------------

  static Future<int> getTogetherDays() async {
    final start =
        await getRelationshipDate();

    if (start == null) {
      return 0;
    }

    return DateTime.now()
            .difference(start)
            .inDays +
        1;
  }

    /// ----------------------------------------------------------
  /// REAL-TIME LISTENER
  /// ----------------------------------------------------------

  static Stream<DocumentSnapshot<Map<String, dynamic>>>
      relationshipStream(
    String pairId,
  ) {
    return _relationships
        .doc(pairId)
        .snapshots();
  }

  /// ----------------------------------------------------------
  /// UPDATE
  /// ----------------------------------------------------------

  static Future<void> updateRelationship(
    String pairId,
    Map<String, dynamic> data,
  ) async {
    data["updatedAt"] = Timestamp.now();

    await _relationships
        .doc(pairId)
        .update(data);
  }

  /// ----------------------------------------------------------
  /// DELETE
  /// ----------------------------------------------------------

  static Future<void> deleteRelationship(
    String pairId,
  ) async {
    await _relationships
        .doc(pairId)
        .delete();
  }

  /// ----------------------------------------------------------
  /// EXISTS
  /// ----------------------------------------------------------

  static Future<bool> exists(
    String pairId,
  ) async {
    final doc =
        await _relationships.doc(pairId).get();

    return doc.exists;
  }

  /// ----------------------------------------------------------
  /// LOAD RELATIONSHIP MODEL
  /// ----------------------------------------------------------

  static Future<RelationshipModel?> loadRelationshipModel(
    String pairId,
  ) async {
    final doc = await getRelationship(pairId);

    if (doc == null) {
      return null;
    }

    final data = doc.data();

    if (data == null) {
      return null;
    }

    return RelationshipModel.fromMap(data);
  }
}