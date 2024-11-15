// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_place_map_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cityPlaceMapHash() => r'32f4968d625a95e1946ec8b5a0311e114599c9d2';

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

abstract class _$CityPlaceMap
    extends BuildlessAutoDisposeNotifier<CityPlaceMapState> {
  late final List<PlaceModel> places;

  CityPlaceMapState build(
    List<PlaceModel> places,
  );
}

/// See also [CityPlaceMap].
@ProviderFor(CityPlaceMap)
const cityPlaceMapProvider = CityPlaceMapFamily();

/// See also [CityPlaceMap].
class CityPlaceMapFamily extends Family<CityPlaceMapState> {
  /// See also [CityPlaceMap].
  const CityPlaceMapFamily();

  /// See also [CityPlaceMap].
  CityPlaceMapProvider call(
    List<PlaceModel> places,
  ) {
    return CityPlaceMapProvider(
      places,
    );
  }

  @override
  CityPlaceMapProvider getProviderOverride(
    covariant CityPlaceMapProvider provider,
  ) {
    return call(
      provider.places,
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
  String? get name => r'cityPlaceMapProvider';
}

/// See also [CityPlaceMap].
class CityPlaceMapProvider
    extends AutoDisposeNotifierProviderImpl<CityPlaceMap, CityPlaceMapState> {
  /// See also [CityPlaceMap].
  CityPlaceMapProvider(
    List<PlaceModel> places,
  ) : this._internal(
          () => CityPlaceMap()..places = places,
          from: cityPlaceMapProvider,
          name: r'cityPlaceMapProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cityPlaceMapHash,
          dependencies: CityPlaceMapFamily._dependencies,
          allTransitiveDependencies:
              CityPlaceMapFamily._allTransitiveDependencies,
          places: places,
        );

  CityPlaceMapProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.places,
  }) : super.internal();

  final List<PlaceModel> places;

  @override
  CityPlaceMapState runNotifierBuild(
    covariant CityPlaceMap notifier,
  ) {
    return notifier.build(
      places,
    );
  }

  @override
  Override overrideWith(CityPlaceMap Function() create) {
    return ProviderOverride(
      origin: this,
      override: CityPlaceMapProvider._internal(
        () => create()..places = places,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        places: places,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CityPlaceMap, CityPlaceMapState>
      createElement() {
    return _CityPlaceMapProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CityPlaceMapProvider && other.places == places;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, places.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CityPlaceMapRef on AutoDisposeNotifierProviderRef<CityPlaceMapState> {
  /// The parameter `places` of this provider.
  List<PlaceModel> get places;
}

class _CityPlaceMapProviderElement
    extends AutoDisposeNotifierProviderElement<CityPlaceMap, CityPlaceMapState>
    with CityPlaceMapRef {
  _CityPlaceMapProviderElement(super.provider);

  @override
  List<PlaceModel> get places => (origin as CityPlaceMapProvider).places;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
