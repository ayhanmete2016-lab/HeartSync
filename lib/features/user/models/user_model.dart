/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
user_model.dart

Versiyon:
0.4.0

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

  final bool premium;
  final String premiumType;

  final String partnerUid;
  final String pairCode;

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
    required this.premium,
    required this.premiumType,
    required this.partnerUid,
    required this.pairCode,
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
      "premium": premium,
      "premiumType": premiumType,
      "partnerUid": partnerUid,
      "pairCode": pairCode,
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