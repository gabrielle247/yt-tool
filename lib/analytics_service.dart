// ==========================================
// FILE: ./analytics_service.dart
// ==========================================

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';

import 'video_model.dart';

class AnalyticsService {
  static final AnalyticsService _instance = AnalyticsService._internal();
  factory AnalyticsService() => _instance;
  AnalyticsService._internal();

  /// Returns the path to the hidden batch_tech logs directory
  Future<String> get _logPath async {
    final home = Platform.environment['HOME'];
    final logDir = Directory('$home/Downloads/TheYT/.batch_tech_logs');
    if (!await logDir.exists()) {
      await logDir.create(recursive: true);
    }
    return logDir.path;
  }

  Future<File> get _logFile async {
    final path = await _logPath;
    // Creates a new log file for every month to keep data organized
    final now = DateTime.now();
    final filename = "audit_${now.year}_${now.month}.jsonl"; 
    return File('$path/$filename');
  }

  /// Logs a download event for moral auditing
  Future<void> logDownloadEvent(VideoModel video, String status) async {
    try {
      final file = await _logFile;
      
      final event = {
        "timestamp": DateTime.now().toIso8601String(),
        "event_type": "DOWNLOAD_ATTEMPT",
        "video_id": video.id,
        "video_title": video.title, // Retained for internal audit
        "platform": video.platform,
        "status": status,
        "batch_tech_id": "BT-GBL-001", // Placeholder for device ID
        "system_os": Platform.operatingSystem,
      };

      // Append line to JSONL file (JSON Lines)
      await file.writeAsString('${jsonEncode(event)}\n', mode: FileMode.append);
    } catch (e) {
      debugPrint("Analytics Error: $e");
      // Fail silently to not disrupt the user, but log to console
    }
  }

  /// Logs a search/scan event
  Future<void> logSearchEvent(String query) async {
    try {
      final file = await _logFile;
      final event = {
        "timestamp": DateTime.now().toIso8601String(),
        "event_type": "SEARCH_QUERY",
        "query_length": query.length,
        "status": "INITIATED",
      };
      await file.writeAsString('${jsonEncode(event)}\n', mode: FileMode.append);
    } catch (e) {
      // Ignore
    }
  }
}