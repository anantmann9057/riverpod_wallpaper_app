// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$photoServiceHash() => r'53cef32a5c5e0aa620c969451e4586957b1a5bd5';

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

abstract class _$PhotoService
    extends BuildlessAsyncNotifier<List<PhotosModel>> {
  late final int arg;

  FutureOr<List<PhotosModel>> build(
    int arg,
  );
}

/// See also [PhotoService].
@ProviderFor(PhotoService)
const photoServiceProvider = PhotoServiceFamily();

/// See also [PhotoService].
class PhotoServiceFamily extends Family<AsyncValue<List<PhotosModel>>> {
  /// See also [PhotoService].
  const PhotoServiceFamily();

  /// See also [PhotoService].
  PhotoServiceProvider call(
    int arg,
  ) {
    return PhotoServiceProvider(
      arg,
    );
  }

  @override
  PhotoServiceProvider getProviderOverride(
    covariant PhotoServiceProvider provider,
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
  String? get name => r'photoServiceProvider';
}

/// See also [PhotoService].
class PhotoServiceProvider
    extends AsyncNotifierProviderImpl<PhotoService, List<PhotosModel>> {
  /// See also [PhotoService].
  PhotoServiceProvider(
    int arg,
  ) : this._internal(
          () => PhotoService()..arg = arg,
          from: photoServiceProvider,
          name: r'photoServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$photoServiceHash,
          dependencies: PhotoServiceFamily._dependencies,
          allTransitiveDependencies:
              PhotoServiceFamily._allTransitiveDependencies,
          arg: arg,
        );

  PhotoServiceProvider._internal(
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
  FutureOr<List<PhotosModel>> runNotifierBuild(
    covariant PhotoService notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(PhotoService Function() create) {
    return ProviderOverride(
      origin: this,
      override: PhotoServiceProvider._internal(
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
  AsyncNotifierProviderElement<PhotoService, List<PhotosModel>>
      createElement() {
    return _PhotoServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PhotoServiceProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PhotoServiceRef on AsyncNotifierProviderRef<List<PhotosModel>> {
  /// The parameter `arg` of this provider.
  int get arg;
}

class _PhotoServiceProviderElement
    extends AsyncNotifierProviderElement<PhotoService, List<PhotosModel>>
    with PhotoServiceRef {
  _PhotoServiceProviderElement(super.provider);

  @override
  int get arg => (origin as PhotoServiceProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
