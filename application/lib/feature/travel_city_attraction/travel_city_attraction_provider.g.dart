// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_city_attraction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$travelCityAttractionHash() =>
    r'af68abeea4cef9c3998e7aad25281f79be81df51';

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

abstract class _$TravelCityAttraction
    extends BuildlessAutoDisposeAsyncNotifier<TravelCityAttractionState> {
  late final int travelId;
  late final int cityId;

  FutureOr<TravelCityAttractionState> build(
    int travelId,
    int cityId,
  );
}

/// See also [TravelCityAttraction].
@ProviderFor(TravelCityAttraction)
const travelCityAttractionProvider = TravelCityAttractionFamily();

/// See also [TravelCityAttraction].
class TravelCityAttractionFamily
    extends Family<AsyncValue<TravelCityAttractionState>> {
  /// See also [TravelCityAttraction].
  const TravelCityAttractionFamily();

  /// See also [TravelCityAttraction].
  TravelCityAttractionProvider call(
    int travelId,
    int cityId,
  ) {
    return TravelCityAttractionProvider(
      travelId,
      cityId,
    );
  }

  @override
  TravelCityAttractionProvider getProviderOverride(
    covariant TravelCityAttractionProvider provider,
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
  String? get name => r'travelCityAttractionProvider';
}

/// See also [TravelCityAttraction].
class TravelCityAttractionProvider extends AutoDisposeAsyncNotifierProviderImpl<
    TravelCityAttraction, TravelCityAttractionState> {
  /// See also [TravelCityAttraction].
  TravelCityAttractionProvider(
    int travelId,
    int cityId,
  ) : this._internal(
          () => TravelCityAttraction()
            ..travelId = travelId
            ..cityId = cityId,
          from: travelCityAttractionProvider,
          name: r'travelCityAttractionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$travelCityAttractionHash,
          dependencies: TravelCityAttractionFamily._dependencies,
          allTransitiveDependencies:
              TravelCityAttractionFamily._allTransitiveDependencies,
          travelId: travelId,
          cityId: cityId,
        );

  TravelCityAttractionProvider._internal(
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
  FutureOr<TravelCityAttractionState> runNotifierBuild(
    covariant TravelCityAttraction notifier,
  ) {
    return notifier.build(
      travelId,
      cityId,
    );
  }

  @override
  Override overrideWith(TravelCityAttraction Function() create) {
    return ProviderOverride(
      origin: this,
      override: TravelCityAttractionProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<TravelCityAttraction,
      TravelCityAttractionState> createElement() {
    return _TravelCityAttractionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TravelCityAttractionProvider &&
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

mixin TravelCityAttractionRef
    on AutoDisposeAsyncNotifierProviderRef<TravelCityAttractionState> {
  /// The parameter `travelId` of this provider.
  int get travelId;

  /// The parameter `cityId` of this provider.
  int get cityId;
}

class _TravelCityAttractionProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TravelCityAttraction,
        TravelCityAttractionState> with TravelCityAttractionRef {
  _TravelCityAttractionProviderElement(super.provider);

  @override
  int get travelId => (origin as TravelCityAttractionProvider).travelId;
  @override
  int get cityId => (origin as TravelCityAttractionProvider).cityId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
