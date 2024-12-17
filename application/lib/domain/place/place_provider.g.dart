// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$placeHash() => r'8d6b3bbe8939c9625ac02901e28d165264fbcde3';

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

/// See also [place].
@ProviderFor(place)
const placeProvider = PlaceFamily();

/// See also [place].
class PlaceFamily extends Family<AsyncValue<PlaceModel>> {
  /// See also [place].
  const PlaceFamily();

  /// See also [place].
  PlaceProvider call(
    int id,
  ) {
    return PlaceProvider(
      id,
    );
  }

  @override
  PlaceProvider getProviderOverride(
    covariant PlaceProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'placeProvider';
}

/// See also [place].
class PlaceProvider extends FutureProvider<PlaceModel> {
  /// See also [place].
  PlaceProvider(
    int id,
  ) : this._internal(
          (ref) => place(
            ref as PlaceRef,
            id,
          ),
          from: placeProvider,
          name: r'placeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$placeHash,
          dependencies: PlaceFamily._dependencies,
          allTransitiveDependencies: PlaceFamily._allTransitiveDependencies,
          id: id,
        );

  PlaceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<PlaceModel> Function(PlaceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlaceProvider._internal(
        (ref) => create(ref as PlaceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  FutureProviderElement<PlaceModel> createElement() {
    return _PlaceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlaceProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PlaceRef on FutureProviderRef<PlaceModel> {
  /// The parameter `id` of this provider.
  int get id;
}

class _PlaceProviderElement extends FutureProviderElement<PlaceModel>
    with PlaceRef {
  _PlaceProviderElement(super.provider);

  @override
  int get id => (origin as PlaceProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
