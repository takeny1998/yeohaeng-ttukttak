// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geography_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$geographiesHash() => r'b239d2d10bb614253bfaaa070785ec3dbfb4c770';

/// See also [geographies].
@ProviderFor(geographies)
final geographiesProvider = FutureProvider<List<GeographyModel>>.internal(
  geographies,
  name: r'geographiesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$geographiesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GeographiesRef = FutureProviderRef<List<GeographyModel>>;
String _$geographyHash() => r'bfa663d47daa3965d5fab7ccc1f282f941d84e15';

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

/// See also [geography].
@ProviderFor(geography)
const geographyProvider = GeographyFamily();

/// See also [geography].
class GeographyFamily extends Family<AsyncValue<GeographyModel>> {
  /// See also [geography].
  const GeographyFamily();

  /// See also [geography].
  GeographyProvider call(
    int id,
  ) {
    return GeographyProvider(
      id,
    );
  }

  @override
  GeographyProvider getProviderOverride(
    covariant GeographyProvider provider,
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
  String? get name => r'geographyProvider';
}

/// See also [geography].
class GeographyProvider extends AutoDisposeFutureProvider<GeographyModel> {
  /// See also [geography].
  GeographyProvider(
    int id,
  ) : this._internal(
          (ref) => geography(
            ref as GeographyRef,
            id,
          ),
          from: geographyProvider,
          name: r'geographyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$geographyHash,
          dependencies: GeographyFamily._dependencies,
          allTransitiveDependencies: GeographyFamily._allTransitiveDependencies,
          id: id,
        );

  GeographyProvider._internal(
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
    FutureOr<GeographyModel> Function(GeographyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GeographyProvider._internal(
        (ref) => create(ref as GeographyRef),
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
  AutoDisposeFutureProviderElement<GeographyModel> createElement() {
    return _GeographyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GeographyProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GeographyRef on AutoDisposeFutureProviderRef<GeographyModel> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GeographyProviderElement
    extends AutoDisposeFutureProviderElement<GeographyModel> with GeographyRef {
  _GeographyProviderElement(super.provider);

  @override
  int get id => (origin as GeographyProvider).id;
}

String _$cityHash() => r'0c13ec8dc884a24050f3e373104cbea839f64c77';

/// See also [city].
@ProviderFor(city)
const cityProvider = CityFamily();

/// See also [city].
class CityFamily extends Family<AsyncValue<CityModel>> {
  /// See also [city].
  const CityFamily();

  /// See also [city].
  CityProvider call(
    int id,
  ) {
    return CityProvider(
      id,
    );
  }

  @override
  CityProvider getProviderOverride(
    covariant CityProvider provider,
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
  String? get name => r'cityProvider';
}

/// See also [city].
class CityProvider extends AutoDisposeFutureProvider<CityModel> {
  /// See also [city].
  CityProvider(
    int id,
  ) : this._internal(
          (ref) => city(
            ref as CityRef,
            id,
          ),
          from: cityProvider,
          name: r'cityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$cityHash,
          dependencies: CityFamily._dependencies,
          allTransitiveDependencies: CityFamily._allTransitiveDependencies,
          id: id,
        );

  CityProvider._internal(
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
    FutureOr<CityModel> Function(CityRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CityProvider._internal(
        (ref) => create(ref as CityRef),
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
  AutoDisposeFutureProviderElement<CityModel> createElement() {
    return _CityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CityProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CityRef on AutoDisposeFutureProviderRef<CityModel> {
  /// The parameter `id` of this provider.
  int get id;
}

class _CityProviderElement extends AutoDisposeFutureProviderElement<CityModel>
    with CityRef {
  _CityProviderElement(super.provider);

  @override
  int get id => (origin as CityProvider).id;
}

String _$provinceHash() => r'e7bc289e30a42a651ed2fc3ec2684224a364d470';

/// See also [province].
@ProviderFor(province)
const provinceProvider = ProvinceFamily();

/// See also [province].
class ProvinceFamily extends Family<AsyncValue<ProvinceModel>> {
  /// See also [province].
  const ProvinceFamily();

  /// See also [province].
  ProvinceProvider call(
    int id,
  ) {
    return ProvinceProvider(
      id,
    );
  }

  @override
  ProvinceProvider getProviderOverride(
    covariant ProvinceProvider provider,
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
  String? get name => r'provinceProvider';
}

/// See also [province].
class ProvinceProvider extends AutoDisposeFutureProvider<ProvinceModel> {
  /// See also [province].
  ProvinceProvider(
    int id,
  ) : this._internal(
          (ref) => province(
            ref as ProvinceRef,
            id,
          ),
          from: provinceProvider,
          name: r'provinceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$provinceHash,
          dependencies: ProvinceFamily._dependencies,
          allTransitiveDependencies: ProvinceFamily._allTransitiveDependencies,
          id: id,
        );

  ProvinceProvider._internal(
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
    FutureOr<ProvinceModel> Function(ProvinceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProvinceProvider._internal(
        (ref) => create(ref as ProvinceRef),
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
  AutoDisposeFutureProviderElement<ProvinceModel> createElement() {
    return _ProvinceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProvinceProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProvinceRef on AutoDisposeFutureProviderRef<ProvinceModel> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ProvinceProviderElement
    extends AutoDisposeFutureProviderElement<ProvinceModel> with ProvinceRef {
  _ProvinceProviderElement(super.provider);

  @override
  int get id => (origin as ProvinceProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
