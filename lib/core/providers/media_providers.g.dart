// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(database)
final databaseProvider = DatabaseProvider._();

final class DatabaseProvider
    extends $FunctionalProvider<ClueDatabase, ClueDatabase, ClueDatabase>
    with $Provider<ClueDatabase> {
  DatabaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'databaseProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$databaseHash();

  @$internal
  @override
  $ProviderElement<ClueDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ClueDatabase create(Ref ref) {
    return database(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClueDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClueDatabase>(value),
    );
  }
}

String _$databaseHash() => r'8a5f92b92cef6162051bf006fd5ba8abe72b8406';

@ProviderFor(dataRepository)
final dataRepositoryProvider = DataRepositoryProvider._();

final class DataRepositoryProvider
    extends $FunctionalProvider<DataRepository, DataRepository, DataRepository>
    with $Provider<DataRepository> {
  DataRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'dataRepositoryProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$dataRepositoryHash();

  @$internal
  @override
  $ProviderElement<DataRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DataRepository create(Ref ref) {
    return dataRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DataRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DataRepository>(value),
    );
  }
}

String _$dataRepositoryHash() => r'eb8b3d04042f6a41b88dcdfb6691f09a7fd3b28b';

@ProviderFor(watchAllMedia)
final watchAllMediaProvider = WatchAllMediaProvider._();

final class WatchAllMediaProvider extends $FunctionalProvider<
        AsyncValue<List<dynamic>>, List<dynamic>, Stream<List<dynamic>>>
    with $FutureModifier<List<dynamic>>, $StreamProvider<List<dynamic>> {
  WatchAllMediaProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'watchAllMediaProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$watchAllMediaHash();

  @$internal
  @override
  $StreamProviderElement<List<dynamic>> $createElement(
          $ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<dynamic>> create(Ref ref) {
    return watchAllMedia(ref);
  }
}

String _$watchAllMediaHash() => r'420f7ec1acf39c961e3dbd3b44656e46e68f0ee1';

@ProviderFor(watchMediaById)
final watchMediaByIdProvider = WatchMediaByIdFamily._();

final class WatchMediaByIdProvider
    extends $FunctionalProvider<AsyncValue<dynamic>, dynamic, Stream<dynamic>>
    with $FutureModifier<dynamic>, $StreamProvider<dynamic> {
  WatchMediaByIdProvider._(
      {required WatchMediaByIdFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'watchMediaByIdProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$watchMediaByIdHash();

  @override
  String toString() {
    return r'watchMediaByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<dynamic> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<dynamic> create(Ref ref) {
    final argument = this.argument as String;
    return watchMediaById(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WatchMediaByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$watchMediaByIdHash() => r'c6a45d0ba51eac1a97a0f05d21efb3b3ba3c4ba2';

final class WatchMediaByIdFamily extends $Family
    with $FunctionalFamilyOverride<Stream<dynamic>, String> {
  WatchMediaByIdFamily._()
      : super(
          retry: null,
          name: r'watchMediaByIdProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  WatchMediaByIdProvider call(
    String id,
  ) =>
      WatchMediaByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'watchMediaByIdProvider';
}

@ProviderFor(NavigationState)
final navigationStateProvider = NavigationStateProvider._();

final class NavigationStateProvider
    extends $NotifierProvider<NavigationState, int> {
  NavigationStateProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'navigationStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$navigationStateHash();

  @$internal
  @override
  NavigationState create() => NavigationState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$navigationStateHash() => r'9894c60998ab02c06edfd04060aef6fbed98c946';

abstract class _$NavigationState extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element = ref.element
        as $ClassProviderElement<AnyNotifier<int, int>, int, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}
