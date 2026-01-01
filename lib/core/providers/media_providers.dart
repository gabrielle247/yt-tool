import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clue_player/core/database/schema.dart';
import 'package:clue_player/core/services/data_repository.dart';

part 'media_providers.g.dart';

// 1. Database (Keep Alive)
@Riverpod(keepAlive: true)
ClueDatabase database(Ref ref) {
  final db = ClueDatabase();
  ref.onDispose(() => db.close());
  return db;
}

// 2. Repository (Keep Alive)
@Riverpod(keepAlive: true)
DataRepository dataRepository(Ref ref) {
  final db = ref.watch(databaseProvider);
  return DataRepository(db);
}

// 3. Streams (Using dynamic temporarily to bypass InvalidTypeException)
@riverpod
Stream<List<dynamic>> watchAllMedia(Ref ref) {
  final repository = ref.watch(dataRepositoryProvider);
  return repository.watchAllMedia();
}

@riverpod
Stream<dynamic> watchMediaById(Ref ref, String id) {
  final repository = ref.watch(dataRepositoryProvider);
  return repository.watchMediaById(id);
}

// 4. Navigation
@riverpod
class NavigationState extends _$NavigationState {
  @override
  int build() => 0;
  void navigateTo(int index) => state = index;
}