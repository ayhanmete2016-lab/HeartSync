/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
user_model.dart

Versiyon:
0.5.0

Görevi:
HeartSync kullanıcı modeli.

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String fullName;
  final String email;

  /// Kullanıcının herkese verebileceği benzersiz HeartSync ID
  final String pairId;

  final bool premium;
  final String premiumType;

  /// Partnerin Firebase UID'si
  final String partnerUid;

  /// Kullanıcının benzersiz Heart ID'si
  final String heartId;

  final int heartLevel;
  final int streak;

  final String language;
  final bool notifications;

  final bool isOnline;

  final Timestamp createdAt;
  final Timestamp updatedAt;

  const UserModel({
    required this.uid,
    required this.fullName,
    required this.email,
    required this.pairId,
    required this.premium,
    required this.premiumType,
    required this.partnerUid,
    required this.heartId,
    required this.heartLevel,
    required this.streak,
    required this.language,
    required this.notifications,
    required this.isOnline,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "fullName": fullName,
      "email": email,
      "pairId": pairId,
      "premium": premium,
      "premiumType": premiumType,
      "partnerUid": partnerUid,
      "heartId": heartId,
      "heartLevel": heartLevel,
      "streak": streak,
      "language": language,
      "notifications": notifications,
      "isOnline": isOnline,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }
}