/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
pair_request_service.dart

Versiyon:
0.3.0

Görevi:
• Bağlantı isteği gönderir
• Bekleyen istekleri getirir
• Son gelen isteği getirir
• Bekleyen istek kontrolü yapar
• İsteği kabul eder
• İsteği reddeder
• İsteği iptal eder

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/pair_request_model.dart';

class PairRequestService {
  PairRequestService._();

  static final _requests =
      FirebaseFirestore.instance.collection("pair_requests");

  /// Yeni istek oluştur
  static Future<void> sendRequest(
    PairRequestModel request,
  ) async {
    await _requests
        .doc(request.requestId)
        .set(request.toMap());
  }

  /// Bana gelen bekleyen istekler
  static Future<QuerySnapshot> getIncomingRequests(
    String myUid,
  ) async {
    return await _requests
        .where("receiverUid", isEqualTo: myUid)
        .where("status", isEqualTo: "pending")
        .orderBy("createdAt", descending: true)
        .get();
  }

  /// Bana gelen en son bekleyen istek
  static Future<DocumentSnapshot?> getLatestIncomingRequest(
    String myUid,
  ) async {
    final result = await _requests
        .where("receiverUid", isEqualTo: myUid)
        .where("status", isEqualTo: "pending")
        .orderBy("createdAt", descending: true)
        .limit(1)
        .get();

    if (result.docs.isEmpty) {
      return null;
    }

    return result.docs.first;
  }

  /// Benim gönderdiğim bekleyen istek
  static Future<QuerySnapshot> getMyPendingRequest(
    String myUid,
  ) async {
    return await _requests
        .where("senderUid", isEqualTo: myUid)
        .where("status", isEqualTo: "pending")
        .limit(1)
        .get();
  }

  /// Bekleyen isteğim var mı?
  static Future<bool> hasPendingRequest(
    String myUid,
  ) async {
    final result = await getMyPendingRequest(myUid);

    return result.docs.isNotEmpty;
  }

  /// İsteği kabul et
  static Future<void> acceptRequest(
    String requestId,
  ) async {
    await _requests.doc(requestId).update({
      "status": "accepted",
      "updatedAt": Timestamp.now(),
    });
  }

  /// İsteği reddet
  static Future<void> rejectRequest(
    String requestId,
  ) async {
    await _requests.doc(requestId).update({
      "status": "rejected",
      "updatedAt": Timestamp.now(),
    });
  }

  /// İsteği iptal et
  static Future<void> cancelRequest(
    String requestId,
  ) async {
    await _requests.doc(requestId).update({
      "status": "cancelled",
      "updatedAt": Timestamp.now(),
    });
  }

  /// İstek sil
  static Future<void> deleteRequest(
    String requestId,
  ) async {
    await _requests.doc(requestId).delete();
  }
}