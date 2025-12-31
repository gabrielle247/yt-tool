// ==========================================
// FILE: ./lib/core/database/schema.dart
// ==========================================

import 'dart:io';

import 'package:clue_player/core/models/media_category.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

// Generated file
part 'schema.g.dart'; // Changed from 'database.g.dart'


enum LogLevel {
  debug,
  info,
  warn,
  error,
  security,
}

// ============ TYPE CONVERTER FOR ENUMS ============
class TextEnum<T extends Enum> extends TypeConverter<T, String> {
  final List<T> values;

  TextEnum(this.values);

  @override
  T fromSql(String fromDb) {
    return values.firstWhere(
      (e) => e.name == fromDb,
      orElse: () => values.first,
    );
  }

  @override
  String toSql(T value) {
    return value.name;
  }
}

// ============ TABLES ============
class MediaItems extends Table {
  TextColumn get id => text().withLength(min: 64, max: 64)();
  TextColumn get title => text().withLength(min: 1, max: 500)();
  TextColumn get description => text().withLength(max: 2000).nullable()();
  TextColumn get category => textEnum<MediaCategory>()();
  TextColumn get series => text().nullable()();
  TextColumn get sourceHash => text().withLength(min: 64, max: 64)();
  TextColumn get encryptedPath => text()();
  TextColumn get encryptionKeyId => text()();
  IntColumn get encryptedSize => integer()();
  DateTimeColumn get encryptedAt => dateTime()();
  IntColumn get durationSeconds => integer()();
  TextColumn get codec => text().nullable()();
  TextColumn get resolution => text().nullable()();
  TextColumn get thumbnailPath => text().nullable()();
  BoolColumn get isFavorited => boolean().withDefault(const Constant(false))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get lastPlayed => dateTime().nullable()();
  IntColumn get playCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
        {sourceHash}, // Prevent duplicate files
      ];
}

class Collections extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get description => text().nullable()();
  TextColumn get icon => text().nullable()();
  TextColumn get color => text().nullable()();
  TextColumn get categoryFilter => textEnum<MediaCategory>().nullable()();
  BoolColumn get isSmart => boolean().withDefault(const Constant(false))();
  TextColumn get queryRules => text().nullable()();
  BoolColumn get requiresAuth => boolean().withDefault(const Constant(false))();
  TextColumn get authPinHash => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {name}, // Collection names must be unique
      ];
}

class CollectionItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get collectionId => integer().references(Collections, #id)();
  TextColumn get mediaItemId => text().references(MediaItems, #id)();
  IntColumn get position => integer().withDefault(const Constant(0))();
  DateTimeColumn get addedAt => dateTime()();
  // Removed primaryKey override because we have autoIncrement
}

class Tags extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get color => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  // Removed primaryKey override because we have autoIncrement
}

class MediaTags extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get mediaItemId => text().references(MediaItems, #id)();
  IntColumn get tagId => integer().references(Tags, #id)();
  // Removed primaryKey override because we have autoIncrement
}

class EncryptionKeys extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get keyId => text().unique()();
  TextColumn get algorithm => text()();
  TextColumn get keyDerivationSalt => text()();
  DateTimeColumn get createdAt => dateTime()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  // Removed primaryKey override because we have autoIncrement
}

class AppSettings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get key => text().unique()();
  TextColumn get value => text()();
  DateTimeColumn get updatedAt => dateTime()();
  // Removed primaryKey override because we have autoIncrement
}

class SystemLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get level => intEnum<LogLevel>()();
  TextColumn get module => text()();
  TextColumn get message => text()();
  TextColumn get details => text().nullable()();
  DateTimeColumn get timestamp => dateTime()();
  // Removed primaryKey override because we have autoIncrement
}

// ============ TYPE CONVERTER FOR ENUMS (INT) ============
class IntEnum<T extends Enum> extends TypeConverter<T, int> {
  final List<T> values;

  IntEnum(this.values);

  @override
  T fromSql(int fromDb) {
    return values[fromDb];
  }

  @override
  int toSql(T value) {
    return values.indexOf(value);
  }
}

// ============ DATABASE ============
@DriftDatabase(
  tables: [
    MediaItems,
    Collections,
    CollectionItems,
    Tags,
    MediaTags,
    EncryptionKeys,
    AppSettings,
    SystemLogs,
  ],
)
class ClueDatabase extends _$ClueDatabase {
  ClueDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

// ============ DATABASE CONNECTION ============
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final vaultDir = Directory(p.join(dbFolder.path, 'clue_vault'));

    if (!await vaultDir.exists()) {
      await vaultDir.create(recursive: true);
    }

    final file = File(p.join(vaultDir.path, 'vault.sqlite'));
    return NativeDatabase(
      file,
      setup: (db) {
        db.execute('PRAGMA foreign_keys = ON');
        db.execute('PRAGMA journal_mode = WAL');
        db.execute('PRAGMA synchronous = NORMAL');
      },
    );
  });
}
