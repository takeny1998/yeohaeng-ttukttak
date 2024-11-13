// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_travels_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cityTravelsHash() => r'9537227481468dedd839ede8aefe4d4fe6c1c237';

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
    extends BuildlessAutoDisposeNotifier<CityTravelsState?> {
  late final int travelId;
  late final int cityId;

  CityTravelsState? build(
    int travelId,
    int cityId,
  );
}

/// See also [CityTravels].
@ProviderFor(CityTravels)
const cityTravelsProvider = CityTravelsFamily();

/// See also [CityTravels].
class CityTravelsFamily extends Family<CityTravelsState?> {
  /// See also [CityTravels].
  const CityTravelsFamily();

  /// See also [CityTravels].
  CityTravelsProvider call(
    int travelId,
    int cityId,
  ) {
    return CityTravelsProvider(
      travelId,
      cityId,
    );
  }

  @override
  CityTravelsProvider getProviderOverride(
    covariant CityTravelsProvider provider,
  ) {
    return call(
      provider.travelId,
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
    extends AutoDisposeNotifierProviderImpl<CityTravels, CityTravelsState?> {
  /// See also [CityTravels].
  CityTravelsProvider(
    int travelId,
    int cityId,
  ) : this._internal(
          () => CityTravels()
            ..travelId = travelId
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
          travelId: travelId,
          cityId: cityId,
        );

  CityTravelsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.travelId,
    required this.cityId,
  }) : super.internal();

  final int travelId;
  final int cityId;

  @override
  CityTravelsState? runNotifierBuild(
    covariant CityTravels notifier,
  ) {
    return notifier.build(
      travelId,
      cityId,
    );
  }

  @override
  Override overrideWith(CityTravels Function() create) {
    return ProviderOverride(
      origin: this,
      override: CityTravelsProvider._internal(
        () => create()
          ..travelId = travelId
          ..cityId = cityId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        travelId: travelId,
        cityId: cityId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CityTravels, CityTravelsState?>
      createElement() {
    return _CityTravelsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CityTravelsProvider &&
        other.travelId == travelId &&
        other.cityId == cityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, travelId.hashCode);
    hash = _SystemHash.combine(hash, cityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CityTravelsRef on AutoDisposeNotifierProviderRef<CityTravelsState?> {
  /// The parameter `travelId` of this provider.
  int get travelId;

  /// The parameter `cityId` of this provider.
  int get cityId;
}

class _CityTravelsProviderElement
    extends AutoDisposeNotifierProviderElement<CityTravels, CityTravelsState?>
    with CityTravelsRef {
  _CityTravelsProviderElement(super.provider);

  @override
  int get travelId => (origin as CityTravelsProvider).travelId;
  @override
  int get cityId => (origin as CityTravelsProvider).cityId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
