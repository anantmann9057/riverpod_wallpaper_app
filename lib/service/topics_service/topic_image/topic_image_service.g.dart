// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_image_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$topicImageServiceHash() => r'c7a75ab3dbb1ca820230a8b630ca44062e660e10';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TopicImageService
    extends BuildlessAutoDisposeAsyncNotifier<List<TopicImageModel>> {
  late final String arg;

  FutureOr<List<TopicImageModel>> build(
    String arg,
  );
}

/// See also [TopicImageService].
@ProviderFor(TopicImageService)
const topicImageServiceProvider = TopicImageServiceFamily();

/// See also [TopicImageService].
class TopicImageServiceFamily
    extends Family<AsyncValue<List<TopicImageModel>>> {
  /// See also [TopicImageService].
  const TopicImageServiceFamily();

  /// See also [TopicImageService].
  TopicImageServiceProvider call(
    String arg,
  ) {
    return TopicImageServiceProvider(
      arg,
    );
  }

  @override
  TopicImageServiceProvider getProviderOverride(
    covariant TopicImageServiceProvider provider,
  ) {
    return call(
      provider.arg,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'topicImageServiceProvider';
}

/// See also [TopicImageService].
class TopicImageServiceProvider extends AutoDisposeAsyncNotifierProviderImpl<
    TopicImageService, List<TopicImageModel>> {
  /// See also [TopicImageService].
  TopicImageServiceProvider(
    String arg,
  ) : this._internal(
          () => TopicImageService()..arg = arg,
          from: topicImageServiceProvider,
          name: r'topicImageServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$topicImageServiceHash,
          dependencies: TopicImageServiceFamily._dependencies,
          allTransitiveDependencies:
              TopicImageServiceFamily._allTransitiveDependencies,
          arg: arg,
        );

  TopicImageServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.arg,
  }) : super.internal();

  final String arg;

  @override
  FutureOr<List<TopicImageModel>> runNotifierBuild(
    covariant TopicImageService notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(TopicImageService Function() create) {
    return ProviderOverride(
      origin: this,
      override: TopicImageServiceProvider._internal(
        () => create()..arg = arg,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        arg: arg,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TopicImageService,
      List<TopicImageModel>> createElement() {
    return _TopicImageServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TopicImageServiceProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TopicImageServiceRef
    on AutoDisposeAsyncNotifierProviderRef<List<TopicImageModel>> {
  /// The parameter `arg` of this provider.
  String get arg;
}

class _TopicImageServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TopicImageService,
        List<TopicImageModel>> with TopicImageServiceRef {
  _TopicImageServiceProviderElement(super.provider);

  @override
  String get arg => (origin as TopicImageServiceProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
