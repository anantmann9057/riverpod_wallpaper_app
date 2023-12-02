// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topics_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$topicsServiceHash() => r'edaa6dd7bdc0d6c42b2e028e634e14b66c290f0b';

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

abstract class _$TopicsService
    extends BuildlessAsyncNotifier<List<TopicsModel>> {
  late final int arg;

  FutureOr<List<TopicsModel>> build(
    int arg,
  );
}

/// See also [TopicsService].
@ProviderFor(TopicsService)
const topicsServiceProvider = TopicsServiceFamily();

/// See also [TopicsService].
class TopicsServiceFamily extends Family<AsyncValue<List<TopicsModel>>> {
  /// See also [TopicsService].
  const TopicsServiceFamily();

  /// See also [TopicsService].
  TopicsServiceProvider call(
    int arg,
  ) {
    return TopicsServiceProvider(
      arg,
    );
  }

  @override
  TopicsServiceProvider getProviderOverride(
    covariant TopicsServiceProvider provider,
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
  String? get name => r'topicsServiceProvider';
}

/// See also [TopicsService].
class TopicsServiceProvider
    extends AsyncNotifierProviderImpl<TopicsService, List<TopicsModel>> {
  /// See also [TopicsService].
  TopicsServiceProvider(
    int arg,
  ) : this._internal(
          () => TopicsService()..arg = arg,
          from: topicsServiceProvider,
          name: r'topicsServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$topicsServiceHash,
          dependencies: TopicsServiceFamily._dependencies,
          allTransitiveDependencies:
              TopicsServiceFamily._allTransitiveDependencies,
          arg: arg,
        );

  TopicsServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.arg,
  }) : super.internal();

  final int arg;

  @override
  FutureOr<List<TopicsModel>> runNotifierBuild(
    covariant TopicsService notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(TopicsService Function() create) {
    return ProviderOverride(
      origin: this,
      override: TopicsServiceProvider._internal(
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
  AsyncNotifierProviderElement<TopicsService, List<TopicsModel>>
      createElement() {
    return _TopicsServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TopicsServiceProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TopicsServiceRef on AsyncNotifierProviderRef<List<TopicsModel>> {
  /// The parameter `arg` of this provider.
  int get arg;
}

class _TopicsServiceProviderElement
    extends AsyncNotifierProviderElement<TopicsService, List<TopicsModel>>
    with TopicsServiceRef {
  _TopicsServiceProviderElement(super.provider);

  @override
  int get arg => (origin as TopicsServiceProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
