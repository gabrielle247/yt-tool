// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scraper_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mediaScraperService)
final mediaScraperServiceProvider = MediaScraperServiceProvider._();

final class MediaScraperServiceProvider extends $FunctionalProvider<
    MediaScraperService,
    MediaScraperService,
    MediaScraperService> with $Provider<MediaScraperService> {
  MediaScraperServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'mediaScraperServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$mediaScraperServiceHash();

  @$internal
  @override
  $ProviderElement<MediaScraperService> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MediaScraperService create(Ref ref) {
    return mediaScraperService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MediaScraperService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MediaScraperService>(value),
    );
  }
}

String _$mediaScraperServiceHash() =>
    r'3828d70e5c6bf4a0a00d7f2dcdcd98c2212fb574';

@ProviderFor(VideoImportState)
final videoImportStateProvider = VideoImportStateProvider._();

final class VideoImportStateProvider extends $NotifierProvider<VideoImportState,
    AsyncValue<Map<String, dynamic>?>> {
  VideoImportStateProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'videoImportStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$videoImportStateHash();

  @$internal
  @override
  VideoImportState create() => VideoImportState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<Map<String, dynamic>?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<AsyncValue<Map<String, dynamic>?>>(value),
    );
  }
}

String _$videoImportStateHash() => r'6eff05d9caeca2c9a613ea9d3e266b99d4f2d941';

abstract class _$VideoImportState
    extends $Notifier<AsyncValue<Map<String, dynamic>?>> {
  AsyncValue<Map<String, dynamic>?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Map<String, dynamic>?>,
        AsyncValue<Map<String, dynamic>?>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<Map<String, dynamic>?>,
            AsyncValue<Map<String, dynamic>?>>,
        AsyncValue<Map<String, dynamic>?>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
