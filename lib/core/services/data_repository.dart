// ==========================================
// FILE: ./core/services/data_repository.dart
// ==========================================

import 'package:clue_player/core/database/schema.dart';
import 'package:clue_player/core/models/media_category.dart';
import 'package:drift/drift.dart';

part 'data_repository.g.dart';

@DriftAccessor(tables: [MediaItems])
class DataRepository extends DatabaseAccessor<ClueDatabase> with _$DataRepositoryMixin {
  DataRepository(super.db);

  // --- Create ---

  Future<int> addMediaItem({
    required String id,
    required String title,
    required MediaCategory category,
    required String sourceHash,
    required String encryptedPath,
    required String encryptionKeyId,
    required int encryptedSize,
    required DateTime encryptedAt,
    required int durationSeconds,
    String? description,
    String? series,
    String? codec,
    String? resolution,
    String? thumbnailPath,
  }) {
    return into(mediaItems).insert(
      MediaItemsCompanion.insert(
        id: id,
        title: title,
        description: Value(description),
        category: category,
        series: Value(series),
        sourceHash: sourceHash,
        encryptedPath: encryptedPath,
        encryptionKeyId: encryptionKeyId,
        encryptedSize: encryptedSize,
        encryptedAt: encryptedAt,
        durationSeconds: durationSeconds,
        codec: Value(codec),
        resolution: Value(resolution),
        thumbnailPath: Value(thumbnailPath),
        isFavorited: const Value(false),
        isArchived: const Value(false),
        playCount: const Value(0),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
  }

  // --- Read ---

  Future<List<MediaItem>> getAllMedia() {
    return select(mediaItems).get();
  }

  Future<MediaItem?> getMediaById(String id) {
    return (select(mediaItems)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<List<MediaItem>> getMediaByCategory(MediaCategory category) {
    return (select(mediaItems)..where((tbl) => tbl.category.equals(category as String))).get();
  }

  Stream<List<MediaItem>> watchAllMedia() {
    return select(mediaItems).watch();
  }

  // --- Update ---

  Future<bool> updateMediaMetadata(String id, {String? newTitle, MediaCategory? newCategory}) {
    return (update(mediaItems)..where((tbl) => tbl.id.equals(id))).write(
      MediaItemsCompanion(
        title: newTitle != null ? Value(newTitle) : const Value.absent(),
        category: newCategory != null ? Value(newCategory) : const Value.absent(),
        updatedAt: Value(DateTime.now()),
      ),
    ).then((rows) => rows > 0);
  }

  // --- Delete ---

  Future<int> deleteMedia(String id) {
    return (delete(mediaItems)..where((tbl) => tbl.id.equals(id))).go();
  }
  
  // Clean up entire database (careful!)
  Future<void> deleteAll() {
    return delete(mediaItems).go();
  }
  
  // Add system status method for UI
  Future<Map<String, dynamic>> getSystemStatus() async {
    final allMedia = await getAllMedia();
    return {
      'vaultStatus': 'Active',
      'totalVideos': allMedia.length,
    };
  }
}

// Add this extension for ChangeNotifier capability
extension DataRepositoryChangeNotifier on DataRepository {
  void notifyListeners() {
    // Simple implementation - you might want to make DataRepository extend ChangeNotifier
    // or wrap it in a ChangeNotifier proxy
  }
}