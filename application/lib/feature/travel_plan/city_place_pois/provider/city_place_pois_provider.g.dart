// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_place_pois_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cityPlacePoisHash() => r'95ac2979db3ee0dbbc43a2c19283d2e7ee901b17';

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

abstract class _$CityPlacePois
    extends BuildlessAutoDisposeNotifier<CityPlacePoisState?> {
  late final int cityId;
  late final PlaceSortType sortType;

  CityPlacePoisState? build(
    int cityId,
    PlaceSortType sortType,
  );
}

/// See also [CityPlacePois].
@ProviderFor(CityPlacePois)
const cityPlacePoisProvider = CityPlacePoisFamily();

/// See also [CityPlacePois].
class CityPlacePoisFamily extends Family<CityPlacePoisState?> {
  /// See also [CityPlacePois].
  const CityPlacePoisFamily();

  /// See also [CityPlacePois].
  CityPlacePoisProvider call(
    int cityId,
    PlaceSortType sortType,
  ) {
    return CityPlacePoisProvider(
      cityId,
      sortType,
    );
  }

  @override
  CityPlacePoisProvider getProviderOverride(
    covariant CityPlacePoisProvider provider,
  ) {
    return call(
      provider.cityId,
      provider.sortType,
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
  String? get name => r'cityPlacePoisProvider';
}

/// See also [CityPlacePois].
class CityPlacePoisProvider extends AutoDisposeNotifierProviderImpl<
    CityPlacePois, CityPlacePoisState?> {
  /// See also [CityPlacePois].
  CityPlacePoisProvider(
    int cityId,
    PlaceSortType sortType,
  ) : this._internal(
          () => CityPlacePois()
            ..cityId = cityId
            ..sortType = sortType,
          from: cityPlacePoisProvider,
          name: r'cityPlacePoisProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cityPlacePoisHash,
          dependencies: CityPlacePoisFamily._dependencies,
          allTransitiveDependencies:
              CityPlacePoisFamily._allTransitiveDependencies,
          cityId: cityId,
          sortType: sortType,
        );

  CityPlacePoisProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cityId,
    required this.sortType,
  }) : super.internal();

  final int cityId;
  final PlaceSortType sortType;

  @override
  CityPlacePoisState? runNotifierBuild(
    covariant CityPlacePois notifier,
  ) {
    return notifier.build(
      cityId,
      sortType,
    );
  }

  @override
  Override overrideWith(CityPlacePois Function() create) {
    return ProviderOverride(
      origin: this,
      override: CityPlacePoisProvider._internal(
        () => create()
          ..cityId = cityId
          ..sortType = sortType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cityId: cityId,
        sortType: sortType,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CityPlacePois, CityPlacePoisState?>
      createElement() {
    return _CityPlacePoisProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CityPlacePoisProvider &&
        other.cityId == cityId &&
        other.sortType == sortType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cityId.hashCode);
    hash = _SystemHash.combine(hash, sortType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CityPlacePoisRef on AutoDisposeNotifierProviderRef<CityPlacePoisState?> {
  /// The parameter `cityId` of this provider.
  int get cityId;

  /// The parameter `sortType` of this provider.
  PlaceSortType get sortType;
}

class _CityPlacePoisProviderElement extends AutoDisposeNotifierProviderElement<
    CityPlacePois, CityPlacePoisState?> with CityPlacePoisRef {
  _CityPlacePoisProviderElement(super.provider);

  @override
  int get cityId => (origin as CityPlacePoisProvider).cityId;
  @override
  PlaceSortType get sortType => (origin as CityPlacePoisProvider).sortType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
