// ==========================================
// FILE: ./yt_service.dart
// ==========================================

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'video_model.dart';
import 'analytics_service.dart';

class YtService {
  final AnalyticsService _analytics = AnalyticsService();
  
  // ETHICAL GUARDRAIL: Prevent mass downloading/spamming
  bool _isOperationActive = false; 
  
  // TRACKING: We store the active process here so we can kill it
  Process? _activeProcess;

  Future<String> get _downloadPath async {
    final home = Platform.environment['HOME'];
    final userDownloads = Directory('$home/Downloads/TheYT');
    if (!await userDownloads.exists()) {
      await userDownloads.create(recursive: true);
    }
    return userDownloads.path;
  }

  /// EMERGENCY STOP: Kills the active download process immediately
  void cancelAll() {
    if (_activeProcess != null) {
      _activeProcess!.kill(); // Sends a kill signal (SIGTERM/SIGKILL) to the OS
      _activeProcess = null;
      _isOperationActive = false;
      _analytics.logSearchEvent("EMERGENCY_STOP_TRIGGERED");
    }
  }

  /// Searches YouTube or fetches Metadata
  Future<List<VideoModel>> searchOrFetch(String query) async {
    await _analytics.logSearchEvent(query);

    List<String> args = [];
    if (query.startsWith('http')) {
      args = [query, '--dump-json', '--skip-download', '--flat-playlist'];
    } else {
      args = ['ytsearch10:$query', '--dump-json', '--skip-download', '--flat-playlist'];
    }

    try {
      final result = await Process.run('yt-dlp', args);
      if (result.exitCode != 0) return [];

      final List<VideoModel> videos = [];
      final lines = LineSplitter.split(result.stdout.toString());
      
      for (final line in lines) {
        if (line.trim().isNotEmpty) {
          try {
            final json = jsonDecode(line);
            videos.add(VideoModel.fromJson(json));
          } catch (e) {
            // Skip malformed lines
          }
        }
      }
      return videos;
    } catch (e) {
      return [];
    }
  }

  /// Downloads the video with Industry Standard Throttling
  Future<void> downloadVideo(VideoModel video, Function(String) onLog) async {
    if (_isOperationActive) {
      onLog("⚠️ QUEUE FULL: Please wait for the current download to finish.");
      return; 
    }

    _isOperationActive = true;
    final savePath = await _downloadPath;
    
    await _analytics.logDownloadEvent(video, "STARTED");

    final qualityArgs = [
      '-f', 'bv*[height<=1080]+ba/b[height<=1080] / best',
      '--merge-output-format', 'mp4',
    ];
    
    List<String> finalArgs = [video.url, ...qualityArgs];

    if (video.platform.toLowerCase().contains('tiktok')) {
      final safeTitle = video.title.replaceAll(RegExp(r'[^a-zA-Z0-9_ -]'), '');
      final seriesDir = Directory('$savePath/TikToks/$safeTitle');
      if (!await seriesDir.exists()) await seriesDir.create(recursive: true);
      
      finalArgs = [video.url, '--yes-playlist', '-o', '${seriesDir.path}/%(upload_date)s_%(title)s.%(ext)s'];
    } else if (video.url.contains('list=')) {
      final safeTitle = video.title.replaceAll(RegExp(r'[^a-zA-Z0-9_ -]'), '');
      final courseDir = Directory('$savePath/Courses/$safeTitle');
      if (!await courseDir.exists()) await courseDir.create(recursive: true);

      finalArgs = [video.url, ...qualityArgs, '-o', '${courseDir.path}/%(playlist_index)s_%(title)s.%(ext)s'];
    } else {
      finalArgs.addAll(['-o', '$savePath/%(title)s.%(ext)s']);
    }

    try {
      // Store process in variable so cancelAll() can access it
      _activeProcess = await Process.start('yt-dlp', finalArgs);
      
      _activeProcess!.stdout.transform(utf8.decoder).listen((data) {
        if (data.contains('[download]')) {
           onLog(data.trim());
        }
      });
      
      _activeProcess!.stderr.transform(utf8.decoder).listen((data) => onLog('ERR: ${data.trim()}'));

      final exitCode = await _activeProcess!.exitCode;
      
      // Clear the process tracker when done
      _activeProcess = null;

      if (exitCode == 0) {
        onLog('✅ COMPLETE: ${video.title}');
        await _analytics.logDownloadEvent(video, "SUCCESS");
      } else {
        // -9 or -15 usually means it was killed by us
        onLog('❌ STOPPED (Code $exitCode)');
        await _analytics.logDownloadEvent(video, "STOPPED_OR_FAILED");
        throw Exception("Process stopped");
      }
    } catch (e) {
      onLog('❌ SYS ERR: $e');
      rethrow;
    } finally {
      _isOperationActive = false;
      _activeProcess = null;
    }
  }
}