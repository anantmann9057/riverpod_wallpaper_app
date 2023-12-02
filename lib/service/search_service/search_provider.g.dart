// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchServiceHash() => r'd2f8a63af59eb8a6ae9b0290b08058c14974fc58';

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

abstract class _$SearchService extends BuildlessAsyncNotifier<List<Result>> {
  late final int arg;

  FutureOr<List<Result>> build(
    int arg,
  );
}

/// See also [SearchService].
@ProviderFor(SearchService)
const searchServiceProvider = SearchServiceFamily();

/// See also [SearchService].
class SearchServiceFamily extends Family<AsyncValue<List<Result>>> {
  /// See also [SearchService].
  const SearchServiceFamily();

  /// See also [SearchService].
  SearchServiceProvider call(
    int arg,
  ) {
    return SearchServiceProvider(
      arg,
    );
  }

  @override
  SearchServiceProvider getProviderOverride(
    covariant SearchServiceProvider provider,
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
  String? get name => r'searchServiceProvider';
}

/// See also [SearchService].
class SearchServiceProvider
    extends AsyncNotifierProviderImpl<SearchService, List<Result>> {
  /// See also [SearchService].
  SearchServiceProvider(
    int arg,
  ) : this._internal(
          () => SearchService()..arg = arg,
          from: searchServiceProvider,
          name: r'searchServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchServiceHash,
          dependencies: SearchServiceFamily._dependencies,
          allTransitiveDependencies:
              SearchServiceFamily._allTransitiveDependencies,
          arg: arg,
        );

  SearchServiceProvider._internal(
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
  FutureOr<List<Result>> runNotifierBuild(
    covariant SearchService notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(SearchService Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchServiceProvider._internal(
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
  AsyncNotifierProviderElement<SearchService, List<Result>> createElement() {
    return _SearchServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchServiceProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchServiceRef on AsyncNotifierProviderRef<List<Result>> {
  /// The parameter `arg` of this provider.
  int get arg;
}

class _SearchServiceProviderElement
    extends AsyncNotifierProviderElement<SearchService, List<Result>>
    with SearchServiceRef {
  _SearchServiceProviderElement(super.provider);

  @override
  int get arg => (origin as SearchServiceProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
