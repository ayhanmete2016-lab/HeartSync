import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/memory_model.dart';

class MemoryRepository {
  MemoryRepository._();

  static final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  static final CollectionReference<Map<String, dynamic>> _collection =
      _firestore.collection('memories');

  static Future<void> createMemory(
    MemoryModel memory,
  ) async {
    await _collection.doc(memory.id).set(memory.toMap());
  }

  static Future<void> updateMemory(
    String id,
    Map<String, dynamic> data,
  ) async {
    await _collection.doc(id).update(data);
  }

  static Future<void> deleteMemory(
    String id,
  ) async {
    await _collection.doc(id).update({
      'isDeleted': true,
    });
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getUserMemories(
    String ownerUid,
  ) {
    return _collection
        .where('ownerUid', isEqualTo: ownerUid)
        .where('isDeleted', isEqualTo: false)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> getMemory(
    String id,
  ) async {
    return _collection.doc(id).get();
  }
}