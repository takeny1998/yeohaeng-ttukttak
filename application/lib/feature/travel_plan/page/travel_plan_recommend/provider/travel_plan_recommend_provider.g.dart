// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_plan_recommend_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$travelPlanRecommendHash() =>
    r'97ab71301a161a4d8800b61f24ecea5c2230a339';

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

abstract class _$TravelPlanRecommend
    extends BuildlessAutoDisposeNotifier<TravelPlanRecommendState?> {
  late final int travelId;
  late final int cityId;

  TravelPlanRecommendState? build(
    int travelId,
    int cityId,
  );
}

/// See also [TravelPlanRecommend].
@ProviderFor(TravelPlanRecommend)
const travelPlanRecommendProvider = TravelPlanRecommendFamily();

/// See also [TravelPlanRecommend].
class TravelPlanRecommendFamily extends Family<TravelPlanRecommendState?> {
  /// See also [TravelPlanRecommend].
  const TravelPlanRecommendFamily();

  /// See also [TravelPlanRecommend].
  TravelPlanRecommendProvider call(
    int travelId,
    int cityId,
  ) {
    return TravelPlanRecommendProvider(
      travelId,
      cityId,
    );
  }

  @override
  TravelPlanRecommendProvider getProviderOverride(
    covariant TravelPlanRecommendProvider provider,
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
  String? get name => r'travelPlanRecommendProvider';
}

/// See also [TravelPlanRecommend].
class TravelPlanRecommendProvider extends AutoDisposeNotifierProviderImpl<
    TravelPlanRecommend, TravelPlanRecommendState?> {
  /// See also [TravelPlanRecommend].
  TravelPlanRecommendProvider(
    int travelId,
    int cityId,
  ) : this._internal(
          () => TravelPlanRecommend()
            ..travelId = travelId
            ..cityId = cityId,
          from: travelPlanRecommendProvider,
          name: r'travelPlanRecommendProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$travelPlanRecommendHash,
          dependencies: TravelPlanRecommendFamily._dependencies,
          allTransitiveDependencies:
              TravelPlanRecommendFamily._allTransitiveDependencies,
          travelId: travelId,
          cityId: cityId,
        );

  TravelPlanRecommendProvider._internal(
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
  TravelPlanRecommendState? runNotifierBuild(
    covariant TravelPlanRecommend notifier,
  ) {
    return notifier.build(
      travelId,
      cityId,
    );
  }

  @override
  Override overrideWith(TravelPlanRecommend Function() create) {
    return ProviderOverride(
      origin: this,
      override: TravelPlanRecommendProvider._internal(
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
  AutoDisposeNotifierProviderElement<TravelPlanRecommend,
      TravelPlanRecommendState?> createElement() {
    return _TravelPlanRecommendProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TravelPlanRecommendProvider &&
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

mixin TravelPlanRecommendRef
    on AutoDisposeNotifierProviderRef<TravelPlanRecommendState?> {
  /// The parameter `travelId` of this provider.
  int get travelId;

  /// The parameter `cityId` of this provider.
  int get cityId;
}

class _TravelPlanRecommendProviderElement
    extends AutoDisposeNotifierProviderElement<TravelPlanRecommend,
        TravelPlanRecommendState?> with TravelPlanRecommendRef {
  _TravelPlanRecommendProviderElement(super.provider);

  @override
  int get travelId => (origin as TravelPlanRecommendProvider).travelId;
  @override
  int get cityId => (origin as TravelPlanRecommendProvider).cityId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
