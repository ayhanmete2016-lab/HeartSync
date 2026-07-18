/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
home_service.dart

Versiyon:
0.1.0

Görevi:
Home ekranı Firebase işlemleri

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeService {
  HomeService._();

  static final _db = FirebaseFirestore.instance;

  static Future<DocumentSnapshot<Map<String, dynamic>>> getUser() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    return await _db.collection("users").doc(uid).get();
  }
}