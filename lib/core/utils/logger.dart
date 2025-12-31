import 'package:flutter/foundation.dart';

class Logger {
  static const bool _debugMode = kDebugMode;

  static void info(String message, {Object? error, StackTrace? stackTrace}) {
    if (_debugMode) {
      if (kDebugMode) {
        print('[INFO] $message');
      }
      if (error != null) if (kDebugMode) print('Error: $error');

      if (stackTrace != null) if (kDebugMode) print('Stack: $stackTrace');
    }
  }

  static void warning(String message, {Object? error, StackTrace? stackTrace}) {
    if (_debugMode) {
      if (kDebugMode) {
        print('[WARN] $message');
      }
      if (error != null) if (kDebugMode) print('Error: $error');

      if (stackTrace != null) if (kDebugMode) print('Stack: $stackTrace');
    }
  }

  static void error(String message, {Object? error, StackTrace? stackTrace}) {
    if (_debugMode) {
      if (kDebugMode) {
        print('[ERROR] $message');
      }
      if (error != null) if (kDebugMode) print('Error: $error');
      if (stackTrace != null) if (kDebugMode) print('Stack: $stackTrace');
    }
  }
  // In production, send to crash reporting service
}
