import 'package:cloud_firestore/cloud_firestore.dart';

class MemoryModel {
  const MemoryModel({
    required this.id,
    required this.ownerUid,
    this.partnerUid,
    required this.title,
    required this.content,
    required this.memoryType,
    this.mood,
    this.emoji,
    this.location,
    this.song,
    this.storyTag,
    this.contextNote,
    this.imageUrls = const [],
    this.videoUrl,
    this.voiceUrl,
    required this.createdAt,
    this.updatedAt,
    this.sharedNow = false,
    this.shareWhenPartnerExists = false,
    this.privateOnly = true,
    this.isFavorite = false,
    this.isArchived = false,
    this.isDeleted = false,
  });

  final String id;
  final String ownerUid;
  final String? partnerUid;

  final String title;
  final String content;
  final String memoryType;

  final String? mood;
  final String? emoji;

  final String? location;
  final String? song;
  final String? storyTag;
  final String? contextNote;

  final List<String> imageUrls;
  final String? videoUrl;
  final String? voiceUrl;

  final DateTime createdAt;
  final DateTime? updatedAt;

  final bool sharedNow;
  final bool shareWhenPartnerExists;
  final bool privateOnly;

  final bool isFavorite;
  final bool isArchived;
  final bool isDeleted;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ownerUid': ownerUid,
      'partnerUid': partnerUid,
      'title': title,
      'content': content,
      'memoryType': memoryType,
      'mood': mood,
      'emoji': emoji,
      'location': location,
      'song': song,
      'storyTag': storyTag,
      'contextNote': contextNote,
      'imageUrls': imageUrls,
      'videoUrl': videoUrl,
      'voiceUrl': voiceUrl,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt':
          updatedAt == null ? null : Timestamp.fromDate(updatedAt!),
      'sharedNow': sharedNow,
      'shareWhenPartnerExists': shareWhenPartnerExists,
      'privateOnly': privateOnly,
      'isFavorite': isFavorite,
      'isArchived': isArchived,
      'isDeleted': isDeleted,
    };
  }
}