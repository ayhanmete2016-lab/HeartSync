import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/services/haptic_service.dart';

class NotificationService {
  NotificationService._();

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> sendSilentNotification({
    required String receiverUid,
    required String title,
    required String message,
    String type = 'silent',
  }) async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) return;

    await _firestore.collection('notifications').add({
      'receiverUid': receiverUid,
      'senderUid': currentUser.uid,
      'title': title,
      'message': message,
      'type': type,
      'createdAt': FieldValue.serverTimestamp(),
      'isRead': false,
      'silent': true,
    });
  }

  static Future<void> sendHandHoldTouch({required String partnerUid}) async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) return;

    final isReceiverOnline = await _isUserOnline(partnerUid);
    if (!isReceiverOnline) return;

    await _firestore.collection('notifications').add({
      'receiverUid': partnerUid,
      'senderUid': currentUser.uid,
      'title': 'El tutuşması',
      'message': 'Seninle el tutmak istiyor',
      'type': 'hand-hold',
      'createdAt': FieldValue.serverTimestamp(),
      'isRead': false,
      'silent': false,
    });

    await HapticService.triggerHandHoldVibration();
  }

  static Future<bool> _isUserOnline(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      return doc.data()?['isOnline'] ?? false;
    } catch (e) {
      return false;
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getNotificationsForCurrentUser() {
    final currentUser = _auth.currentUser;
    if (currentUser == null) {
      return const Stream.empty();
    }

    return _firestore
        .collection('notifications')
        .where('receiverUid', isEqualTo: currentUser.uid)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }
}
