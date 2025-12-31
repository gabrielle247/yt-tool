// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// ignore_for_file: type=lint
class $MediaItemsTable extends MediaItems
    with TableInfo<$MediaItemsTable, MediaItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediaItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 64, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 500),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 2000),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<MediaCategory, String> category =
      GeneratedColumn<String>('category', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<MediaCategory>($MediaItemsTable.$convertercategory);
  static const VerificationMeta _seriesMeta = const VerificationMeta('series');
  @override
  late final GeneratedColumn<String> series = GeneratedColumn<String>(
      'series', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceHashMeta =
      const VerificationMeta('sourceHash');
  @override
  late final GeneratedColumn<String> sourceHash = GeneratedColumn<String>(
      'source_hash', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 64, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _encryptedPathMeta =
      const VerificationMeta('encryptedPath');
  @override
  late final GeneratedColumn<String> encryptedPath = GeneratedColumn<String>(
      'encrypted_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _encryptionKeyIdMeta =
      const VerificationMeta('encryptionKeyId');
  @override
  late final GeneratedColumn<String> encryptionKeyId = GeneratedColumn<String>(
      'encryption_key_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _encryptedSizeMeta =
      const VerificationMeta('encryptedSize');
  @override
  late final GeneratedColumn<int> encryptedSize = GeneratedColumn<int>(
      'encrypted_size', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _encryptedAtMeta =
      const VerificationMeta('encryptedAt');
  @override
  late final GeneratedColumn<DateTime> encryptedAt = GeneratedColumn<DateTime>(
      'encrypted_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _durationSecondsMeta =
      const VerificationMeta('durationSeconds');
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
      'duration_seconds', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _codecMeta = const VerificationMeta('codec');
  @override
  late final GeneratedColumn<String> codec = GeneratedColumn<String>(
      'codec', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _resolutionMeta =
      const VerificationMeta('resolution');
  @override
  late final GeneratedColumn<String> resolution = GeneratedColumn<String>(
      'resolution', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _thumbnailPathMeta =
      const VerificationMeta('thumbnailPath');
  @override
  late final GeneratedColumn<String> thumbnailPath = GeneratedColumn<String>(
      'thumbnail_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isFavoritedMeta =
      const VerificationMeta('isFavorited');
  @override
  late final GeneratedColumn<bool> isFavorited = GeneratedColumn<bool>(
      'is_favorited', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_favorited" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isArchivedMeta =
      const VerificationMeta('isArchived');
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
      'is_archived', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_archived" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _lastPlayedMeta =
      const VerificationMeta('lastPlayed');
  @override
  late final GeneratedColumn<DateTime> lastPlayed = GeneratedColumn<DateTime>(
      'last_played', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _playCountMeta =
      const VerificationMeta('playCount');
  @override
  late final GeneratedColumn<int> playCount = GeneratedColumn<int>(
      'play_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        category,
        series,
        sourceHash,
        encryptedPath,
        encryptionKeyId,
        encryptedSize,
        encryptedAt,
        durationSeconds,
        codec,
        resolution,
        thumbnailPath,
        isFavorited,
        isArchived,
        lastPlayed,
        playCount,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_items';
  @override
  VerificationContext validateIntegrity(Insertable<MediaItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('series')) {
      context.handle(_seriesMeta,
          series.isAcceptableOrUnknown(data['series']!, _seriesMeta));
    }
    if (data.containsKey('source_hash')) {
      context.handle(
          _sourceHashMeta,
          sourceHash.isAcceptableOrUnknown(
              data['source_hash']!, _sourceHashMeta));
    } else if (isInserting) {
      context.missing(_sourceHashMeta);
    }
    if (data.containsKey('encrypted_path')) {
      context.handle(
          _encryptedPathMeta,
          encryptedPath.isAcceptableOrUnknown(
              data['encrypted_path']!, _encryptedPathMeta));
    } else if (isInserting) {
      context.missing(_encryptedPathMeta);
    }
    if (data.containsKey('encryption_key_id')) {
      context.handle(
          _encryptionKeyIdMeta,
          encryptionKeyId.isAcceptableOrUnknown(
              data['encryption_key_id']!, _encryptionKeyIdMeta));
    } else if (isInserting) {
      context.missing(_encryptionKeyIdMeta);
    }
    if (data.containsKey('encrypted_size')) {
      context.handle(
          _encryptedSizeMeta,
          encryptedSize.isAcceptableOrUnknown(
              data['encrypted_size']!, _encryptedSizeMeta));
    } else if (isInserting) {
      context.missing(_encryptedSizeMeta);
    }
    if (data.containsKey('encrypted_at')) {
      context.handle(
          _encryptedAtMeta,
          encryptedAt.isAcceptableOrUnknown(
              data['encrypted_at']!, _encryptedAtMeta));
    } else if (isInserting) {
      context.missing(_encryptedAtMeta);
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
          _durationSecondsMeta,
          durationSeconds.isAcceptableOrUnknown(
              data['duration_seconds']!, _durationSecondsMeta));
    } else if (isInserting) {
      context.missing(_durationSecondsMeta);
    }
    if (data.containsKey('codec')) {
      context.handle(
          _codecMeta, codec.isAcceptableOrUnknown(data['codec']!, _codecMeta));
    }
    if (data.containsKey('resolution')) {
      context.handle(
          _resolutionMeta,
          resolution.isAcceptableOrUnknown(
              data['resolution']!, _resolutionMeta));
    }
    if (data.containsKey('thumbnail_path')) {
      context.handle(
          _thumbnailPathMeta,
          thumbnailPath.isAcceptableOrUnknown(
              data['thumbnail_path']!, _thumbnailPathMeta));
    }
    if (data.containsKey('is_favorited')) {
      context.handle(
          _isFavoritedMeta,
          isFavorited.isAcceptableOrUnknown(
              data['is_favorited']!, _isFavoritedMeta));
    }
    if (data.containsKey('is_archived')) {
      context.handle(
          _isArchivedMeta,
          isArchived.isAcceptableOrUnknown(
              data['is_archived']!, _isArchivedMeta));
    }
    if (data.containsKey('last_played')) {
      context.handle(
          _lastPlayedMeta,
          lastPlayed.isAcceptableOrUnknown(
              data['last_played']!, _lastPlayedMeta));
    }
    if (data.containsKey('play_count')) {
      context.handle(_playCountMeta,
          playCount.isAcceptableOrUnknown(data['play_count']!, _playCountMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {sourceHash},
      ];
  @override
  MediaItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      category: $MediaItemsTable.$convertercategory.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!),
      series: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}series']),
      sourceHash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_hash'])!,
      encryptedPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}encrypted_path'])!,
      encryptionKeyId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}encryption_key_id'])!,
      encryptedSize: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}encrypted_size'])!,
      encryptedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}encrypted_at'])!,
      durationSeconds: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_seconds'])!,
      codec: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}codec']),
      resolution: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resolution']),
      thumbnailPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}thumbnail_path']),
      isFavorited: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_favorited'])!,
      isArchived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_archived'])!,
      lastPlayed: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_played']),
      playCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}play_count'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $MediaItemsTable createAlias(String alias) {
    return $MediaItemsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MediaCategory, String, String> $convertercategory =
      const EnumNameConverter<MediaCategory>(MediaCategory.values);
}

class MediaItem extends DataClass implements Insertable<MediaItem> {
  final String id;
  final String title;
  final String? description;
  final MediaCategory category;
  final String? series;
  final String sourceHash;
  final String encryptedPath;
  final String encryptionKeyId;
  final int encryptedSize;
  final DateTime encryptedAt;
  final int durationSeconds;
  final String? codec;
  final String? resolution;
  final String? thumbnailPath;
  final bool isFavorited;
  final bool isArchived;
  final DateTime? lastPlayed;
  final int playCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  const MediaItem(
      {required this.id,
      required this.title,
      this.description,
      required this.category,
      this.series,
      required this.sourceHash,
      required this.encryptedPath,
      required this.encryptionKeyId,
      required this.encryptedSize,
      required this.encryptedAt,
      required this.durationSeconds,
      this.codec,
      this.resolution,
      this.thumbnailPath,
      required this.isFavorited,
      required this.isArchived,
      this.lastPlayed,
      required this.playCount,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    {
      map['category'] =
          Variable<String>($MediaItemsTable.$convertercategory.toSql(category));
    }
    if (!nullToAbsent || series != null) {
      map['series'] = Variable<String>(series);
    }
    map['source_hash'] = Variable<String>(sourceHash);
    map['encrypted_path'] = Variable<String>(encryptedPath);
    map['encryption_key_id'] = Variable<String>(encryptionKeyId);
    map['encrypted_size'] = Variable<int>(encryptedSize);
    map['encrypted_at'] = Variable<DateTime>(encryptedAt);
    map['duration_seconds'] = Variable<int>(durationSeconds);
    if (!nullToAbsent || codec != null) {
      map['codec'] = Variable<String>(codec);
    }
    if (!nullToAbsent || resolution != null) {
      map['resolution'] = Variable<String>(resolution);
    }
    if (!nullToAbsent || thumbnailPath != null) {
      map['thumbnail_path'] = Variable<String>(thumbnailPath);
    }
    map['is_favorited'] = Variable<bool>(isFavorited);
    map['is_archived'] = Variable<bool>(isArchived);
    if (!nullToAbsent || lastPlayed != null) {
      map['last_played'] = Variable<DateTime>(lastPlayed);
    }
    map['play_count'] = Variable<int>(playCount);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MediaItemsCompanion toCompanion(bool nullToAbsent) {
    return MediaItemsCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      category: Value(category),
      series:
          series == null && nullToAbsent ? const Value.absent() : Value(series),
      sourceHash: Value(sourceHash),
      encryptedPath: Value(encryptedPath),
      encryptionKeyId: Value(encryptionKeyId),
      encryptedSize: Value(encryptedSize),
      encryptedAt: Value(encryptedAt),
      durationSeconds: Value(durationSeconds),
      codec:
          codec == null && nullToAbsent ? const Value.absent() : Value(codec),
      resolution: resolution == null && nullToAbsent
          ? const Value.absent()
          : Value(resolution),
      thumbnailPath: thumbnailPath == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailPath),
      isFavorited: Value(isFavorited),
      isArchived: Value(isArchived),
      lastPlayed: lastPlayed == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPlayed),
      playCount: Value(playCount),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MediaItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaItem(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      category: $MediaItemsTable.$convertercategory
          .fromJson(serializer.fromJson<String>(json['category'])),
      series: serializer.fromJson<String?>(json['series']),
      sourceHash: serializer.fromJson<String>(json['sourceHash']),
      encryptedPath: serializer.fromJson<String>(json['encryptedPath']),
      encryptionKeyId: serializer.fromJson<String>(json['encryptionKeyId']),
      encryptedSize: serializer.fromJson<int>(json['encryptedSize']),
      encryptedAt: serializer.fromJson<DateTime>(json['encryptedAt']),
      durationSeconds: serializer.fromJson<int>(json['durationSeconds']),
      codec: serializer.fromJson<String?>(json['codec']),
      resolution: serializer.fromJson<String?>(json['resolution']),
      thumbnailPath: serializer.fromJson<String?>(json['thumbnailPath']),
      isFavorited: serializer.fromJson<bool>(json['isFavorited']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      lastPlayed: serializer.fromJson<DateTime?>(json['lastPlayed']),
      playCount: serializer.fromJson<int>(json['playCount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'category': serializer
          .toJson<String>($MediaItemsTable.$convertercategory.toJson(category)),
      'series': serializer.toJson<String?>(series),
      'sourceHash': serializer.toJson<String>(sourceHash),
      'encryptedPath': serializer.toJson<String>(encryptedPath),
      'encryptionKeyId': serializer.toJson<String>(encryptionKeyId),
      'encryptedSize': serializer.toJson<int>(encryptedSize),
      'encryptedAt': serializer.toJson<DateTime>(encryptedAt),
      'durationSeconds': serializer.toJson<int>(durationSeconds),
      'codec': serializer.toJson<String?>(codec),
      'resolution': serializer.toJson<String?>(resolution),
      'thumbnailPath': serializer.toJson<String?>(thumbnailPath),
      'isFavorited': serializer.toJson<bool>(isFavorited),
      'isArchived': serializer.toJson<bool>(isArchived),
      'lastPlayed': serializer.toJson<DateTime?>(lastPlayed),
      'playCount': serializer.toJson<int>(playCount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MediaItem copyWith(
          {String? id,
          String? title,
          Value<String?> description = const Value.absent(),
          MediaCategory? category,
          Value<String?> series = const Value.absent(),
          String? sourceHash,
          String? encryptedPath,
          String? encryptionKeyId,
          int? encryptedSize,
          DateTime? encryptedAt,
          int? durationSeconds,
          Value<String?> codec = const Value.absent(),
          Value<String?> resolution = const Value.absent(),
          Value<String?> thumbnailPath = const Value.absent(),
          bool? isFavorited,
          bool? isArchived,
          Value<DateTime?> lastPlayed = const Value.absent(),
          int? playCount,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      MediaItem(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        category: category ?? this.category,
        series: series.present ? series.value : this.series,
        sourceHash: sourceHash ?? this.sourceHash,
        encryptedPath: encryptedPath ?? this.encryptedPath,
        encryptionKeyId: encryptionKeyId ?? this.encryptionKeyId,
        encryptedSize: encryptedSize ?? this.encryptedSize,
        encryptedAt: encryptedAt ?? this.encryptedAt,
        durationSeconds: durationSeconds ?? this.durationSeconds,
        codec: codec.present ? codec.value : this.codec,
        resolution: resolution.present ? resolution.value : this.resolution,
        thumbnailPath:
            thumbnailPath.present ? thumbnailPath.value : this.thumbnailPath,
        isFavorited: isFavorited ?? this.isFavorited,
        isArchived: isArchived ?? this.isArchived,
        lastPlayed: lastPlayed.present ? lastPlayed.value : this.lastPlayed,
        playCount: playCount ?? this.playCount,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  MediaItem copyWithCompanion(MediaItemsCompanion data) {
    return MediaItem(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      category: data.category.present ? data.category.value : this.category,
      series: data.series.present ? data.series.value : this.series,
      sourceHash:
          data.sourceHash.present ? data.sourceHash.value : this.sourceHash,
      encryptedPath: data.encryptedPath.present
          ? data.encryptedPath.value
          : this.encryptedPath,
      encryptionKeyId: data.encryptionKeyId.present
          ? data.encryptionKeyId.value
          : this.encryptionKeyId,
      encryptedSize: data.encryptedSize.present
          ? data.encryptedSize.value
          : this.encryptedSize,
      encryptedAt:
          data.encryptedAt.present ? data.encryptedAt.value : this.encryptedAt,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      codec: data.codec.present ? data.codec.value : this.codec,
      resolution:
          data.resolution.present ? data.resolution.value : this.resolution,
      thumbnailPath: data.thumbnailPath.present
          ? data.thumbnailPath.value
          : this.thumbnailPath,
      isFavorited:
          data.isFavorited.present ? data.isFavorited.value : this.isFavorited,
      isArchived:
          data.isArchived.present ? data.isArchived.value : this.isArchived,
      lastPlayed:
          data.lastPlayed.present ? data.lastPlayed.value : this.lastPlayed,
      playCount: data.playCount.present ? data.playCount.value : this.playCount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('series: $series, ')
          ..write('sourceHash: $sourceHash, ')
          ..write('encryptedPath: $encryptedPath, ')
          ..write('encryptionKeyId: $encryptionKeyId, ')
          ..write('encryptedSize: $encryptedSize, ')
          ..write('encryptedAt: $encryptedAt, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('codec: $codec, ')
          ..write('resolution: $resolution, ')
          ..write('thumbnailPath: $thumbnailPath, ')
          ..write('isFavorited: $isFavorited, ')
          ..write('isArchived: $isArchived, ')
          ..write('lastPlayed: $lastPlayed, ')
          ..write('playCount: $playCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      title,
      description,
      category,
      series,
      sourceHash,
      encryptedPath,
      encryptionKeyId,
      encryptedSize,
      encryptedAt,
      durationSeconds,
      codec,
      resolution,
      thumbnailPath,
      isFavorited,
      isArchived,
      lastPlayed,
      playCount,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.category == this.category &&
          other.series == this.series &&
          other.sourceHash == this.sourceHash &&
          other.encryptedPath == this.encryptedPath &&
          other.encryptionKeyId == this.encryptionKeyId &&
          other.encryptedSize == this.encryptedSize &&
          other.encryptedAt == this.encryptedAt &&
          other.durationSeconds == this.durationSeconds &&
          other.codec == this.codec &&
          other.resolution == this.resolution &&
          other.thumbnailPath == this.thumbnailPath &&
          other.isFavorited == this.isFavorited &&
          other.isArchived == this.isArchived &&
          other.lastPlayed == this.lastPlayed &&
          other.playCount == this.playCount &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MediaItemsCompanion extends UpdateCompanion<MediaItem> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<MediaCategory> category;
  final Value<String?> series;
  final Value<String> sourceHash;
  final Value<String> encryptedPath;
  final Value<String> encryptionKeyId;
  final Value<int> encryptedSize;
  final Value<DateTime> encryptedAt;
  final Value<int> durationSeconds;
  final Value<String?> codec;
  final Value<String?> resolution;
  final Value<String?> thumbnailPath;
  final Value<bool> isFavorited;
  final Value<bool> isArchived;
  final Value<DateTime?> lastPlayed;
  final Value<int> playCount;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const MediaItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.series = const Value.absent(),
    this.sourceHash = const Value.absent(),
    this.encryptedPath = const Value.absent(),
    this.encryptionKeyId = const Value.absent(),
    this.encryptedSize = const Value.absent(),
    this.encryptedAt = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.codec = const Value.absent(),
    this.resolution = const Value.absent(),
    this.thumbnailPath = const Value.absent(),
    this.isFavorited = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.lastPlayed = const Value.absent(),
    this.playCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MediaItemsCompanion.insert({
    required String id,
    required String title,
    this.description = const Value.absent(),
    required MediaCategory category,
    this.series = const Value.absent(),
    required String sourceHash,
    required String encryptedPath,
    required String encryptionKeyId,
    required int encryptedSize,
    required DateTime encryptedAt,
    required int durationSeconds,
    this.codec = const Value.absent(),
    this.resolution = const Value.absent(),
    this.thumbnailPath = const Value.absent(),
    this.isFavorited = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.lastPlayed = const Value.absent(),
    this.playCount = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        category = Value(category),
        sourceHash = Value(sourceHash),
        encryptedPath = Value(encryptedPath),
        encryptionKeyId = Value(encryptionKeyId),
        encryptedSize = Value(encryptedSize),
        encryptedAt = Value(encryptedAt),
        durationSeconds = Value(durationSeconds),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<MediaItem> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? category,
    Expression<String>? series,
    Expression<String>? sourceHash,
    Expression<String>? encryptedPath,
    Expression<String>? encryptionKeyId,
    Expression<int>? encryptedSize,
    Expression<DateTime>? encryptedAt,
    Expression<int>? durationSeconds,
    Expression<String>? codec,
    Expression<String>? resolution,
    Expression<String>? thumbnailPath,
    Expression<bool>? isFavorited,
    Expression<bool>? isArchived,
    Expression<DateTime>? lastPlayed,
    Expression<int>? playCount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (series != null) 'series': series,
      if (sourceHash != null) 'source_hash': sourceHash,
      if (encryptedPath != null) 'encrypted_path': encryptedPath,
      if (encryptionKeyId != null) 'encryption_key_id': encryptionKeyId,
      if (encryptedSize != null) 'encrypted_size': encryptedSize,
      if (encryptedAt != null) 'encrypted_at': encryptedAt,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (codec != null) 'codec': codec,
      if (resolution != null) 'resolution': resolution,
      if (thumbnailPath != null) 'thumbnail_path': thumbnailPath,
      if (isFavorited != null) 'is_favorited': isFavorited,
      if (isArchived != null) 'is_archived': isArchived,
      if (lastPlayed != null) 'last_played': lastPlayed,
      if (playCount != null) 'play_count': playCount,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MediaItemsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<MediaCategory>? category,
      Value<String?>? series,
      Value<String>? sourceHash,
      Value<String>? encryptedPath,
      Value<String>? encryptionKeyId,
      Value<int>? encryptedSize,
      Value<DateTime>? encryptedAt,
      Value<int>? durationSeconds,
      Value<String?>? codec,
      Value<String?>? resolution,
      Value<String?>? thumbnailPath,
      Value<bool>? isFavorited,
      Value<bool>? isArchived,
      Value<DateTime?>? lastPlayed,
      Value<int>? playCount,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return MediaItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      series: series ?? this.series,
      sourceHash: sourceHash ?? this.sourceHash,
      encryptedPath: encryptedPath ?? this.encryptedPath,
      encryptionKeyId: encryptionKeyId ?? this.encryptionKeyId,
      encryptedSize: encryptedSize ?? this.encryptedSize,
      encryptedAt: encryptedAt ?? this.encryptedAt,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      codec: codec ?? this.codec,
      resolution: resolution ?? this.resolution,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
      isFavorited: isFavorited ?? this.isFavorited,
      isArchived: isArchived ?? this.isArchived,
      lastPlayed: lastPlayed ?? this.lastPlayed,
      playCount: playCount ?? this.playCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(
          $MediaItemsTable.$convertercategory.toSql(category.value));
    }
    if (series.present) {
      map['series'] = Variable<String>(series.value);
    }
    if (sourceHash.present) {
      map['source_hash'] = Variable<String>(sourceHash.value);
    }
    if (encryptedPath.present) {
      map['encrypted_path'] = Variable<String>(encryptedPath.value);
    }
    if (encryptionKeyId.present) {
      map['encryption_key_id'] = Variable<String>(encryptionKeyId.value);
    }
    if (encryptedSize.present) {
      map['encrypted_size'] = Variable<int>(encryptedSize.value);
    }
    if (encryptedAt.present) {
      map['encrypted_at'] = Variable<DateTime>(encryptedAt.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (codec.present) {
      map['codec'] = Variable<String>(codec.value);
    }
    if (resolution.present) {
      map['resolution'] = Variable<String>(resolution.value);
    }
    if (thumbnailPath.present) {
      map['thumbnail_path'] = Variable<String>(thumbnailPath.value);
    }
    if (isFavorited.present) {
      map['is_favorited'] = Variable<bool>(isFavorited.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (lastPlayed.present) {
      map['last_played'] = Variable<DateTime>(lastPlayed.value);
    }
    if (playCount.present) {
      map['play_count'] = Variable<int>(playCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('series: $series, ')
          ..write('sourceHash: $sourceHash, ')
          ..write('encryptedPath: $encryptedPath, ')
          ..write('encryptionKeyId: $encryptionKeyId, ')
          ..write('encryptedSize: $encryptedSize, ')
          ..write('encryptedAt: $encryptedAt, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('codec: $codec, ')
          ..write('resolution: $resolution, ')
          ..write('thumbnailPath: $thumbnailPath, ')
          ..write('isFavorited: $isFavorited, ')
          ..write('isArchived: $isArchived, ')
          ..write('lastPlayed: $lastPlayed, ')
          ..write('playCount: $playCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CollectionsTable extends Collections
    with TableInfo<$CollectionsTable, Collection> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<MediaCategory?, String>
      categoryFilter = GeneratedColumn<String>(
              'category_filter', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<MediaCategory?>(
              $CollectionsTable.$convertercategoryFiltern);
  static const VerificationMeta _isSmartMeta =
      const VerificationMeta('isSmart');
  @override
  late final GeneratedColumn<bool> isSmart = GeneratedColumn<bool>(
      'is_smart', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_smart" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _queryRulesMeta =
      const VerificationMeta('queryRules');
  @override
  late final GeneratedColumn<String> queryRules = GeneratedColumn<String>(
      'query_rules', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _requiresAuthMeta =
      const VerificationMeta('requiresAuth');
  @override
  late final GeneratedColumn<bool> requiresAuth = GeneratedColumn<bool>(
      'requires_auth', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("requires_auth" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _authPinHashMeta =
      const VerificationMeta('authPinHash');
  @override
  late final GeneratedColumn<String> authPinHash = GeneratedColumn<String>(
      'auth_pin_hash', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        icon,
        color,
        categoryFilter,
        isSmart,
        queryRules,
        requiresAuth,
        authPinHash,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'collections';
  @override
  VerificationContext validateIntegrity(Insertable<Collection> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    if (data.containsKey('is_smart')) {
      context.handle(_isSmartMeta,
          isSmart.isAcceptableOrUnknown(data['is_smart']!, _isSmartMeta));
    }
    if (data.containsKey('query_rules')) {
      context.handle(
          _queryRulesMeta,
          queryRules.isAcceptableOrUnknown(
              data['query_rules']!, _queryRulesMeta));
    }
    if (data.containsKey('requires_auth')) {
      context.handle(
          _requiresAuthMeta,
          requiresAuth.isAcceptableOrUnknown(
              data['requires_auth']!, _requiresAuthMeta));
    }
    if (data.containsKey('auth_pin_hash')) {
      context.handle(
          _authPinHashMeta,
          authPinHash.isAcceptableOrUnknown(
              data['auth_pin_hash']!, _authPinHashMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {name},
      ];
  @override
  Collection map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Collection(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon']),
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color']),
      categoryFilter: $CollectionsTable.$convertercategoryFiltern.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}category_filter'])),
      isSmart: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_smart'])!,
      queryRules: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}query_rules']),
      requiresAuth: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}requires_auth'])!,
      authPinHash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}auth_pin_hash']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $CollectionsTable createAlias(String alias) {
    return $CollectionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MediaCategory, String, String>
      $convertercategoryFilter =
      const EnumNameConverter<MediaCategory>(MediaCategory.values);
  static JsonTypeConverter2<MediaCategory?, String?, String?>
      $convertercategoryFiltern =
      JsonTypeConverter2.asNullable($convertercategoryFilter);
}

class Collection extends DataClass implements Insertable<Collection> {
  final int id;
  final String name;
  final String? description;
  final String? icon;
  final String? color;
  final MediaCategory? categoryFilter;
  final bool isSmart;
  final String? queryRules;
  final bool requiresAuth;
  final String? authPinHash;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Collection(
      {required this.id,
      required this.name,
      this.description,
      this.icon,
      this.color,
      this.categoryFilter,
      required this.isSmart,
      this.queryRules,
      required this.requiresAuth,
      this.authPinHash,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    if (!nullToAbsent || categoryFilter != null) {
      map['category_filter'] = Variable<String>(
          $CollectionsTable.$convertercategoryFiltern.toSql(categoryFilter));
    }
    map['is_smart'] = Variable<bool>(isSmart);
    if (!nullToAbsent || queryRules != null) {
      map['query_rules'] = Variable<String>(queryRules);
    }
    map['requires_auth'] = Variable<bool>(requiresAuth);
    if (!nullToAbsent || authPinHash != null) {
      map['auth_pin_hash'] = Variable<String>(authPinHash);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CollectionsCompanion toCompanion(bool nullToAbsent) {
    return CollectionsCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      categoryFilter: categoryFilter == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryFilter),
      isSmart: Value(isSmart),
      queryRules: queryRules == null && nullToAbsent
          ? const Value.absent()
          : Value(queryRules),
      requiresAuth: Value(requiresAuth),
      authPinHash: authPinHash == null && nullToAbsent
          ? const Value.absent()
          : Value(authPinHash),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Collection.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Collection(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      icon: serializer.fromJson<String?>(json['icon']),
      color: serializer.fromJson<String?>(json['color']),
      categoryFilter: $CollectionsTable.$convertercategoryFiltern
          .fromJson(serializer.fromJson<String?>(json['categoryFilter'])),
      isSmart: serializer.fromJson<bool>(json['isSmart']),
      queryRules: serializer.fromJson<String?>(json['queryRules']),
      requiresAuth: serializer.fromJson<bool>(json['requiresAuth']),
      authPinHash: serializer.fromJson<String?>(json['authPinHash']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'icon': serializer.toJson<String?>(icon),
      'color': serializer.toJson<String?>(color),
      'categoryFilter': serializer.toJson<String?>(
          $CollectionsTable.$convertercategoryFiltern.toJson(categoryFilter)),
      'isSmart': serializer.toJson<bool>(isSmart),
      'queryRules': serializer.toJson<String?>(queryRules),
      'requiresAuth': serializer.toJson<bool>(requiresAuth),
      'authPinHash': serializer.toJson<String?>(authPinHash),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Collection copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<String?> icon = const Value.absent(),
          Value<String?> color = const Value.absent(),
          Value<MediaCategory?> categoryFilter = const Value.absent(),
          bool? isSmart,
          Value<String?> queryRules = const Value.absent(),
          bool? requiresAuth,
          Value<String?> authPinHash = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Collection(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        icon: icon.present ? icon.value : this.icon,
        color: color.present ? color.value : this.color,
        categoryFilter:
            categoryFilter.present ? categoryFilter.value : this.categoryFilter,
        isSmart: isSmart ?? this.isSmart,
        queryRules: queryRules.present ? queryRules.value : this.queryRules,
        requiresAuth: requiresAuth ?? this.requiresAuth,
        authPinHash: authPinHash.present ? authPinHash.value : this.authPinHash,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Collection copyWithCompanion(CollectionsCompanion data) {
    return Collection(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      icon: data.icon.present ? data.icon.value : this.icon,
      color: data.color.present ? data.color.value : this.color,
      categoryFilter: data.categoryFilter.present
          ? data.categoryFilter.value
          : this.categoryFilter,
      isSmart: data.isSmart.present ? data.isSmart.value : this.isSmart,
      queryRules:
          data.queryRules.present ? data.queryRules.value : this.queryRules,
      requiresAuth: data.requiresAuth.present
          ? data.requiresAuth.value
          : this.requiresAuth,
      authPinHash:
          data.authPinHash.present ? data.authPinHash.value : this.authPinHash,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Collection(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('icon: $icon, ')
          ..write('color: $color, ')
          ..write('categoryFilter: $categoryFilter, ')
          ..write('isSmart: $isSmart, ')
          ..write('queryRules: $queryRules, ')
          ..write('requiresAuth: $requiresAuth, ')
          ..write('authPinHash: $authPinHash, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      description,
      icon,
      color,
      categoryFilter,
      isSmart,
      queryRules,
      requiresAuth,
      authPinHash,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Collection &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.icon == this.icon &&
          other.color == this.color &&
          other.categoryFilter == this.categoryFilter &&
          other.isSmart == this.isSmart &&
          other.queryRules == this.queryRules &&
          other.requiresAuth == this.requiresAuth &&
          other.authPinHash == this.authPinHash &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CollectionsCompanion extends UpdateCompanion<Collection> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> icon;
  final Value<String?> color;
  final Value<MediaCategory?> categoryFilter;
  final Value<bool> isSmart;
  final Value<String?> queryRules;
  final Value<bool> requiresAuth;
  final Value<String?> authPinHash;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const CollectionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.icon = const Value.absent(),
    this.color = const Value.absent(),
    this.categoryFilter = const Value.absent(),
    this.isSmart = const Value.absent(),
    this.queryRules = const Value.absent(),
    this.requiresAuth = const Value.absent(),
    this.authPinHash = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CollectionsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.icon = const Value.absent(),
    this.color = const Value.absent(),
    this.categoryFilter = const Value.absent(),
    this.isSmart = const Value.absent(),
    this.queryRules = const Value.absent(),
    this.requiresAuth = const Value.absent(),
    this.authPinHash = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Collection> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? icon,
    Expression<String>? color,
    Expression<String>? categoryFilter,
    Expression<bool>? isSmart,
    Expression<String>? queryRules,
    Expression<bool>? requiresAuth,
    Expression<String>? authPinHash,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (icon != null) 'icon': icon,
      if (color != null) 'color': color,
      if (categoryFilter != null) 'category_filter': categoryFilter,
      if (isSmart != null) 'is_smart': isSmart,
      if (queryRules != null) 'query_rules': queryRules,
      if (requiresAuth != null) 'requires_auth': requiresAuth,
      if (authPinHash != null) 'auth_pin_hash': authPinHash,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CollectionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? icon,
      Value<String?>? color,
      Value<MediaCategory?>? categoryFilter,
      Value<bool>? isSmart,
      Value<String?>? queryRules,
      Value<bool>? requiresAuth,
      Value<String?>? authPinHash,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return CollectionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      categoryFilter: categoryFilter ?? this.categoryFilter,
      isSmart: isSmart ?? this.isSmart,
      queryRules: queryRules ?? this.queryRules,
      requiresAuth: requiresAuth ?? this.requiresAuth,
      authPinHash: authPinHash ?? this.authPinHash,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (categoryFilter.present) {
      map['category_filter'] = Variable<String>($CollectionsTable
          .$convertercategoryFiltern
          .toSql(categoryFilter.value));
    }
    if (isSmart.present) {
      map['is_smart'] = Variable<bool>(isSmart.value);
    }
    if (queryRules.present) {
      map['query_rules'] = Variable<String>(queryRules.value);
    }
    if (requiresAuth.present) {
      map['requires_auth'] = Variable<bool>(requiresAuth.value);
    }
    if (authPinHash.present) {
      map['auth_pin_hash'] = Variable<String>(authPinHash.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('icon: $icon, ')
          ..write('color: $color, ')
          ..write('categoryFilter: $categoryFilter, ')
          ..write('isSmart: $isSmart, ')
          ..write('queryRules: $queryRules, ')
          ..write('requiresAuth: $requiresAuth, ')
          ..write('authPinHash: $authPinHash, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CollectionItemsTable extends CollectionItems
    with TableInfo<$CollectionItemsTable, CollectionItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollectionItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _collectionIdMeta =
      const VerificationMeta('collectionId');
  @override
  late final GeneratedColumn<int> collectionId = GeneratedColumn<int>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES collections (id)'));
  static const VerificationMeta _mediaItemIdMeta =
      const VerificationMeta('mediaItemId');
  @override
  late final GeneratedColumn<String> mediaItemId = GeneratedColumn<String>(
      'media_item_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES media_items (id)'));
  static const VerificationMeta _positionMeta =
      const VerificationMeta('position');
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _addedAtMeta =
      const VerificationMeta('addedAt');
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
      'added_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, collectionId, mediaItemId, position, addedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'collection_items';
  @override
  VerificationContext validateIntegrity(Insertable<CollectionItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('collection_id')) {
      context.handle(
          _collectionIdMeta,
          collectionId.isAcceptableOrUnknown(
              data['collection_id']!, _collectionIdMeta));
    } else if (isInserting) {
      context.missing(_collectionIdMeta);
    }
    if (data.containsKey('media_item_id')) {
      context.handle(
          _mediaItemIdMeta,
          mediaItemId.isAcceptableOrUnknown(
              data['media_item_id']!, _mediaItemIdMeta));
    } else if (isInserting) {
      context.missing(_mediaItemIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    }
    if (data.containsKey('added_at')) {
      context.handle(_addedAtMeta,
          addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta));
    } else if (isInserting) {
      context.missing(_addedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CollectionItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CollectionItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}collection_id'])!,
      mediaItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}media_item_id'])!,
      position: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}position'])!,
      addedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}added_at'])!,
    );
  }

  @override
  $CollectionItemsTable createAlias(String alias) {
    return $CollectionItemsTable(attachedDatabase, alias);
  }
}

class CollectionItem extends DataClass implements Insertable<CollectionItem> {
  final int id;
  final int collectionId;
  final String mediaItemId;
  final int position;
  final DateTime addedAt;
  const CollectionItem(
      {required this.id,
      required this.collectionId,
      required this.mediaItemId,
      required this.position,
      required this.addedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['collection_id'] = Variable<int>(collectionId);
    map['media_item_id'] = Variable<String>(mediaItemId);
    map['position'] = Variable<int>(position);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  CollectionItemsCompanion toCompanion(bool nullToAbsent) {
    return CollectionItemsCompanion(
      id: Value(id),
      collectionId: Value(collectionId),
      mediaItemId: Value(mediaItemId),
      position: Value(position),
      addedAt: Value(addedAt),
    );
  }

  factory CollectionItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CollectionItem(
      id: serializer.fromJson<int>(json['id']),
      collectionId: serializer.fromJson<int>(json['collectionId']),
      mediaItemId: serializer.fromJson<String>(json['mediaItemId']),
      position: serializer.fromJson<int>(json['position']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'collectionId': serializer.toJson<int>(collectionId),
      'mediaItemId': serializer.toJson<String>(mediaItemId),
      'position': serializer.toJson<int>(position),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  CollectionItem copyWith(
          {int? id,
          int? collectionId,
          String? mediaItemId,
          int? position,
          DateTime? addedAt}) =>
      CollectionItem(
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        mediaItemId: mediaItemId ?? this.mediaItemId,
        position: position ?? this.position,
        addedAt: addedAt ?? this.addedAt,
      );
  CollectionItem copyWithCompanion(CollectionItemsCompanion data) {
    return CollectionItem(
      id: data.id.present ? data.id.value : this.id,
      collectionId: data.collectionId.present
          ? data.collectionId.value
          : this.collectionId,
      mediaItemId:
          data.mediaItemId.present ? data.mediaItemId.value : this.mediaItemId,
      position: data.position.present ? data.position.value : this.position,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CollectionItem(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('mediaItemId: $mediaItemId, ')
          ..write('position: $position, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, collectionId, mediaItemId, position, addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CollectionItem &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.mediaItemId == this.mediaItemId &&
          other.position == this.position &&
          other.addedAt == this.addedAt);
}

class CollectionItemsCompanion extends UpdateCompanion<CollectionItem> {
  final Value<int> id;
  final Value<int> collectionId;
  final Value<String> mediaItemId;
  final Value<int> position;
  final Value<DateTime> addedAt;
  const CollectionItemsCompanion({
    this.id = const Value.absent(),
    this.collectionId = const Value.absent(),
    this.mediaItemId = const Value.absent(),
    this.position = const Value.absent(),
    this.addedAt = const Value.absent(),
  });
  CollectionItemsCompanion.insert({
    this.id = const Value.absent(),
    required int collectionId,
    required String mediaItemId,
    this.position = const Value.absent(),
    required DateTime addedAt,
  })  : collectionId = Value(collectionId),
        mediaItemId = Value(mediaItemId),
        addedAt = Value(addedAt);
  static Insertable<CollectionItem> custom({
    Expression<int>? id,
    Expression<int>? collectionId,
    Expression<String>? mediaItemId,
    Expression<int>? position,
    Expression<DateTime>? addedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (collectionId != null) 'collection_id': collectionId,
      if (mediaItemId != null) 'media_item_id': mediaItemId,
      if (position != null) 'position': position,
      if (addedAt != null) 'added_at': addedAt,
    });
  }

  CollectionItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? collectionId,
      Value<String>? mediaItemId,
      Value<int>? position,
      Value<DateTime>? addedAt}) {
    return CollectionItemsCompanion(
      id: id ?? this.id,
      collectionId: collectionId ?? this.collectionId,
      mediaItemId: mediaItemId ?? this.mediaItemId,
      position: position ?? this.position,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (collectionId.present) {
      map['collection_id'] = Variable<int>(collectionId.value);
    }
    if (mediaItemId.present) {
      map['media_item_id'] = Variable<String>(mediaItemId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionItemsCompanion(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('mediaItemId: $mediaItemId, ')
          ..write('position: $position, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, Tag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, color, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags';
  @override
  VerificationContext validateIntegrity(Insertable<Tag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tag(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(attachedDatabase, alias);
  }
}

class Tag extends DataClass implements Insertable<Tag> {
  final int id;
  final String name;
  final String? color;
  final DateTime createdAt;
  const Tag(
      {required this.id,
      required this.name,
      this.color,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(
      id: Value(id),
      name: Value(name),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      createdAt: Value(createdAt),
    );
  }

  factory Tag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tag(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String?>(json['color']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String?>(color),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Tag copyWith(
          {int? id,
          String? name,
          Value<String?> color = const Value.absent(),
          DateTime? createdAt}) =>
      Tag(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color.present ? color.value : this.color,
        createdAt: createdAt ?? this.createdAt,
      );
  Tag copyWithCompanion(TagsCompanion data) {
    return Tag(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tag(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tag &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.createdAt == this.createdAt);
}

class TagsCompanion extends UpdateCompanion<Tag> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> color;
  final Value<DateTime> createdAt;
  const TagsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TagsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.color = const Value.absent(),
    required DateTime createdAt,
  })  : name = Value(name),
        createdAt = Value(createdAt);
  static Insertable<Tag> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? color,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TagsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? color,
      Value<DateTime>? createdAt}) {
    return TagsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $MediaTagsTable extends MediaTags
    with TableInfo<$MediaTagsTable, MediaTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediaTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _mediaItemIdMeta =
      const VerificationMeta('mediaItemId');
  @override
  late final GeneratedColumn<String> mediaItemId = GeneratedColumn<String>(
      'media_item_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES media_items (id)'));
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int> tagId = GeneratedColumn<int>(
      'tag_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tags (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, mediaItemId, tagId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_tags';
  @override
  VerificationContext validateIntegrity(Insertable<MediaTag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('media_item_id')) {
      context.handle(
          _mediaItemIdMeta,
          mediaItemId.isAcceptableOrUnknown(
              data['media_item_id']!, _mediaItemIdMeta));
    } else if (isInserting) {
      context.missing(_mediaItemIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MediaTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaTag(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      mediaItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}media_item_id'])!,
      tagId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tag_id'])!,
    );
  }

  @override
  $MediaTagsTable createAlias(String alias) {
    return $MediaTagsTable(attachedDatabase, alias);
  }
}

class MediaTag extends DataClass implements Insertable<MediaTag> {
  final int id;
  final String mediaItemId;
  final int tagId;
  const MediaTag(
      {required this.id, required this.mediaItemId, required this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['media_item_id'] = Variable<String>(mediaItemId);
    map['tag_id'] = Variable<int>(tagId);
    return map;
  }

  MediaTagsCompanion toCompanion(bool nullToAbsent) {
    return MediaTagsCompanion(
      id: Value(id),
      mediaItemId: Value(mediaItemId),
      tagId: Value(tagId),
    );
  }

  factory MediaTag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaTag(
      id: serializer.fromJson<int>(json['id']),
      mediaItemId: serializer.fromJson<String>(json['mediaItemId']),
      tagId: serializer.fromJson<int>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'mediaItemId': serializer.toJson<String>(mediaItemId),
      'tagId': serializer.toJson<int>(tagId),
    };
  }

  MediaTag copyWith({int? id, String? mediaItemId, int? tagId}) => MediaTag(
        id: id ?? this.id,
        mediaItemId: mediaItemId ?? this.mediaItemId,
        tagId: tagId ?? this.tagId,
      );
  MediaTag copyWithCompanion(MediaTagsCompanion data) {
    return MediaTag(
      id: data.id.present ? data.id.value : this.id,
      mediaItemId:
          data.mediaItemId.present ? data.mediaItemId.value : this.mediaItemId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaTag(')
          ..write('id: $id, ')
          ..write('mediaItemId: $mediaItemId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, mediaItemId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaTag &&
          other.id == this.id &&
          other.mediaItemId == this.mediaItemId &&
          other.tagId == this.tagId);
}

class MediaTagsCompanion extends UpdateCompanion<MediaTag> {
  final Value<int> id;
  final Value<String> mediaItemId;
  final Value<int> tagId;
  const MediaTagsCompanion({
    this.id = const Value.absent(),
    this.mediaItemId = const Value.absent(),
    this.tagId = const Value.absent(),
  });
  MediaTagsCompanion.insert({
    this.id = const Value.absent(),
    required String mediaItemId,
    required int tagId,
  })  : mediaItemId = Value(mediaItemId),
        tagId = Value(tagId);
  static Insertable<MediaTag> custom({
    Expression<int>? id,
    Expression<String>? mediaItemId,
    Expression<int>? tagId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mediaItemId != null) 'media_item_id': mediaItemId,
      if (tagId != null) 'tag_id': tagId,
    });
  }

  MediaTagsCompanion copyWith(
      {Value<int>? id, Value<String>? mediaItemId, Value<int>? tagId}) {
    return MediaTagsCompanion(
      id: id ?? this.id,
      mediaItemId: mediaItemId ?? this.mediaItemId,
      tagId: tagId ?? this.tagId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (mediaItemId.present) {
      map['media_item_id'] = Variable<String>(mediaItemId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaTagsCompanion(')
          ..write('id: $id, ')
          ..write('mediaItemId: $mediaItemId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }
}

class $EncryptionKeysTable extends EncryptionKeys
    with TableInfo<$EncryptionKeysTable, EncryptionKey> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EncryptionKeysTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _keyIdMeta = const VerificationMeta('keyId');
  @override
  late final GeneratedColumn<String> keyId = GeneratedColumn<String>(
      'key_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _algorithmMeta =
      const VerificationMeta('algorithm');
  @override
  late final GeneratedColumn<String> algorithm = GeneratedColumn<String>(
      'algorithm', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _keyDerivationSaltMeta =
      const VerificationMeta('keyDerivationSalt');
  @override
  late final GeneratedColumn<String> keyDerivationSalt =
      GeneratedColumn<String>('key_derivation_salt', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns =>
      [id, keyId, algorithm, keyDerivationSalt, createdAt, isActive];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'encryption_keys';
  @override
  VerificationContext validateIntegrity(Insertable<EncryptionKey> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('key_id')) {
      context.handle(
          _keyIdMeta, keyId.isAcceptableOrUnknown(data['key_id']!, _keyIdMeta));
    } else if (isInserting) {
      context.missing(_keyIdMeta);
    }
    if (data.containsKey('algorithm')) {
      context.handle(_algorithmMeta,
          algorithm.isAcceptableOrUnknown(data['algorithm']!, _algorithmMeta));
    } else if (isInserting) {
      context.missing(_algorithmMeta);
    }
    if (data.containsKey('key_derivation_salt')) {
      context.handle(
          _keyDerivationSaltMeta,
          keyDerivationSalt.isAcceptableOrUnknown(
              data['key_derivation_salt']!, _keyDerivationSaltMeta));
    } else if (isInserting) {
      context.missing(_keyDerivationSaltMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EncryptionKey map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EncryptionKey(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      keyId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key_id'])!,
      algorithm: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}algorithm'])!,
      keyDerivationSalt: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}key_derivation_salt'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  $EncryptionKeysTable createAlias(String alias) {
    return $EncryptionKeysTable(attachedDatabase, alias);
  }
}

class EncryptionKey extends DataClass implements Insertable<EncryptionKey> {
  final int id;
  final String keyId;
  final String algorithm;
  final String keyDerivationSalt;
  final DateTime createdAt;
  final bool isActive;
  const EncryptionKey(
      {required this.id,
      required this.keyId,
      required this.algorithm,
      required this.keyDerivationSalt,
      required this.createdAt,
      required this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['key_id'] = Variable<String>(keyId);
    map['algorithm'] = Variable<String>(algorithm);
    map['key_derivation_salt'] = Variable<String>(keyDerivationSalt);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  EncryptionKeysCompanion toCompanion(bool nullToAbsent) {
    return EncryptionKeysCompanion(
      id: Value(id),
      keyId: Value(keyId),
      algorithm: Value(algorithm),
      keyDerivationSalt: Value(keyDerivationSalt),
      createdAt: Value(createdAt),
      isActive: Value(isActive),
    );
  }

  factory EncryptionKey.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EncryptionKey(
      id: serializer.fromJson<int>(json['id']),
      keyId: serializer.fromJson<String>(json['keyId']),
      algorithm: serializer.fromJson<String>(json['algorithm']),
      keyDerivationSalt: serializer.fromJson<String>(json['keyDerivationSalt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'keyId': serializer.toJson<String>(keyId),
      'algorithm': serializer.toJson<String>(algorithm),
      'keyDerivationSalt': serializer.toJson<String>(keyDerivationSalt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  EncryptionKey copyWith(
          {int? id,
          String? keyId,
          String? algorithm,
          String? keyDerivationSalt,
          DateTime? createdAt,
          bool? isActive}) =>
      EncryptionKey(
        id: id ?? this.id,
        keyId: keyId ?? this.keyId,
        algorithm: algorithm ?? this.algorithm,
        keyDerivationSalt: keyDerivationSalt ?? this.keyDerivationSalt,
        createdAt: createdAt ?? this.createdAt,
        isActive: isActive ?? this.isActive,
      );
  EncryptionKey copyWithCompanion(EncryptionKeysCompanion data) {
    return EncryptionKey(
      id: data.id.present ? data.id.value : this.id,
      keyId: data.keyId.present ? data.keyId.value : this.keyId,
      algorithm: data.algorithm.present ? data.algorithm.value : this.algorithm,
      keyDerivationSalt: data.keyDerivationSalt.present
          ? data.keyDerivationSalt.value
          : this.keyDerivationSalt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EncryptionKey(')
          ..write('id: $id, ')
          ..write('keyId: $keyId, ')
          ..write('algorithm: $algorithm, ')
          ..write('keyDerivationSalt: $keyDerivationSalt, ')
          ..write('createdAt: $createdAt, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, keyId, algorithm, keyDerivationSalt, createdAt, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EncryptionKey &&
          other.id == this.id &&
          other.keyId == this.keyId &&
          other.algorithm == this.algorithm &&
          other.keyDerivationSalt == this.keyDerivationSalt &&
          other.createdAt == this.createdAt &&
          other.isActive == this.isActive);
}

class EncryptionKeysCompanion extends UpdateCompanion<EncryptionKey> {
  final Value<int> id;
  final Value<String> keyId;
  final Value<String> algorithm;
  final Value<String> keyDerivationSalt;
  final Value<DateTime> createdAt;
  final Value<bool> isActive;
  const EncryptionKeysCompanion({
    this.id = const Value.absent(),
    this.keyId = const Value.absent(),
    this.algorithm = const Value.absent(),
    this.keyDerivationSalt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  EncryptionKeysCompanion.insert({
    this.id = const Value.absent(),
    required String keyId,
    required String algorithm,
    required String keyDerivationSalt,
    required DateTime createdAt,
    this.isActive = const Value.absent(),
  })  : keyId = Value(keyId),
        algorithm = Value(algorithm),
        keyDerivationSalt = Value(keyDerivationSalt),
        createdAt = Value(createdAt);
  static Insertable<EncryptionKey> custom({
    Expression<int>? id,
    Expression<String>? keyId,
    Expression<String>? algorithm,
    Expression<String>? keyDerivationSalt,
    Expression<DateTime>? createdAt,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (keyId != null) 'key_id': keyId,
      if (algorithm != null) 'algorithm': algorithm,
      if (keyDerivationSalt != null) 'key_derivation_salt': keyDerivationSalt,
      if (createdAt != null) 'created_at': createdAt,
      if (isActive != null) 'is_active': isActive,
    });
  }

  EncryptionKeysCompanion copyWith(
      {Value<int>? id,
      Value<String>? keyId,
      Value<String>? algorithm,
      Value<String>? keyDerivationSalt,
      Value<DateTime>? createdAt,
      Value<bool>? isActive}) {
    return EncryptionKeysCompanion(
      id: id ?? this.id,
      keyId: keyId ?? this.keyId,
      algorithm: algorithm ?? this.algorithm,
      keyDerivationSalt: keyDerivationSalt ?? this.keyDerivationSalt,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (keyId.present) {
      map['key_id'] = Variable<String>(keyId.value);
    }
    if (algorithm.present) {
      map['algorithm'] = Variable<String>(algorithm.value);
    }
    if (keyDerivationSalt.present) {
      map['key_derivation_salt'] = Variable<String>(keyDerivationSalt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EncryptionKeysCompanion(')
          ..write('id: $id, ')
          ..write('keyId: $keyId, ')
          ..write('algorithm: $algorithm, ')
          ..write('keyDerivationSalt: $keyDerivationSalt, ')
          ..write('createdAt: $createdAt, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, key, value, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(Insertable<AppSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final int id;
  final String key;
  final String value;
  final DateTime updatedAt;
  const AppSetting(
      {required this.id,
      required this.key,
      required this.value,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      id: Value(id),
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory AppSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      id: serializer.fromJson<int>(json['id']),
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AppSetting copyWith(
          {int? id, String? key, String? value, DateTime? updatedAt}) =>
      AppSetting(
        id: id ?? this.id,
        key: key ?? this.key,
        value: value ?? this.value,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      id: data.id.present ? data.id.value : this.id,
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.id == this.id &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<int> id;
  final Value<String> key;
  final Value<String> value;
  final Value<DateTime> updatedAt;
  const AppSettingsCompanion({
    this.id = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    this.id = const Value.absent(),
    required String key,
    required String value,
    required DateTime updatedAt,
  })  : key = Value(key),
        value = Value(value),
        updatedAt = Value(updatedAt);
  static Insertable<AppSetting> custom({
    Expression<int>? id,
    Expression<String>? key,
    Expression<String>? value,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  AppSettingsCompanion copyWith(
      {Value<int>? id,
      Value<String>? key,
      Value<String>? value,
      Value<DateTime>? updatedAt}) {
    return AppSettingsCompanion(
      id: id ?? this.id,
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SystemLogsTable extends SystemLogs
    with TableInfo<$SystemLogsTable, SystemLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SystemLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumnWithTypeConverter<LogLevel, int> level =
      GeneratedColumn<int>('level', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<LogLevel>($SystemLogsTable.$converterlevel);
  static const VerificationMeta _moduleMeta = const VerificationMeta('module');
  @override
  late final GeneratedColumn<String> module = GeneratedColumn<String>(
      'module', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _messageMeta =
      const VerificationMeta('message');
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
      'message', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _detailsMeta =
      const VerificationMeta('details');
  @override
  late final GeneratedColumn<String> details = GeneratedColumn<String>(
      'details', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, level, module, message, details, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'system_logs';
  @override
  VerificationContext validateIntegrity(Insertable<SystemLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('module')) {
      context.handle(_moduleMeta,
          module.isAcceptableOrUnknown(data['module']!, _moduleMeta));
    } else if (isInserting) {
      context.missing(_moduleMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('details')) {
      context.handle(_detailsMeta,
          details.isAcceptableOrUnknown(data['details']!, _detailsMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SystemLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SystemLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      level: $SystemLogsTable.$converterlevel.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level'])!),
      module: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}module'])!,
      message: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message'])!,
      details: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}details']),
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $SystemLogsTable createAlias(String alias) {
    return $SystemLogsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<LogLevel, int, int> $converterlevel =
      const EnumIndexConverter<LogLevel>(LogLevel.values);
}

class SystemLog extends DataClass implements Insertable<SystemLog> {
  final int id;
  final LogLevel level;
  final String module;
  final String message;
  final String? details;
  final DateTime timestamp;
  const SystemLog(
      {required this.id,
      required this.level,
      required this.module,
      required this.message,
      this.details,
      required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['level'] =
          Variable<int>($SystemLogsTable.$converterlevel.toSql(level));
    }
    map['module'] = Variable<String>(module);
    map['message'] = Variable<String>(message);
    if (!nullToAbsent || details != null) {
      map['details'] = Variable<String>(details);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  SystemLogsCompanion toCompanion(bool nullToAbsent) {
    return SystemLogsCompanion(
      id: Value(id),
      level: Value(level),
      module: Value(module),
      message: Value(message),
      details: details == null && nullToAbsent
          ? const Value.absent()
          : Value(details),
      timestamp: Value(timestamp),
    );
  }

  factory SystemLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SystemLog(
      id: serializer.fromJson<int>(json['id']),
      level: $SystemLogsTable.$converterlevel
          .fromJson(serializer.fromJson<int>(json['level'])),
      module: serializer.fromJson<String>(json['module']),
      message: serializer.fromJson<String>(json['message']),
      details: serializer.fromJson<String?>(json['details']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'level': serializer
          .toJson<int>($SystemLogsTable.$converterlevel.toJson(level)),
      'module': serializer.toJson<String>(module),
      'message': serializer.toJson<String>(message),
      'details': serializer.toJson<String?>(details),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  SystemLog copyWith(
          {int? id,
          LogLevel? level,
          String? module,
          String? message,
          Value<String?> details = const Value.absent(),
          DateTime? timestamp}) =>
      SystemLog(
        id: id ?? this.id,
        level: level ?? this.level,
        module: module ?? this.module,
        message: message ?? this.message,
        details: details.present ? details.value : this.details,
        timestamp: timestamp ?? this.timestamp,
      );
  SystemLog copyWithCompanion(SystemLogsCompanion data) {
    return SystemLog(
      id: data.id.present ? data.id.value : this.id,
      level: data.level.present ? data.level.value : this.level,
      module: data.module.present ? data.module.value : this.module,
      message: data.message.present ? data.message.value : this.message,
      details: data.details.present ? data.details.value : this.details,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SystemLog(')
          ..write('id: $id, ')
          ..write('level: $level, ')
          ..write('module: $module, ')
          ..write('message: $message, ')
          ..write('details: $details, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, level, module, message, details, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SystemLog &&
          other.id == this.id &&
          other.level == this.level &&
          other.module == this.module &&
          other.message == this.message &&
          other.details == this.details &&
          other.timestamp == this.timestamp);
}

class SystemLogsCompanion extends UpdateCompanion<SystemLog> {
  final Value<int> id;
  final Value<LogLevel> level;
  final Value<String> module;
  final Value<String> message;
  final Value<String?> details;
  final Value<DateTime> timestamp;
  const SystemLogsCompanion({
    this.id = const Value.absent(),
    this.level = const Value.absent(),
    this.module = const Value.absent(),
    this.message = const Value.absent(),
    this.details = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  SystemLogsCompanion.insert({
    this.id = const Value.absent(),
    required LogLevel level,
    required String module,
    required String message,
    this.details = const Value.absent(),
    required DateTime timestamp,
  })  : level = Value(level),
        module = Value(module),
        message = Value(message),
        timestamp = Value(timestamp);
  static Insertable<SystemLog> custom({
    Expression<int>? id,
    Expression<int>? level,
    Expression<String>? module,
    Expression<String>? message,
    Expression<String>? details,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (level != null) 'level': level,
      if (module != null) 'module': module,
      if (message != null) 'message': message,
      if (details != null) 'details': details,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  SystemLogsCompanion copyWith(
      {Value<int>? id,
      Value<LogLevel>? level,
      Value<String>? module,
      Value<String>? message,
      Value<String?>? details,
      Value<DateTime>? timestamp}) {
    return SystemLogsCompanion(
      id: id ?? this.id,
      level: level ?? this.level,
      module: module ?? this.module,
      message: message ?? this.message,
      details: details ?? this.details,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (level.present) {
      map['level'] =
          Variable<int>($SystemLogsTable.$converterlevel.toSql(level.value));
    }
    if (module.present) {
      map['module'] = Variable<String>(module.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (details.present) {
      map['details'] = Variable<String>(details.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SystemLogsCompanion(')
          ..write('id: $id, ')
          ..write('level: $level, ')
          ..write('module: $module, ')
          ..write('message: $message, ')
          ..write('details: $details, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

abstract class _$ClueDatabase extends GeneratedDatabase {
  _$ClueDatabase(QueryExecutor e) : super(e);
  $ClueDatabaseManager get managers => $ClueDatabaseManager(this);
  late final $MediaItemsTable mediaItems = $MediaItemsTable(this);
  late final $CollectionsTable collections = $CollectionsTable(this);
  late final $CollectionItemsTable collectionItems =
      $CollectionItemsTable(this);
  late final $TagsTable tags = $TagsTable(this);
  late final $MediaTagsTable mediaTags = $MediaTagsTable(this);
  late final $EncryptionKeysTable encryptionKeys = $EncryptionKeysTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final $SystemLogsTable systemLogs = $SystemLogsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        mediaItems,
        collections,
        collectionItems,
        tags,
        mediaTags,
        encryptionKeys,
        appSettings,
        systemLogs
      ];
}

typedef $$MediaItemsTableCreateCompanionBuilder = MediaItemsCompanion Function({
  required String id,
  required String title,
  Value<String?> description,
  required MediaCategory category,
  Value<String?> series,
  required String sourceHash,
  required String encryptedPath,
  required String encryptionKeyId,
  required int encryptedSize,
  required DateTime encryptedAt,
  required int durationSeconds,
  Value<String?> codec,
  Value<String?> resolution,
  Value<String?> thumbnailPath,
  Value<bool> isFavorited,
  Value<bool> isArchived,
  Value<DateTime?> lastPlayed,
  Value<int> playCount,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$MediaItemsTableUpdateCompanionBuilder = MediaItemsCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String?> description,
  Value<MediaCategory> category,
  Value<String?> series,
  Value<String> sourceHash,
  Value<String> encryptedPath,
  Value<String> encryptionKeyId,
  Value<int> encryptedSize,
  Value<DateTime> encryptedAt,
  Value<int> durationSeconds,
  Value<String?> codec,
  Value<String?> resolution,
  Value<String?> thumbnailPath,
  Value<bool> isFavorited,
  Value<bool> isArchived,
  Value<DateTime?> lastPlayed,
  Value<int> playCount,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$MediaItemsTableReferences
    extends BaseReferences<_$ClueDatabase, $MediaItemsTable, MediaItem> {
  $$MediaItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CollectionItemsTable, List<CollectionItem>>
      _collectionItemsRefsTable(_$ClueDatabase db) =>
          MultiTypedResultKey.fromTable(db.collectionItems,
              aliasName: $_aliasNameGenerator(
                  db.mediaItems.id, db.collectionItems.mediaItemId));

  $$CollectionItemsTableProcessedTableManager get collectionItemsRefs {
    final manager = $$CollectionItemsTableTableManager(
            $_db, $_db.collectionItems)
        .filter((f) => f.mediaItemId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_collectionItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$MediaTagsTable, List<MediaTag>>
      _mediaTagsRefsTable(_$ClueDatabase db) => MultiTypedResultKey.fromTable(
          db.mediaTags,
          aliasName:
              $_aliasNameGenerator(db.mediaItems.id, db.mediaTags.mediaItemId));

  $$MediaTagsTableProcessedTableManager get mediaTagsRefs {
    final manager = $$MediaTagsTableTableManager($_db, $_db.mediaTags)
        .filter((f) => f.mediaItemId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_mediaTagsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$MediaItemsTableFilterComposer
    extends Composer<_$ClueDatabase, $MediaItemsTable> {
  $$MediaItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<MediaCategory, MediaCategory, String>
      get category => $composableBuilder(
          column: $table.category,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get series => $composableBuilder(
      column: $table.series, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceHash => $composableBuilder(
      column: $table.sourceHash, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get encryptedPath => $composableBuilder(
      column: $table.encryptedPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get encryptionKeyId => $composableBuilder(
      column: $table.encryptionKeyId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get encryptedSize => $composableBuilder(
      column: $table.encryptedSize, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get encryptedAt => $composableBuilder(
      column: $table.encryptedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get durationSeconds => $composableBuilder(
      column: $table.durationSeconds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get codec => $composableBuilder(
      column: $table.codec, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get resolution => $composableBuilder(
      column: $table.resolution, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get thumbnailPath => $composableBuilder(
      column: $table.thumbnailPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isFavorited => $composableBuilder(
      column: $table.isFavorited, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastPlayed => $composableBuilder(
      column: $table.lastPlayed, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get playCount => $composableBuilder(
      column: $table.playCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> collectionItemsRefs(
      Expression<bool> Function($$CollectionItemsTableFilterComposer f) f) {
    final $$CollectionItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.collectionItems,
        getReferencedColumn: (t) => t.mediaItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionItemsTableFilterComposer(
              $db: $db,
              $table: $db.collectionItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> mediaTagsRefs(
      Expression<bool> Function($$MediaTagsTableFilterComposer f) f) {
    final $$MediaTagsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.mediaTags,
        getReferencedColumn: (t) => t.mediaItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MediaTagsTableFilterComposer(
              $db: $db,
              $table: $db.mediaTags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$MediaItemsTableOrderingComposer
    extends Composer<_$ClueDatabase, $MediaItemsTable> {
  $$MediaItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get series => $composableBuilder(
      column: $table.series, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceHash => $composableBuilder(
      column: $table.sourceHash, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get encryptedPath => $composableBuilder(
      column: $table.encryptedPath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get encryptionKeyId => $composableBuilder(
      column: $table.encryptionKeyId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get encryptedSize => $composableBuilder(
      column: $table.encryptedSize,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get encryptedAt => $composableBuilder(
      column: $table.encryptedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
      column: $table.durationSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get codec => $composableBuilder(
      column: $table.codec, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get resolution => $composableBuilder(
      column: $table.resolution, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get thumbnailPath => $composableBuilder(
      column: $table.thumbnailPath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isFavorited => $composableBuilder(
      column: $table.isFavorited, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastPlayed => $composableBuilder(
      column: $table.lastPlayed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get playCount => $composableBuilder(
      column: $table.playCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$MediaItemsTableAnnotationComposer
    extends Composer<_$ClueDatabase, $MediaItemsTable> {
  $$MediaItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MediaCategory, String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get series =>
      $composableBuilder(column: $table.series, builder: (column) => column);

  GeneratedColumn<String> get sourceHash => $composableBuilder(
      column: $table.sourceHash, builder: (column) => column);

  GeneratedColumn<String> get encryptedPath => $composableBuilder(
      column: $table.encryptedPath, builder: (column) => column);

  GeneratedColumn<String> get encryptionKeyId => $composableBuilder(
      column: $table.encryptionKeyId, builder: (column) => column);

  GeneratedColumn<int> get encryptedSize => $composableBuilder(
      column: $table.encryptedSize, builder: (column) => column);

  GeneratedColumn<DateTime> get encryptedAt => $composableBuilder(
      column: $table.encryptedAt, builder: (column) => column);

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
      column: $table.durationSeconds, builder: (column) => column);

  GeneratedColumn<String> get codec =>
      $composableBuilder(column: $table.codec, builder: (column) => column);

  GeneratedColumn<String> get resolution => $composableBuilder(
      column: $table.resolution, builder: (column) => column);

  GeneratedColumn<String> get thumbnailPath => $composableBuilder(
      column: $table.thumbnailPath, builder: (column) => column);

  GeneratedColumn<bool> get isFavorited => $composableBuilder(
      column: $table.isFavorited, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => column);

  GeneratedColumn<DateTime> get lastPlayed => $composableBuilder(
      column: $table.lastPlayed, builder: (column) => column);

  GeneratedColumn<int> get playCount =>
      $composableBuilder(column: $table.playCount, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> collectionItemsRefs<T extends Object>(
      Expression<T> Function($$CollectionItemsTableAnnotationComposer a) f) {
    final $$CollectionItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.collectionItems,
        getReferencedColumn: (t) => t.mediaItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.collectionItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> mediaTagsRefs<T extends Object>(
      Expression<T> Function($$MediaTagsTableAnnotationComposer a) f) {
    final $$MediaTagsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.mediaTags,
        getReferencedColumn: (t) => t.mediaItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MediaTagsTableAnnotationComposer(
              $db: $db,
              $table: $db.mediaTags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$MediaItemsTableTableManager extends RootTableManager<
    _$ClueDatabase,
    $MediaItemsTable,
    MediaItem,
    $$MediaItemsTableFilterComposer,
    $$MediaItemsTableOrderingComposer,
    $$MediaItemsTableAnnotationComposer,
    $$MediaItemsTableCreateCompanionBuilder,
    $$MediaItemsTableUpdateCompanionBuilder,
    (MediaItem, $$MediaItemsTableReferences),
    MediaItem,
    PrefetchHooks Function({bool collectionItemsRefs, bool mediaTagsRefs})> {
  $$MediaItemsTableTableManager(_$ClueDatabase db, $MediaItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MediaItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MediaItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MediaItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<MediaCategory> category = const Value.absent(),
            Value<String?> series = const Value.absent(),
            Value<String> sourceHash = const Value.absent(),
            Value<String> encryptedPath = const Value.absent(),
            Value<String> encryptionKeyId = const Value.absent(),
            Value<int> encryptedSize = const Value.absent(),
            Value<DateTime> encryptedAt = const Value.absent(),
            Value<int> durationSeconds = const Value.absent(),
            Value<String?> codec = const Value.absent(),
            Value<String?> resolution = const Value.absent(),
            Value<String?> thumbnailPath = const Value.absent(),
            Value<bool> isFavorited = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<DateTime?> lastPlayed = const Value.absent(),
            Value<int> playCount = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MediaItemsCompanion(
            id: id,
            title: title,
            description: description,
            category: category,
            series: series,
            sourceHash: sourceHash,
            encryptedPath: encryptedPath,
            encryptionKeyId: encryptionKeyId,
            encryptedSize: encryptedSize,
            encryptedAt: encryptedAt,
            durationSeconds: durationSeconds,
            codec: codec,
            resolution: resolution,
            thumbnailPath: thumbnailPath,
            isFavorited: isFavorited,
            isArchived: isArchived,
            lastPlayed: lastPlayed,
            playCount: playCount,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            Value<String?> description = const Value.absent(),
            required MediaCategory category,
            Value<String?> series = const Value.absent(),
            required String sourceHash,
            required String encryptedPath,
            required String encryptionKeyId,
            required int encryptedSize,
            required DateTime encryptedAt,
            required int durationSeconds,
            Value<String?> codec = const Value.absent(),
            Value<String?> resolution = const Value.absent(),
            Value<String?> thumbnailPath = const Value.absent(),
            Value<bool> isFavorited = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<DateTime?> lastPlayed = const Value.absent(),
            Value<int> playCount = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              MediaItemsCompanion.insert(
            id: id,
            title: title,
            description: description,
            category: category,
            series: series,
            sourceHash: sourceHash,
            encryptedPath: encryptedPath,
            encryptionKeyId: encryptionKeyId,
            encryptedSize: encryptedSize,
            encryptedAt: encryptedAt,
            durationSeconds: durationSeconds,
            codec: codec,
            resolution: resolution,
            thumbnailPath: thumbnailPath,
            isFavorited: isFavorited,
            isArchived: isArchived,
            lastPlayed: lastPlayed,
            playCount: playCount,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MediaItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {collectionItemsRefs = false, mediaTagsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (collectionItemsRefs) db.collectionItems,
                if (mediaTagsRefs) db.mediaTags
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (collectionItemsRefs)
                    await $_getPrefetchedData<MediaItem, $MediaItemsTable,
                            CollectionItem>(
                        currentTable: table,
                        referencedTable: $$MediaItemsTableReferences
                            ._collectionItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MediaItemsTableReferences(db, table, p0)
                                .collectionItemsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.mediaItemId == item.id),
                        typedResults: items),
                  if (mediaTagsRefs)
                    await $_getPrefetchedData<MediaItem, $MediaItemsTable,
                            MediaTag>(
                        currentTable: table,
                        referencedTable:
                            $$MediaItemsTableReferences._mediaTagsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MediaItemsTableReferences(db, table, p0)
                                .mediaTagsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.mediaItemId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$MediaItemsTableProcessedTableManager = ProcessedTableManager<
    _$ClueDatabase,
    $MediaItemsTable,
    MediaItem,
    $$MediaItemsTableFilterComposer,
    $$MediaItemsTableOrderingComposer,
    $$MediaItemsTableAnnotationComposer,
    $$MediaItemsTableCreateCompanionBuilder,
    $$MediaItemsTableUpdateCompanionBuilder,
    (MediaItem, $$MediaItemsTableReferences),
    MediaItem,
    PrefetchHooks Function({bool collectionItemsRefs, bool mediaTagsRefs})>;
typedef $$CollectionsTableCreateCompanionBuilder = CollectionsCompanion
    Function({
  Value<int> id,
  required String name,
  Value<String?> description,
  Value<String?> icon,
  Value<String?> color,
  Value<MediaCategory?> categoryFilter,
  Value<bool> isSmart,
  Value<String?> queryRules,
  Value<bool> requiresAuth,
  Value<String?> authPinHash,
  required DateTime createdAt,
  required DateTime updatedAt,
});
typedef $$CollectionsTableUpdateCompanionBuilder = CollectionsCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
  Value<String?> icon,
  Value<String?> color,
  Value<MediaCategory?> categoryFilter,
  Value<bool> isSmart,
  Value<String?> queryRules,
  Value<bool> requiresAuth,
  Value<String?> authPinHash,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$CollectionsTableReferences
    extends BaseReferences<_$ClueDatabase, $CollectionsTable, Collection> {
  $$CollectionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CollectionItemsTable, List<CollectionItem>>
      _collectionItemsRefsTable(_$ClueDatabase db) =>
          MultiTypedResultKey.fromTable(db.collectionItems,
              aliasName: $_aliasNameGenerator(
                  db.collections.id, db.collectionItems.collectionId));

  $$CollectionItemsTableProcessedTableManager get collectionItemsRefs {
    final manager = $$CollectionItemsTableTableManager(
            $_db, $_db.collectionItems)
        .filter((f) => f.collectionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_collectionItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CollectionsTableFilterComposer
    extends Composer<_$ClueDatabase, $CollectionsTable> {
  $$CollectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<MediaCategory?, MediaCategory, String>
      get categoryFilter => $composableBuilder(
          column: $table.categoryFilter,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get isSmart => $composableBuilder(
      column: $table.isSmart, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get queryRules => $composableBuilder(
      column: $table.queryRules, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get requiresAuth => $composableBuilder(
      column: $table.requiresAuth, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get authPinHash => $composableBuilder(
      column: $table.authPinHash, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> collectionItemsRefs(
      Expression<bool> Function($$CollectionItemsTableFilterComposer f) f) {
    final $$CollectionItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.collectionItems,
        getReferencedColumn: (t) => t.collectionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionItemsTableFilterComposer(
              $db: $db,
              $table: $db.collectionItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CollectionsTableOrderingComposer
    extends Composer<_$ClueDatabase, $CollectionsTable> {
  $$CollectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryFilter => $composableBuilder(
      column: $table.categoryFilter,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSmart => $composableBuilder(
      column: $table.isSmart, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get queryRules => $composableBuilder(
      column: $table.queryRules, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get requiresAuth => $composableBuilder(
      column: $table.requiresAuth,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get authPinHash => $composableBuilder(
      column: $table.authPinHash, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$CollectionsTableAnnotationComposer
    extends Composer<_$ClueDatabase, $CollectionsTable> {
  $$CollectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MediaCategory?, String> get categoryFilter =>
      $composableBuilder(
          column: $table.categoryFilter, builder: (column) => column);

  GeneratedColumn<bool> get isSmart =>
      $composableBuilder(column: $table.isSmart, builder: (column) => column);

  GeneratedColumn<String> get queryRules => $composableBuilder(
      column: $table.queryRules, builder: (column) => column);

  GeneratedColumn<bool> get requiresAuth => $composableBuilder(
      column: $table.requiresAuth, builder: (column) => column);

  GeneratedColumn<String> get authPinHash => $composableBuilder(
      column: $table.authPinHash, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> collectionItemsRefs<T extends Object>(
      Expression<T> Function($$CollectionItemsTableAnnotationComposer a) f) {
    final $$CollectionItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.collectionItems,
        getReferencedColumn: (t) => t.collectionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.collectionItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CollectionsTableTableManager extends RootTableManager<
    _$ClueDatabase,
    $CollectionsTable,
    Collection,
    $$CollectionsTableFilterComposer,
    $$CollectionsTableOrderingComposer,
    $$CollectionsTableAnnotationComposer,
    $$CollectionsTableCreateCompanionBuilder,
    $$CollectionsTableUpdateCompanionBuilder,
    (Collection, $$CollectionsTableReferences),
    Collection,
    PrefetchHooks Function({bool collectionItemsRefs})> {
  $$CollectionsTableTableManager(_$ClueDatabase db, $CollectionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CollectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CollectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CollectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> icon = const Value.absent(),
            Value<String?> color = const Value.absent(),
            Value<MediaCategory?> categoryFilter = const Value.absent(),
            Value<bool> isSmart = const Value.absent(),
            Value<String?> queryRules = const Value.absent(),
            Value<bool> requiresAuth = const Value.absent(),
            Value<String?> authPinHash = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              CollectionsCompanion(
            id: id,
            name: name,
            description: description,
            icon: icon,
            color: color,
            categoryFilter: categoryFilter,
            isSmart: isSmart,
            queryRules: queryRules,
            requiresAuth: requiresAuth,
            authPinHash: authPinHash,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String?> icon = const Value.absent(),
            Value<String?> color = const Value.absent(),
            Value<MediaCategory?> categoryFilter = const Value.absent(),
            Value<bool> isSmart = const Value.absent(),
            Value<String?> queryRules = const Value.absent(),
            Value<bool> requiresAuth = const Value.absent(),
            Value<String?> authPinHash = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
          }) =>
              CollectionsCompanion.insert(
            id: id,
            name: name,
            description: description,
            icon: icon,
            color: color,
            categoryFilter: categoryFilter,
            isSmart: isSmart,
            queryRules: queryRules,
            requiresAuth: requiresAuth,
            authPinHash: authPinHash,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CollectionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({collectionItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (collectionItemsRefs) db.collectionItems
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (collectionItemsRefs)
                    await $_getPrefetchedData<Collection, $CollectionsTable,
                            CollectionItem>(
                        currentTable: table,
                        referencedTable: $$CollectionsTableReferences
                            ._collectionItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CollectionsTableReferences(db, table, p0)
                                .collectionItemsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.collectionId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CollectionsTableProcessedTableManager = ProcessedTableManager<
    _$ClueDatabase,
    $CollectionsTable,
    Collection,
    $$CollectionsTableFilterComposer,
    $$CollectionsTableOrderingComposer,
    $$CollectionsTableAnnotationComposer,
    $$CollectionsTableCreateCompanionBuilder,
    $$CollectionsTableUpdateCompanionBuilder,
    (Collection, $$CollectionsTableReferences),
    Collection,
    PrefetchHooks Function({bool collectionItemsRefs})>;
typedef $$CollectionItemsTableCreateCompanionBuilder = CollectionItemsCompanion
    Function({
  Value<int> id,
  required int collectionId,
  required String mediaItemId,
  Value<int> position,
  required DateTime addedAt,
});
typedef $$CollectionItemsTableUpdateCompanionBuilder = CollectionItemsCompanion
    Function({
  Value<int> id,
  Value<int> collectionId,
  Value<String> mediaItemId,
  Value<int> position,
  Value<DateTime> addedAt,
});

final class $$CollectionItemsTableReferences extends BaseReferences<
    _$ClueDatabase, $CollectionItemsTable, CollectionItem> {
  $$CollectionItemsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CollectionsTable _collectionIdTable(_$ClueDatabase db) =>
      db.collections.createAlias($_aliasNameGenerator(
          db.collectionItems.collectionId, db.collections.id));

  $$CollectionsTableProcessedTableManager get collectionId {
    final $_column = $_itemColumn<int>('collection_id')!;

    final manager = $$CollectionsTableTableManager($_db, $_db.collections)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_collectionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $MediaItemsTable _mediaItemIdTable(_$ClueDatabase db) =>
      db.mediaItems.createAlias($_aliasNameGenerator(
          db.collectionItems.mediaItemId, db.mediaItems.id));

  $$MediaItemsTableProcessedTableManager get mediaItemId {
    final $_column = $_itemColumn<String>('media_item_id')!;

    final manager = $$MediaItemsTableTableManager($_db, $_db.mediaItems)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mediaItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$CollectionItemsTableFilterComposer
    extends Composer<_$ClueDatabase, $CollectionItemsTable> {
  $$CollectionItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get position => $composableBuilder(
      column: $table.position, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
      column: $table.addedAt, builder: (column) => ColumnFilters(column));

  $$CollectionsTableFilterComposer get collectionId {
    final $$CollectionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.collections,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionsTableFilterComposer(
              $db: $db,
              $table: $db.collections,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MediaItemsTableFilterComposer get mediaItemId {
    final $$MediaItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.mediaItemId,
        referencedTable: $db.mediaItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MediaItemsTableFilterComposer(
              $db: $db,
              $table: $db.mediaItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CollectionItemsTableOrderingComposer
    extends Composer<_$ClueDatabase, $CollectionItemsTable> {
  $$CollectionItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get position => $composableBuilder(
      column: $table.position, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
      column: $table.addedAt, builder: (column) => ColumnOrderings(column));

  $$CollectionsTableOrderingComposer get collectionId {
    final $$CollectionsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.collections,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionsTableOrderingComposer(
              $db: $db,
              $table: $db.collections,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MediaItemsTableOrderingComposer get mediaItemId {
    final $$MediaItemsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.mediaItemId,
        referencedTable: $db.mediaItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MediaItemsTableOrderingComposer(
              $db: $db,
              $table: $db.mediaItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CollectionItemsTableAnnotationComposer
    extends Composer<_$ClueDatabase, $CollectionItemsTable> {
  $$CollectionItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);

  $$CollectionsTableAnnotationComposer get collectionId {
    final $$CollectionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.collections,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionsTableAnnotationComposer(
              $db: $db,
              $table: $db.collections,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MediaItemsTableAnnotationComposer get mediaItemId {
    final $$MediaItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.mediaItemId,
        referencedTable: $db.mediaItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MediaItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.mediaItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CollectionItemsTableTableManager extends RootTableManager<
    _$ClueDatabase,
    $CollectionItemsTable,
    CollectionItem,
    $$CollectionItemsTableFilterComposer,
    $$CollectionItemsTableOrderingComposer,
    $$CollectionItemsTableAnnotationComposer,
    $$CollectionItemsTableCreateCompanionBuilder,
    $$CollectionItemsTableUpdateCompanionBuilder,
    (CollectionItem, $$CollectionItemsTableReferences),
    CollectionItem,
    PrefetchHooks Function({bool collectionId, bool mediaItemId})> {
  $$CollectionItemsTableTableManager(
      _$ClueDatabase db, $CollectionItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CollectionItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CollectionItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CollectionItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> collectionId = const Value.absent(),
            Value<String> mediaItemId = const Value.absent(),
            Value<int> position = const Value.absent(),
            Value<DateTime> addedAt = const Value.absent(),
          }) =>
              CollectionItemsCompanion(
            id: id,
            collectionId: collectionId,
            mediaItemId: mediaItemId,
            position: position,
            addedAt: addedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int collectionId,
            required String mediaItemId,
            Value<int> position = const Value.absent(),
            required DateTime addedAt,
          }) =>
              CollectionItemsCompanion.insert(
            id: id,
            collectionId: collectionId,
            mediaItemId: mediaItemId,
            position: position,
            addedAt: addedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CollectionItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({collectionId = false, mediaItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (collectionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.collectionId,
                    referencedTable:
                        $$CollectionItemsTableReferences._collectionIdTable(db),
                    referencedColumn: $$CollectionItemsTableReferences
                        ._collectionIdTable(db)
                        .id,
                  ) as T;
                }
                if (mediaItemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.mediaItemId,
                    referencedTable:
                        $$CollectionItemsTableReferences._mediaItemIdTable(db),
                    referencedColumn: $$CollectionItemsTableReferences
                        ._mediaItemIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$CollectionItemsTableProcessedTableManager = ProcessedTableManager<
    _$ClueDatabase,
    $CollectionItemsTable,
    CollectionItem,
    $$CollectionItemsTableFilterComposer,
    $$CollectionItemsTableOrderingComposer,
    $$CollectionItemsTableAnnotationComposer,
    $$CollectionItemsTableCreateCompanionBuilder,
    $$CollectionItemsTableUpdateCompanionBuilder,
    (CollectionItem, $$CollectionItemsTableReferences),
    CollectionItem,
    PrefetchHooks Function({bool collectionId, bool mediaItemId})>;
typedef $$TagsTableCreateCompanionBuilder = TagsCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> color,
  required DateTime createdAt,
});
typedef $$TagsTableUpdateCompanionBuilder = TagsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> color,
  Value<DateTime> createdAt,
});

final class $$TagsTableReferences
    extends BaseReferences<_$ClueDatabase, $TagsTable, Tag> {
  $$TagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MediaTagsTable, List<MediaTag>>
      _mediaTagsRefsTable(_$ClueDatabase db) =>
          MultiTypedResultKey.fromTable(db.mediaTags,
              aliasName: $_aliasNameGenerator(db.tags.id, db.mediaTags.tagId));

  $$MediaTagsTableProcessedTableManager get mediaTagsRefs {
    final manager = $$MediaTagsTableTableManager($_db, $_db.mediaTags)
        .filter((f) => f.tagId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_mediaTagsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TagsTableFilterComposer extends Composer<_$ClueDatabase, $TagsTable> {
  $$TagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> mediaTagsRefs(
      Expression<bool> Function($$MediaTagsTableFilterComposer f) f) {
    final $$MediaTagsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.mediaTags,
        getReferencedColumn: (t) => t.tagId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MediaTagsTableFilterComposer(
              $db: $db,
              $table: $db.mediaTags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TagsTableOrderingComposer extends Composer<_$ClueDatabase, $TagsTable> {
  $$TagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$TagsTableAnnotationComposer
    extends Composer<_$ClueDatabase, $TagsTable> {
  $$TagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> mediaTagsRefs<T extends Object>(
      Expression<T> Function($$MediaTagsTableAnnotationComposer a) f) {
    final $$MediaTagsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.mediaTags,
        getReferencedColumn: (t) => t.tagId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MediaTagsTableAnnotationComposer(
              $db: $db,
              $table: $db.mediaTags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TagsTableTableManager extends RootTableManager<
    _$ClueDatabase,
    $TagsTable,
    Tag,
    $$TagsTableFilterComposer,
    $$TagsTableOrderingComposer,
    $$TagsTableAnnotationComposer,
    $$TagsTableCreateCompanionBuilder,
    $$TagsTableUpdateCompanionBuilder,
    (Tag, $$TagsTableReferences),
    Tag,
    PrefetchHooks Function({bool mediaTagsRefs})> {
  $$TagsTableTableManager(_$ClueDatabase db, $TagsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> color = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TagsCompanion(
            id: id,
            name: name,
            color: color,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> color = const Value.absent(),
            required DateTime createdAt,
          }) =>
              TagsCompanion.insert(
            id: id,
            name: name,
            color: color,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TagsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({mediaTagsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (mediaTagsRefs) db.mediaTags],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (mediaTagsRefs)
                    await $_getPrefetchedData<Tag, $TagsTable, MediaTag>(
                        currentTable: table,
                        referencedTable:
                            $$TagsTableReferences._mediaTagsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TagsTableReferences(db, table, p0).mediaTagsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.tagId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TagsTableProcessedTableManager = ProcessedTableManager<
    _$ClueDatabase,
    $TagsTable,
    Tag,
    $$TagsTableFilterComposer,
    $$TagsTableOrderingComposer,
    $$TagsTableAnnotationComposer,
    $$TagsTableCreateCompanionBuilder,
    $$TagsTableUpdateCompanionBuilder,
    (Tag, $$TagsTableReferences),
    Tag,
    PrefetchHooks Function({bool mediaTagsRefs})>;
typedef $$MediaTagsTableCreateCompanionBuilder = MediaTagsCompanion Function({
  Value<int> id,
  required String mediaItemId,
  required int tagId,
});
typedef $$MediaTagsTableUpdateCompanionBuilder = MediaTagsCompanion Function({
  Value<int> id,
  Value<String> mediaItemId,
  Value<int> tagId,
});

final class $$MediaTagsTableReferences
    extends BaseReferences<_$ClueDatabase, $MediaTagsTable, MediaTag> {
  $$MediaTagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MediaItemsTable _mediaItemIdTable(_$ClueDatabase db) =>
      db.mediaItems.createAlias(
          $_aliasNameGenerator(db.mediaTags.mediaItemId, db.mediaItems.id));

  $$MediaItemsTableProcessedTableManager get mediaItemId {
    final $_column = $_itemColumn<String>('media_item_id')!;

    final manager = $$MediaItemsTableTableManager($_db, $_db.mediaItems)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mediaItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TagsTable _tagIdTable(_$ClueDatabase db) =>
      db.tags.createAlias($_aliasNameGenerator(db.mediaTags.tagId, db.tags.id));

  $$TagsTableProcessedTableManager get tagId {
    final $_column = $_itemColumn<int>('tag_id')!;

    final manager = $$TagsTableTableManager($_db, $_db.tags)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MediaTagsTableFilterComposer
    extends Composer<_$ClueDatabase, $MediaTagsTable> {
  $$MediaTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  $$MediaItemsTableFilterComposer get mediaItemId {
    final $$MediaItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.mediaItemId,
        referencedTable: $db.mediaItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MediaItemsTableFilterComposer(
              $db: $db,
              $table: $db.mediaItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TagsTableFilterComposer get tagId {
    final $$TagsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagId,
        referencedTable: $db.tags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagsTableFilterComposer(
              $db: $db,
              $table: $db.tags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MediaTagsTableOrderingComposer
    extends Composer<_$ClueDatabase, $MediaTagsTable> {
  $$MediaTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  $$MediaItemsTableOrderingComposer get mediaItemId {
    final $$MediaItemsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.mediaItemId,
        referencedTable: $db.mediaItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MediaItemsTableOrderingComposer(
              $db: $db,
              $table: $db.mediaItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TagsTableOrderingComposer get tagId {
    final $$TagsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagId,
        referencedTable: $db.tags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagsTableOrderingComposer(
              $db: $db,
              $table: $db.tags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MediaTagsTableAnnotationComposer
    extends Composer<_$ClueDatabase, $MediaTagsTable> {
  $$MediaTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$MediaItemsTableAnnotationComposer get mediaItemId {
    final $$MediaItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.mediaItemId,
        referencedTable: $db.mediaItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MediaItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.mediaItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TagsTableAnnotationComposer get tagId {
    final $$TagsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagId,
        referencedTable: $db.tags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagsTableAnnotationComposer(
              $db: $db,
              $table: $db.tags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MediaTagsTableTableManager extends RootTableManager<
    _$ClueDatabase,
    $MediaTagsTable,
    MediaTag,
    $$MediaTagsTableFilterComposer,
    $$MediaTagsTableOrderingComposer,
    $$MediaTagsTableAnnotationComposer,
    $$MediaTagsTableCreateCompanionBuilder,
    $$MediaTagsTableUpdateCompanionBuilder,
    (MediaTag, $$MediaTagsTableReferences),
    MediaTag,
    PrefetchHooks Function({bool mediaItemId, bool tagId})> {
  $$MediaTagsTableTableManager(_$ClueDatabase db, $MediaTagsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MediaTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MediaTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MediaTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> mediaItemId = const Value.absent(),
            Value<int> tagId = const Value.absent(),
          }) =>
              MediaTagsCompanion(
            id: id,
            mediaItemId: mediaItemId,
            tagId: tagId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String mediaItemId,
            required int tagId,
          }) =>
              MediaTagsCompanion.insert(
            id: id,
            mediaItemId: mediaItemId,
            tagId: tagId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MediaTagsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({mediaItemId = false, tagId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (mediaItemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.mediaItemId,
                    referencedTable:
                        $$MediaTagsTableReferences._mediaItemIdTable(db),
                    referencedColumn:
                        $$MediaTagsTableReferences._mediaItemIdTable(db).id,
                  ) as T;
                }
                if (tagId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.tagId,
                    referencedTable: $$MediaTagsTableReferences._tagIdTable(db),
                    referencedColumn:
                        $$MediaTagsTableReferences._tagIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MediaTagsTableProcessedTableManager = ProcessedTableManager<
    _$ClueDatabase,
    $MediaTagsTable,
    MediaTag,
    $$MediaTagsTableFilterComposer,
    $$MediaTagsTableOrderingComposer,
    $$MediaTagsTableAnnotationComposer,
    $$MediaTagsTableCreateCompanionBuilder,
    $$MediaTagsTableUpdateCompanionBuilder,
    (MediaTag, $$MediaTagsTableReferences),
    MediaTag,
    PrefetchHooks Function({bool mediaItemId, bool tagId})>;
typedef $$EncryptionKeysTableCreateCompanionBuilder = EncryptionKeysCompanion
    Function({
  Value<int> id,
  required String keyId,
  required String algorithm,
  required String keyDerivationSalt,
  required DateTime createdAt,
  Value<bool> isActive,
});
typedef $$EncryptionKeysTableUpdateCompanionBuilder = EncryptionKeysCompanion
    Function({
  Value<int> id,
  Value<String> keyId,
  Value<String> algorithm,
  Value<String> keyDerivationSalt,
  Value<DateTime> createdAt,
  Value<bool> isActive,
});

class $$EncryptionKeysTableFilterComposer
    extends Composer<_$ClueDatabase, $EncryptionKeysTable> {
  $$EncryptionKeysTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get keyId => $composableBuilder(
      column: $table.keyId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get algorithm => $composableBuilder(
      column: $table.algorithm, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get keyDerivationSalt => $composableBuilder(
      column: $table.keyDerivationSalt,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));
}

class $$EncryptionKeysTableOrderingComposer
    extends Composer<_$ClueDatabase, $EncryptionKeysTable> {
  $$EncryptionKeysTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get keyId => $composableBuilder(
      column: $table.keyId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get algorithm => $composableBuilder(
      column: $table.algorithm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get keyDerivationSalt => $composableBuilder(
      column: $table.keyDerivationSalt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));
}

class $$EncryptionKeysTableAnnotationComposer
    extends Composer<_$ClueDatabase, $EncryptionKeysTable> {
  $$EncryptionKeysTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get keyId =>
      $composableBuilder(column: $table.keyId, builder: (column) => column);

  GeneratedColumn<String> get algorithm =>
      $composableBuilder(column: $table.algorithm, builder: (column) => column);

  GeneratedColumn<String> get keyDerivationSalt => $composableBuilder(
      column: $table.keyDerivationSalt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);
}

class $$EncryptionKeysTableTableManager extends RootTableManager<
    _$ClueDatabase,
    $EncryptionKeysTable,
    EncryptionKey,
    $$EncryptionKeysTableFilterComposer,
    $$EncryptionKeysTableOrderingComposer,
    $$EncryptionKeysTableAnnotationComposer,
    $$EncryptionKeysTableCreateCompanionBuilder,
    $$EncryptionKeysTableUpdateCompanionBuilder,
    (
      EncryptionKey,
      BaseReferences<_$ClueDatabase, $EncryptionKeysTable, EncryptionKey>
    ),
    EncryptionKey,
    PrefetchHooks Function()> {
  $$EncryptionKeysTableTableManager(
      _$ClueDatabase db, $EncryptionKeysTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EncryptionKeysTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EncryptionKeysTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EncryptionKeysTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> keyId = const Value.absent(),
            Value<String> algorithm = const Value.absent(),
            Value<String> keyDerivationSalt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
          }) =>
              EncryptionKeysCompanion(
            id: id,
            keyId: keyId,
            algorithm: algorithm,
            keyDerivationSalt: keyDerivationSalt,
            createdAt: createdAt,
            isActive: isActive,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String keyId,
            required String algorithm,
            required String keyDerivationSalt,
            required DateTime createdAt,
            Value<bool> isActive = const Value.absent(),
          }) =>
              EncryptionKeysCompanion.insert(
            id: id,
            keyId: keyId,
            algorithm: algorithm,
            keyDerivationSalt: keyDerivationSalt,
            createdAt: createdAt,
            isActive: isActive,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$EncryptionKeysTableProcessedTableManager = ProcessedTableManager<
    _$ClueDatabase,
    $EncryptionKeysTable,
    EncryptionKey,
    $$EncryptionKeysTableFilterComposer,
    $$EncryptionKeysTableOrderingComposer,
    $$EncryptionKeysTableAnnotationComposer,
    $$EncryptionKeysTableCreateCompanionBuilder,
    $$EncryptionKeysTableUpdateCompanionBuilder,
    (
      EncryptionKey,
      BaseReferences<_$ClueDatabase, $EncryptionKeysTable, EncryptionKey>
    ),
    EncryptionKey,
    PrefetchHooks Function()>;
typedef $$AppSettingsTableCreateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<int> id,
  required String key,
  required String value,
  required DateTime updatedAt,
});
typedef $$AppSettingsTableUpdateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<int> id,
  Value<String> key,
  Value<String> value,
  Value<DateTime> updatedAt,
});

class $$AppSettingsTableFilterComposer
    extends Composer<_$ClueDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$ClueDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$ClueDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AppSettingsTableTableManager extends RootTableManager<
    _$ClueDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (AppSetting, BaseReferences<_$ClueDatabase, $AppSettingsTable, AppSetting>),
    AppSetting,
    PrefetchHooks Function()> {
  $$AppSettingsTableTableManager(_$ClueDatabase db, $AppSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              AppSettingsCompanion(
            id: id,
            key: key,
            value: value,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String key,
            required String value,
            required DateTime updatedAt,
          }) =>
              AppSettingsCompanion.insert(
            id: id,
            key: key,
            value: value,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppSettingsTableProcessedTableManager = ProcessedTableManager<
    _$ClueDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (AppSetting, BaseReferences<_$ClueDatabase, $AppSettingsTable, AppSetting>),
    AppSetting,
    PrefetchHooks Function()>;
typedef $$SystemLogsTableCreateCompanionBuilder = SystemLogsCompanion Function({
  Value<int> id,
  required LogLevel level,
  required String module,
  required String message,
  Value<String?> details,
  required DateTime timestamp,
});
typedef $$SystemLogsTableUpdateCompanionBuilder = SystemLogsCompanion Function({
  Value<int> id,
  Value<LogLevel> level,
  Value<String> module,
  Value<String> message,
  Value<String?> details,
  Value<DateTime> timestamp,
});

class $$SystemLogsTableFilterComposer
    extends Composer<_$ClueDatabase, $SystemLogsTable> {
  $$SystemLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<LogLevel, LogLevel, int> get level =>
      $composableBuilder(
          column: $table.level,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get module => $composableBuilder(
      column: $table.module, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get details => $composableBuilder(
      column: $table.details, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));
}

class $$SystemLogsTableOrderingComposer
    extends Composer<_$ClueDatabase, $SystemLogsTable> {
  $$SystemLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get module => $composableBuilder(
      column: $table.module, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get message => $composableBuilder(
      column: $table.message, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get details => $composableBuilder(
      column: $table.details, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));
}

class $$SystemLogsTableAnnotationComposer
    extends Composer<_$ClueDatabase, $SystemLogsTable> {
  $$SystemLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LogLevel, int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<String> get module =>
      $composableBuilder(column: $table.module, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<String> get details =>
      $composableBuilder(column: $table.details, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);
}

class $$SystemLogsTableTableManager extends RootTableManager<
    _$ClueDatabase,
    $SystemLogsTable,
    SystemLog,
    $$SystemLogsTableFilterComposer,
    $$SystemLogsTableOrderingComposer,
    $$SystemLogsTableAnnotationComposer,
    $$SystemLogsTableCreateCompanionBuilder,
    $$SystemLogsTableUpdateCompanionBuilder,
    (SystemLog, BaseReferences<_$ClueDatabase, $SystemLogsTable, SystemLog>),
    SystemLog,
    PrefetchHooks Function()> {
  $$SystemLogsTableTableManager(_$ClueDatabase db, $SystemLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SystemLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SystemLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SystemLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<LogLevel> level = const Value.absent(),
            Value<String> module = const Value.absent(),
            Value<String> message = const Value.absent(),
            Value<String?> details = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              SystemLogsCompanion(
            id: id,
            level: level,
            module: module,
            message: message,
            details: details,
            timestamp: timestamp,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required LogLevel level,
            required String module,
            required String message,
            Value<String?> details = const Value.absent(),
            required DateTime timestamp,
          }) =>
              SystemLogsCompanion.insert(
            id: id,
            level: level,
            module: module,
            message: message,
            details: details,
            timestamp: timestamp,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SystemLogsTableProcessedTableManager = ProcessedTableManager<
    _$ClueDatabase,
    $SystemLogsTable,
    SystemLog,
    $$SystemLogsTableFilterComposer,
    $$SystemLogsTableOrderingComposer,
    $$SystemLogsTableAnnotationComposer,
    $$SystemLogsTableCreateCompanionBuilder,
    $$SystemLogsTableUpdateCompanionBuilder,
    (SystemLog, BaseReferences<_$ClueDatabase, $SystemLogsTable, SystemLog>),
    SystemLog,
    PrefetchHooks Function()>;

class $ClueDatabaseManager {
  final _$ClueDatabase _db;
  $ClueDatabaseManager(this._db);
  $$MediaItemsTableTableManager get mediaItems =>
      $$MediaItemsTableTableManager(_db, _db.mediaItems);
  $$CollectionsTableTableManager get collections =>
      $$CollectionsTableTableManager(_db, _db.collections);
  $$CollectionItemsTableTableManager get collectionItems =>
      $$CollectionItemsTableTableManager(_db, _db.collectionItems);
  $$TagsTableTableManager get tags => $$TagsTableTableManager(_db, _db.tags);
  $$MediaTagsTableTableManager get mediaTags =>
      $$MediaTagsTableTableManager(_db, _db.mediaTags);
  $$EncryptionKeysTableTableManager get encryptionKeys =>
      $$EncryptionKeysTableTableManager(_db, _db.encryptionKeys);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
  $$SystemLogsTableTableManager get systemLogs =>
      $$SystemLogsTableTableManager(_db, _db.systemLogs);
}
