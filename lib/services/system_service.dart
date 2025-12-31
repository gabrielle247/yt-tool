// ==========================================
// FILE: lib/services/system_service.dart
// ==========================================

import 'dart:async';

class SystemService {
  // SINGLETON PATTERN
  static final SystemService _instance = SystemService._internal();
  factory SystemService() => _instance;
  SystemService._internal();

  // 1. TERMINAL LOGS
  final List<String> _logs = [];
  final _logController = StreamController<List<String>>.broadcast();
  Stream<List<String>> get logStream => _logController.stream;

  void log(String message) {
    final timestamp = DateTime.now().toIso8601String().substring(11, 19);
    _logs.add("[$timestamp] $message");
    // Keep only last 500 logs
    if (_logs.length > 500) _logs.removeAt(0);
    _logController.add(_logs);
  }

  // 2. ACTIVE TASKS (Downloads)
  // Map of ID -> Progress (0.0 to 1.0)
  final Map<String, double> _tasks = {};
  final _taskController = StreamController<Map<String, double>>.broadcast();
  Stream<Map<String, double>> get taskStream => _taskController.stream;

  void updateTask(String id, double progress) {
    if (progress >= 1.0) {
      _tasks.remove(id); // Remove finished tasks
    } else {
      _tasks[id] = progress;
    }
    _taskController.add(_tasks);
  }
}
