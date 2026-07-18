/*
══════════════════════════════════════════════════════════════

HeartSync

File:
pairing_service.dart

Version:
1.0.0

Purpose:
• Find user by Heart ID
• Send pair request
• Create pair request
• Connect partners
• Create relationship

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../relationship/models/relationship_model.dart';
import '../../relationship/services/relationship_service.dart';
import '../models/pair_request_model.dart';
import 'pair_request_service.dart';

class PairingService {
  PairingService._();

  static final _firestore = FirebaseFirestore.instance;

  /// Find user by Heart ID
  static Future<DocumentSnapshot?> findUserByHeartId(
    String heartId,
  ) async {
    final result = await _firestore
        .collection("users")
        .where("heartId", isEqualTo: heartId)
        .limit(1)
        .get();

    if (result.docs.isEmpty) {
      return null;
    }

    return result.docs.first;
  }

  /// Send pair request
  static Future<void> sendPairRequest(
    String receiverHeartId,
  ) async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      throw Exception("UserNotFound");
    }

    final senderDoc = await _firestore
        .collection("users")
        .doc(currentUser.uid)
        .get();

    final receiverDoc =
        await findUserByHeartId(receiverHeartId);

    if (receiverDoc == null) {
      throw Exception("HeartIdNotFound");
    }

    if (receiverDoc.id == currentUser.uid) {
      throw Exception("CannotPairWithSelf");
    }

    final hasPending =
        await PairRequestService.hasPendingRequest(
      currentUser.uid,
    );

    if (hasPending) {
      throw Exception("PendingRequestExists");
    }

    final requestId =
        _firestore.collection("pair_requests").doc().id;

    final request = PairRequestModel(
      requestId: requestId,
      senderUid: currentUser.uid,
      senderHeartId: senderDoc["heartId"],
      receiverUid: receiverDoc["uid"],
      receiverHeartId: receiverDoc["heartId"],
      status: "pending",
      message: "",
      createdAt: Timestamp.now(),
      updatedAt: Timestamp.now(),
    );

    await PairRequestService.sendRequest(request);
  }

  /// Connect users and create relationship
  static Future<void> connectUsers({
    required String myUid,
    required String partnerUid,
  }) async {
    final pairId =
        _firestore.collection("relationships").doc().id;

    final now = Timestamp.now();

    final batch = _firestore.batch();

    final myDoc =
        _firestore.collection("users").doc(myUid);

    final partnerDoc =
        _firestore.collection("users").doc(partnerUid);

    batch.update(myDoc, {
      "partnerUid": partnerUid,
      "pairId": pairId,
      "updatedAt": now,
    });

    batch.update(partnerDoc, {
      "partnerUid": myUid,
      "pairId": pairId,
      "updatedAt": now,
    });

    await batch.commit();

    final relationship = RelationshipModel(
      pairId: pairId,
      partner1Uid: myUid,
      partner2Uid: partnerUid,
      relationshipDate: now,
      status: "active",
      energy: 100,
      treeLevel: 1,
      treeHealth: 100,
      goldLeaves: 0,
      anniversaryCount: 0,
      createdAt: now,
      updatedAt: now,
    );

    await RelationshipService.createRelationship(
      relationship,
    );
  }
}