// ==========================================
// FILE: ./lib/core/services/data_repository.dart
// ==========================================

import 'package:clue_player/core/database/schema.dart';
import 'package:clue_player/core/models/media_category.dart';
import 'package:drift/drift.dart';

part 'data_repository.g.dart';

@DriftAccessor(tables: [MediaItems, Collections, CollectionItems, Tags, MediaTags, AppSettings, SystemLogs])
class DataRepository extends DatabaseAccessor<ClueDatabase>
    with _$DataRepositoryMixin {
  
  DataRepository(super.db);

  // ============ CREATE OPERATIONS ============

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
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<int> createCollection(String name, {String? description, String? icon, String? color}) {
    return into(collections).insert(
      CollectionsCompanion.insert(
        name: name,
        description: Value(description),
        icon: Value(icon),
        color: Value(color),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
  }

  Future<int> addToCollection(String mediaId, int collectionId) {
    return into(collectionItems).insert(
      CollectionItemsCompanion.insert(
        collectionId: collectionId,
        mediaItemId: mediaId,
        addedAt: DateTime.now(),
      ),
    );
  }

  // ============ READ OPERATIONS ============

  Future<List<MediaItem>> getAllMedia() {
    return (select(mediaItems)
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)]))
        .get();
  }

  Future<MediaItem?> getMediaById(String id) {
    return (select(mediaItems)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<MediaItem>> getMediaByCategory(MediaCategory category) {
    // Drift handles the Enum conversion automatically via the TypeConverter in schema.dart
    return (select(mediaItems)
          ..where((tbl) => tbl.category.equals(category.index as String))) // Using index for safety if generic compare fails
        .get();
  }

  Future<List<Collection>> getAllCollections() {
    return select(collections).get();
  }

  Future<List<MediaItem>> getItemsInCollection(int collectionId) {
    final query = select(mediaItems).join([
      innerJoin(collectionItems, collectionItems.mediaItemId.equalsExp(mediaItems.id)),
    ])
      ..where(collectionItems.collectionId.equals(collectionId));

    return query.map((row) => row.readTable(mediaItems)).get();
  }

  Future<String?> getSetting(String key) async {
    final record = await (select(appSettings)..where((t) => t.key.equals(key))).getSingleOrNull();
    return record?.value;
  }

  // ============ WATCHERS ============

  Stream<List<MediaItem>> watchAllMedia() {
    return (select(mediaItems)
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)]))
        .watch();
  }

  Stream<MediaItem?> watchMediaById(String id) {
    return (select(mediaItems)..where((tbl) => tbl.id.equals(id)))
        .watchSingleOrNull();
  }

  Stream<List<Collection>> watchCollections() {
    return select(collections).watch();
  }

  // ============ UPDATE OPERATIONS ============

  Future<bool> updateMediaMetadata(String id,
      {String? newTitle, MediaCategory? newCategory}) {
    return (update(mediaItems)..where((tbl) => tbl.id.equals(id)))
        .write(
          MediaItemsCompanion(
            title: newTitle != null ? Value(newTitle) : const Value.absent(),
            category: newCategory != null ? Value(newCategory) : const Value.absent(),
            updatedAt: Value(DateTime.now()),
          ),
        )
        .then((rows) => rows > 0);
  }

  Future<void> toggleFavorite(String id) async {
    final item = await getMediaById(id);
    if (item != null) {
      await update(mediaItems).replace(item.copyWith(isFavorited: !item.isFavorited));
    }
  }

  Future<void> incrementPlayCount(String id) async {
    final item = await getMediaById(id);
    if (item != null) {
      await update(mediaItems).replace(
        item.copyWith(
          playCount: item.playCount + 1,
          lastPlayed: Value(DateTime.now()),
        ),
      );
    }
  }

  Future<void> saveSetting(String key, String value) {
    return into(appSettings).insertOnConflictUpdate(
      AppSettingsCompanion.insert(
        key: key,
        value: value,
        updatedAt: DateTime.now(),
      ),
    );
  }

  // ============ DELETE OPERATIONS ============

  Future<int> deleteMedia(String id) {
    return (delete(mediaItems)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> deleteCollection(int id) {
    return (delete(collections)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> deleteAll() {
    return delete(mediaItems).go();
  }

  // ============ UTILITIES ============

  Future<Map<String, dynamic>> getSystemStatus() async {
    final mediaCount = await (select(mediaItems)).get().then((l) => l.length);
    final collectionCount = await (select(collections)).get().then((l) => l.length);
    
    final allItems = await getAllMedia();
    final totalBytes = allItems.fold<int>(0, (sum, item) => sum + item.encryptedSize);
    final totalGB = (totalBytes / (1024 * 1024 * 1024)).toStringAsFixed(2);

    return {
      'vaultStatus': 'Active',
      'totalVideos': mediaCount,
      'totalCollections': collectionCount,
      'storageUsed': '$totalGB GB',
    };
  }
}