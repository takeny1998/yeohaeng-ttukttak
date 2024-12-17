// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geography_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$geographyHash() => r'66814bbb8a37dff094ccc1e2deac88bb126453fb';

/// See also [geography].
@ProviderFor(geography)
final geographyProvider =
    FutureProvider<(List<CityModel>, List<RegionModel>)>.internal(
  geography,
  name: r'geographyProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$geographyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GeographyRef = FutureProviderRef<(List<CityModel>, List<RegionModel>)>;
String _$cityHash() => r'1b37c5dd634a185a4e276b9a0740d7441ca27508';

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

/// See also [city].
@ProviderFor(city)
const cityProvider = CityFamily();

/// See also [city].
class CityFamily extends Family<CityModel?> {
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
class CityProvider extends AutoDisposeProvider<CityModel?> {
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
    CityModel? Function(CityRef provider) create,
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
  AutoDisposeProviderElement<CityModel?> createElement() {
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

mixin CityRef on AutoDisposeProviderRef<CityModel?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _CityProviderElement extends AutoDisposeProviderElement<CityModel?>
    with CityRef {
  _CityProviderElement(super.provider);

  @override
  int get id => (origin as CityProvider).id;
}

String _$regionHash() => r'844b5da146babf7c6159a54f3fc5bd5d91c3589a';

/// See also [region].
@ProviderFor(region)
const regionProvider = RegionFamily();

/// See also [region].
class RegionFamily extends Family<RegionModel?> {
  /// See also [region].
  const RegionFamily();

  /// See also [region].
  RegionProvider call(
    int id,
  ) {
    return RegionProvider(
      id,
    );
  }

  @override
  RegionProvider getProviderOverride(
    covariant RegionProvider provider,
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
  String? get name => r'regionProvider';
}

/// See also [region].
class RegionProvider extends AutoDisposeProvider<RegionModel?> {
  /// See also [region].
  RegionProvider(
    int id,
  ) : this._internal(
          (ref) => region(
            ref as RegionRef,
            id,
          ),
          from: regionProvider,
          name: r'regionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$regionHash,
          dependencies: RegionFamily._dependencies,
          allTransitiveDependencies: RegionFamily._allTransitiveDependencies,
          id: id,
        );

  RegionProvider._internal(
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
    RegionModel? Function(RegionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RegionProvider._internal(
        (ref) => create(ref as RegionRef),
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
  AutoDisposeProviderElement<RegionModel?> createElement() {
    return _RegionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RegionProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RegionRef on AutoDisposeProviderRef<RegionModel?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _RegionProviderElement extends AutoDisposeProviderElement<RegionModel?>
    with RegionRef {
  _RegionProviderElement(super.provider);

  @override
  int get id => (origin as RegionProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
