import 'package:clue_player/core/services/media_scraper_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scraper_providers.g.dart';

// Media Scraper Service Provider (Keep Alive)
@Riverpod(keepAlive: true)
MediaScraperService mediaScraperService(Ref ref) {
  return MediaScraperService();
}

// Video Import State Provider
@riverpod
class VideoImportState extends _$VideoImportState {
  @override
  AsyncValue<Map<String, dynamic>?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> fetchMetadata(String url) async {
    state = const AsyncValue.loading();

    try {
      final scraper = ref.read(mediaScraperServiceProvider);
      final metadata = await scraper.fetchVideoMetadata(url);
      state = AsyncValue.data(metadata);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<String> downloadVideo(String url, String outputDirectory,
      {String? filename}) async {
    try {
      final scraper = ref.read(mediaScraperServiceProvider);
      return await scraper.downloadVideo(url, outputDirectory,
          filename: filename);
    } catch (e) {
      rethrow;
    }
  }

  void reset() {
    state = const AsyncValue.data(null);
  }
}
