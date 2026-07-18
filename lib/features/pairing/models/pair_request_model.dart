/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
pair_request_model.dart

Versiyon:
0.6.0

Görevi:
Heart ID ile gönderilen bağlantı isteği modeli.

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:cloud_firestore/cloud_firestore.dart';

class PairRequestModel {
  final String requestId;

  /// İsteği gönderen kullanıcı UID
  final String senderUid;

  /// İsteği gönderen Heart ID
  final String senderHeartId;

  /// İsteği alan kullanıcı UID
  final String receiverUid;

  /// İsteği alan Heart ID
  final String receiverHeartId;

  /// pending
  /// accepted
  /// rejected
  /// cancelled
  final String status;

  /// İleride isteğe kısa bir mesaj eklenebilir.
  final String message;

  final Timestamp createdAt;

  /// Son güncellenme zamanı
  final Timestamp updatedAt;

  const PairRequestModel({
    required this.requestId,
    required this.senderUid,
    required this.senderHeartId,
    required this.receiverUid,
    required this.receiverHeartId,
    required this.status,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "requestId": requestId,
      "senderUid": senderUid,
      "senderHeartId": senderHeartId,
      "receiverUid": receiverUid,
      "receiverHeartId": receiverHeartId,
      "status": status,
      "message": message,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }
}