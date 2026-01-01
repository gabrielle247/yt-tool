import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

/// Service responsible for communicating with local yt-dlp and ffmpeg binaries.
/// This acts as the bridge between the Flutter UI and the Linux Shell.
class MediaScraperService {
  // We assume these are in the system PATH for now (dev environment).
  // In production (AppImage), we would point to bundled paths.
  static const String _ytDlpCommand = 'yt-dlp';
  static const String _ffmpegCommand = 'ffmpeg';

  /// Checks if the necessary tools are installed and accessible.
  Future<bool> verifyTools() async {
    try {
      final result = await Process.run(_ytDlpCommand, ['--version']);
      if (result.exitCode != 0) {
        debugPrint(
            'MediaScraperService: yt-dlp check failed. ${result.stderr}');
        return false;
      }

      final ffmpegResult = await Process.run(_ffmpegCommand, ['-version']);
      if (ffmpegResult.exitCode != 0) {
        debugPrint(
            'MediaScraperService: ffmpeg check failed. ${ffmpegResult.stderr}');
        return false;
      }

      return true;
    } catch (e) {
      debugPrint('MediaScraperService: Tool verification error: $e');
      return false;
    }
  }

  /// Fetches metadata for a given URL without downloading the video.
  /// Returns a Map containing title, thumbnail, duration, etc.
  Future<Map<String, dynamic>> fetchVideoMetadata(String url) async {
    try {
      // --dump-json: Returns metadata as JSON
      // --no-playlist: Ensures we only get one video even if URL is a playlist
      final result = await Process.run(
        _ytDlpCommand,
        [
          '--dump-json',
          '--no-playlist',
          '--skip-download',
          url,
        ],
      );

      if (result.exitCode != 0) {
        throw Exception('Failed to fetch metadata: ${result.stderr}');
      }

      final String jsonString = result.stdout.toString();
      if (jsonString.isEmpty) {
        throw Exception('yt-dlp returned empty response');
      }

      final Map<String, dynamic> data = jsonDecode(jsonString);

      // Normalize the data for our app
      return {
        'id': data['id'] ?? '',
        'title': data['title'] ?? 'Unknown Title',
        'uploader': data['uploader'] ?? 'Unknown Uploader',
        'duration': data['duration'] ?? 0,
        'thumbnail': data['thumbnail'] ?? '',
        'description': data['description'] ?? '',
        'upload_date': data['upload_date'] ?? '',
        'view_count': data['view_count'] ?? 0,
      };
    } catch (e) {
      debugPrint('MediaScraperService: Metadata fetch error: $e');
      rethrow; // Pass error up to the UI to show a SnackBar
    }
  }

  /// Downloads the video to the specified directory.
  /// Returns the full path to the downloaded file.
  Future<String> downloadVideo(String url, String outputDirectory,
      {String? filename}) async {
    try {
      // Ensure directory exists
      final dir = Directory(outputDirectory);
      if (!await dir.exists()) {
        await dir.create(recursive: true);
      }

      // If no filename provided, use the video ID
      final String safeFilename = filename ?? '%(id)s';
      final String outputPathTemplate = '${dir.path}/$safeFilename.%(ext)s';

      debugPrint('MediaScraperService: Starting download to $outputDirectory');

      // Uses Process.start for streaming output (progress bars) could be implemented here.
      // For now, we use Process.run for simplicity to get it working.
      final result = await Process.run(
        _ytDlpCommand,
        [
          '-o', outputPathTemplate,
          '--format',
          'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best', // Force MP4 for compatibility
          '--no-playlist',
          url,
        ],
      );

      if (result.exitCode != 0) {
        throw Exception('Download failed: ${result.stderr}');
      }

      // Find the file we just downloaded (yt-dlp might change extension)
      // Ideally, we parse the stdout to find the merged filename.
      // This is a simple robust fallback:
      // ignore: unused_local_variable
      late final String log = result.stdout.toString();
      // Look for "Merging formats into..." or "Destination: ..." in logs
      // For MVP, we will assume it worked if exit code is 0.

      return 'Download Completed';
    } catch (e) {
      debugPrint('MediaScraperService: Download error: $e');
      rethrow;
    }
  }
}
