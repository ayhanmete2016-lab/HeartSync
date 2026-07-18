/*
══════════════════════════════════════════════════════════════

HeartSync

Dosya:
home_controller.dart

Görevi:
• Giriş yapan kullanıcıyı getirir
• Firestore'dan kullanıcı verisini okur
• Bekleyen bağlantı isteklerini kontrol eder
• Gelen bağlantı isteğini getirir
• Heart World verisini yükler

Ayhan & ChatGPT

══════════════════════════════════════════════════════════════
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../pairing/services/pair_request_service.dart';
import '../../user/services/user_service.dart';

import '../models/world/world_state.dart';
import '../services/world_service.dart';

class HomeController {
  final WorldService worldService = WorldService();

  /// Heart World
  Future<WorldState> loadWorld() async {
    return await worldService.loadWorld();
  }

  /// Giriş yapan kullanıcı
  Future<Map<String, dynamic>?> loadUser() async {
    debugPrint("========== HOME CONTROLLER ==========");

    final currentUser = FirebaseAuth.instance.currentUser;

    debugPrint("Current User : ${currentUser?.email}");
    debugPrint("Current UID  : ${currentUser?.uid}");

    if (currentUser == null) {
      debugPrint("HATA: currentUser NULL");
      return null;
    }

    final data = await UserService.getUser(currentUser.uid);

    debugPrint("Firestore Data:");
    debugPrint(data.toString());

    debugPrint("=====================================");

    return data;
  }

  /// Benim bekleyen isteğim var mı?
  Future<bool> hasPendingRequest() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return false;
    }

    return await PairRequestService.hasPendingRequest(
      currentUser.uid,
    );
  }

  /// Bana gelen bekleyen istek sayısı
  Future<int> incomingRequestCount() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return 0;
    }

    final requests =
        await PairRequestService.getIncomingRequests(
      currentUser.uid,
    );

    return requests.docs.length;
  }

  /// Bana gelen son bekleyen istek
  Future<DocumentSnapshot?> getIncomingRequest() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return null;
    }

    return await PairRequestService.getLatestIncomingRequest(
      currentUser.uid,
    );
  }
}