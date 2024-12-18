// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geography_select_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$geographySelectHash() => r'98fd643aed30e5640ba336b02ee652817d6c5fd8';

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

abstract class _$GeographySelect
    extends BuildlessAutoDisposeNotifier<GeographySelectState> {
  late final GeoJsonModel geoJson;

  GeographySelectState build(
    GeoJsonModel geoJson,
  );
}

/// See also [GeographySelect].
@ProviderFor(GeographySelect)
const geographySelectProvider = GeographySelectFamily();

/// See also [GeographySelect].
class GeographySelectFamily extends Family<GeographySelectState> {
  /// See also [GeographySelect].
  const GeographySelectFamily();

  /// See also [GeographySelect].
  GeographySelectProvider call(
    GeoJsonModel geoJson,
  ) {
    return GeographySelectProvider(
      geoJson,
    );
  }

  @override
  GeographySelectProvider getProviderOverride(
    covariant GeographySelectProvider provider,
  ) {
    return call(
      provider.geoJson,
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
  String? get name => r'geographySelectProvider';
}

/// See also [GeographySelect].
class GeographySelectProvider extends AutoDisposeNotifierProviderImpl<
    GeographySelect, GeographySelectState> {
  /// See also [GeographySelect].
  GeographySelectProvider(
    GeoJsonModel geoJson,
  ) : this._internal(
          () => GeographySelect()..geoJson = geoJson,
          from: geographySelectProvider,
          name: r'geographySelectProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$geographySelectHash,
          dependencies: GeographySelectFamily._dependencies,
          allTransitiveDependencies:
              GeographySelectFamily._allTransitiveDependencies,
          geoJson: geoJson,
        );

  GeographySelectProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.geoJson,
  }) : super.internal();

  final GeoJsonModel geoJson;

  @override
  GeographySelectState runNotifierBuild(
    covariant GeographySelect notifier,
  ) {
    return notifier.build(
      geoJson,
    );
  }

  @override
  Override overrideWith(GeographySelect Function() create) {
    return ProviderOverride(
      origin: this,
      override: GeographySelectProvider._internal(
        () => create()..geoJson = geoJson,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        geoJson: geoJson,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<GeographySelect, GeographySelectState>
      createElement() {
    return _GeographySelectProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GeographySelectProvider && other.geoJson == geoJson;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, geoJson.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GeographySelectRef
    on AutoDisposeNotifierProviderRef<GeographySelectState> {
  /// The parameter `geoJson` of this provider.
  GeoJsonModel get geoJson;
}

class _GeographySelectProviderElement
    extends AutoDisposeNotifierProviderElement<GeographySelect,
        GeographySelectState> with GeographySelectRef {
  _GeographySelectProviderElement(super.provider);

  @override
  GeoJsonModel get geoJson => (origin as GeographySelectProvider).geoJson;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
