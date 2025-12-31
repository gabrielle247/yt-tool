import 'package:drift/drift.dart';
import 'database.dart';
import 'mock_data.dart'; // Import your existing mock data to seed it

class VideoRepository {
  // Singleton Pattern
  static final VideoRepository _instance = VideoRepository._internal();
  late AppDatabase _db;

  factory VideoRepository() {
    return _instance;
  }

  VideoRepository._internal() {
    _db = AppDatabase();
  }

  // GETTER: Access the raw DB if absolutely needed
  AppDatabase get db => _db;

  /// Initialize and Seed data if the library is empty
  Future<void> initialize() async {
    // Check if we have videos
    final allVideos = await _db.select(_db.videos).get();
    
    if (allVideos.isEmpty) {
      print("CORE: Database empty. Seeding Mock Data...");
      await _seedMockData();
    } else {
      print("CORE: Database loaded with ${allVideos.length} videos.");
    }
  }

  /// Takes data from MockData and writes it to SQLite
  Future<void> _seedMockData() async {
    await _db.batch((batch) {
      for (var mockVideo in MockData.videos) {
        batch.insert(
          _db.videos,
          VideosCompanion(
            id: Value(mockVideo['id']),
            title: Value(mockVideo['title']),
            path: Value(mockVideo['url']), // Mapping 'url' to 'path'
            category: Value(mockVideo['category']),
            // Defaulting dates for the seed
            downloadedAt: Value(DateTime.now()), 
            expiresAt: Value(DateTime.now().add(const Duration(days: 365))),
            isLocked: Value(false),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
    print("CORE: Seeding Complete.");
  }

  // ---------------------------------------------------------------------------
  // PUBLIC API (The UI calls these)
  // ---------------------------------------------------------------------------

  /// Watch all videos for a specific category (Live Stream for UI)
  Stream<List<Video>> watchVideos({String filter = 'ALL'}) {
    if (filter == 'ALL') {
      return (_db.select(_db.videos)
            ..orderBy([(t) => OrderingTerm.desc(t.downloadedAt)]))
          .watch();
    } else if (filter == 'PRIVATE') {
       // Only return locked videos
       return (_db.select(_db.videos)
            ..where((t) => t.isLocked.equals(true))
            ..orderBy([(t) => OrderingTerm.desc(t.downloadedAt)]))
          .watch();
    } else {
      // Filter by Category
      return (_db.select(_db.videos)
            ..where((t) => t.category.equals(filter))
            ..where((t) => t.isLocked.equals(false)) // Don't show private in categories
            ..orderBy([(t) => OrderingTerm.desc(t.downloadedAt)]))
          .watch();
    }
  }

  /// Add a new video (e.g. from Downloader)
  Future<void> addVideo({
    required String id,
    required String title,
    required String filePath,
    required String category,
  }) async {
    await _db.into(_db.videos).insert(
      VideosCompanion.insert(
        id: id,
        title: title,
        path: filePath,
        category: category,
        downloadedAt: DateTime.now(),
        expiresAt: DateTime.now().add(const Duration(days: 30)),
      ),
      mode: InsertMode.insertOrReplace,
    );
  }

  /// Log a System Event
  Future<void> log(String action, String details) async {
    await _db.logEvent(action, details);
  }
}