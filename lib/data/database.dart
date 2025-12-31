// ==========================================
// FILE: lib/data/database.dart
// ==========================================

import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
// ignore: unused_import
import 'package:media_kit_video/media_kit_video.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart'; // This file will be created by the command above

// TABLE 1: VIDEOS
class Videos extends Table {
  TextColumn get id => text()(); 
  TextColumn get title => text()();
  TextColumn get path => text()(); 
  TextColumn get category => text()(); 
  DateTimeColumn get downloadedAt => dateTime()();
  DateTimeColumn get expiresAt => dateTime()();
  BoolColumn get isLocked => boolean().withDefault(const Constant(false))();
  
  @override
  Set<Column> get primaryKey => {id};
}

// TABLE 2: AUDIT LOGS
class AuditLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get action => text()(); 
  TextColumn get details => text()();
}

@DriftDatabase(tables: [Videos, AuditLogs])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // QUERY: Get all active videos
  Future<List<Video>> getActiveLibrary() {
    return (select(videos)
      ..where((t) => t.expiresAt.isBiggerThanValue(DateTime.now())) // Fixed: 'currentDate' -> DateTime.now()
      ..orderBy([(t) => OrderingTerm.desc(t.downloadedAt)])
    ).get();
  }

  // QUERY: Log an event
  Future<void> logEvent(String action, String details) {
    return into(auditLogs).insert(AuditLogsCompanion.insert(
      timestamp: DateTime.now(),
      action: action,
      details: details,
    ));
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'clue_player.sqlite'));
    return NativeDatabase(file);
  });
}