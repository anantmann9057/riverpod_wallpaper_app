// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$collectionServiceHash() => r'40e3b70e710adc8ed96341a6c2538304a85e7ebe';

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

abstract class _$CollectionService
    extends BuildlessAsyncNotifier<List<CollectionsModel>> {
  late final int arg;

  FutureOr<List<CollectionsModel>> build(
    int arg,
  );
}

/// See also [CollectionService].
@ProviderFor(CollectionService)
const collectionServiceProvider = CollectionServiceFamily();

/// See also [CollectionService].
class CollectionServiceFamily
    extends Family<AsyncValue<List<CollectionsModel>>> {
  /// See also [CollectionService].
  const CollectionServiceFamily();

  /// See also [CollectionService].
  CollectionServiceProvider call(
    int arg,
  ) {
    return CollectionServiceProvider(
      arg,
    );
  }

  @override
  CollectionServiceProvider getProviderOverride(
    covariant CollectionServiceProvider provider,
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
  String? get name => r'collectionServiceProvider';
}

/// See also [CollectionService].
class CollectionServiceProvider extends AsyncNotifierProviderImpl<
    CollectionService, List<CollectionsModel>> {
  /// See also [CollectionService].
  CollectionServiceProvider(
    int arg,
  ) : this._internal(
          () => CollectionService()..arg = arg,
          from: collectionServiceProvider,
          name: r'collectionServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$collectionServiceHash,
          dependencies: CollectionServiceFamily._dependencies,
          allTransitiveDependencies:
              CollectionServiceFamily._allTransitiveDependencies,
          arg: arg,
        );

  CollectionServiceProvider._internal(
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
  FutureOr<List<CollectionsModel>> runNotifierBuild(
    covariant CollectionService notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(CollectionService Function() create) {
    return ProviderOverride(
      origin: this,
      override: CollectionServiceProvider._internal(
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
  AsyncNotifierProviderElement<CollectionService, List<CollectionsModel>>
      createElement() {
    return _CollectionServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CollectionServiceProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CollectionServiceRef on AsyncNotifierProviderRef<List<CollectionsModel>> {
  /// The parameter `arg` of this provider.
  int get arg;
}

class _CollectionServiceProviderElement extends AsyncNotifierProviderElement<
    CollectionService, List<CollectionsModel>> with CollectionServiceRef {
  _CollectionServiceProviderElement(super.provider);

  @override
  int get arg => (origin as CollectionServiceProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
