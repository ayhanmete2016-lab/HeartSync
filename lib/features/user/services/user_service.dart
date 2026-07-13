/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
user_service.dart

Versiyon:
0.4.0

Görevi:
Firestore kullanıcı işlemleri.

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UserService {
  UserService._();

  static final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  static Future<void> createUser(UserModel user) async {
    await _firestore
        .collection("users")
        .doc(user.uid)
        .set(user.toMap());
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> getUser(
      String uid) async {
    return await _firestore
        .collection("users")
        .doc(uid)
        .get();
  }

  static Future<void> updateUser(
      String uid,
      Map<String, dynamic> data,
      ) async {
    await _firestore
        .collection("users")
        .doc(uid)
        .update(data);
  }
}