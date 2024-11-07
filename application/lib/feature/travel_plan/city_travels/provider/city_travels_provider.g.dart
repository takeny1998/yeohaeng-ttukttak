// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_travels_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cityTravelsHash() => r'555695d6ded15f43fa67c2d64d689c912e835250';

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

abstract class _$CityTravels
    extends BuildlessAutoDisposeNotifier<CityTravelsState> {
  late final TravelModel travel;
  late final int cityId;

  CityTravelsState build(
    TravelModel travel,
    int cityId,
  );
}

/// See also [CityTravels].
@ProviderFor(CityTravels)
const cityTravelsProvider = CityTravelsFamily();

/// See also [CityTravels].
class CityTravelsFamily extends Family<CityTravelsState> {
  /// See also [CityTravels].
  const CityTravelsFamily();

  /// See also [CityTravels].
  CityTravelsProvider call(
    TravelModel travel,
    int cityId,
  ) {
    return CityTravelsProvider(
      travel,
      cityId,
    );
  }

  @override
  CityTravelsProvider getProviderOverride(
    covariant CityTravelsProvider provider,
  ) {
    return call(
      provider.travel,
      provider.cityId,
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
  String? get name => r'cityTravelsProvider';
}

/// See also [CityTravels].
class CityTravelsProvider
    extends AutoDisposeNotifierProviderImpl<CityTravels, CityTravelsState> {
  /// See also [CityTravels].
  CityTravelsProvider(
    TravelModel travel,
    int cityId,
  ) : this._internal(
          () => CityTravels()
            ..travel = travel
            ..cityId = cityId,
          from: cityTravelsProvider,
          name: r'cityTravelsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cityTravelsHash,
          dependencies: CityTravelsFamily._dependencies,
          allTransitiveDependencies:
              CityTravelsFamily._allTransitiveDependencies,
          travel: travel,
          cityId: cityId,
        );

  CityTravelsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.travel,
    required this.cityId,
  }) : super.internal();

  final TravelModel travel;
  final int cityId;

  @override
  CityTravelsState runNotifierBuild(
    covariant CityTravels notifier,
  ) {
    return notifier.build(
      travel,
      cityId,
    );
  }

  @override
  Override overrideWith(CityTravels Function() create) {
    return ProviderOverride(
      origin: this,
      override: CityTravelsProvider._internal(
        () => create()
          ..travel = travel
          ..cityId = cityId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        travel: travel,
        cityId: cityId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CityTravels, CityTravelsState>
      createElement() {
    return _CityTravelsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CityTravelsProvider &&
        other.travel == travel &&
        other.cityId == cityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, travel.hashCode);
    hash = _SystemHash.combine(hash, cityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CityTravelsRef on AutoDisposeNotifierProviderRef<CityTravelsState> {
  /// The parameter `travel` of this provider.
  TravelModel get travel;

  /// The parameter `cityId` of this provider.
  int get cityId;
}

class _CityTravelsProviderElement
    extends AutoDisposeNotifierProviderElement<CityTravels, CityTravelsState>
    with CityTravelsRef {
  _CityTravelsProviderElement(super.provider);

  @override
  TravelModel get travel => (origin as CityTravelsProvider).travel;
  @override
  int get cityId => (origin as CityTravelsProvider).cityId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
