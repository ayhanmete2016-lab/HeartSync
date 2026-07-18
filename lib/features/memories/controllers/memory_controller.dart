import '../models/memory_model.dart';
import '../repositories/memory_repository.dart';

class MemoryController {
  const MemoryController();

  Future<void> createMemory(
    MemoryModel memory,
  ) async {
    await MemoryRepository.createMemory(memory);
  }

  Future<void> deleteMemory(
    String id,
  ) async {
    await MemoryRepository.deleteMemory(id);
  }

  Future<void> updateMemory(
    String id,
    Map<String, dynamic> data,
  ) async {
    await MemoryRepository.updateMemory(id, data);
  }

  Stream getUserMemories(
    String ownerUid,
  ) {
    return MemoryRepository.getUserMemories(ownerUid);
  }

  Future getMemory(
    String id,
  ) async {
    return MemoryRepository.getMemory(id);
  }
}