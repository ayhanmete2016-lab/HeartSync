/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
user_service.dart

Versiyon:
0.3.0

Görevi:
• Firestore kullanıcı işlemleri
• Yeni kullanıcı oluşturur
• Kullanıcı bilgilerini okur

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UserService {
  static final _users =
      FirebaseFirestore.instance.collection("users");

  static Future<void> createUser(UserModel user) async {
    await _users.doc(user.uid).set(user.toMap());
  }

  static Future<Map<String, dynamic>?> getUser(String uid) async {
    final doc = await _users.doc(uid).get();

    if (!doc.exists) {
      return null;
    }

    return doc.data();
  }

  static Future<void> updateUser(
    String uid,
    Map<String, dynamic> data,
  ) async {
    await _users.doc(uid).update(data);
  }
}