// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_plan_recommend_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$travelPlanRecommendHash() =>
    r'61498265cb7b12af270931caf95ba3471e8e1c37';

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
    extends BuildlessAutoDisposeNotifier<TravelPlanRecommendState> {
  late final int travelId;
  late final int cityIndex;

  TravelPlanRecommendState build(
    int travelId,
    int cityIndex,
  );
}

/// See also [TravelPlanRecommend].
@ProviderFor(TravelPlanRecommend)
const travelPlanRecommendProvider = TravelPlanRecommendFamily();

/// See also [TravelPlanRecommend].
class TravelPlanRecommendFamily extends Family<TravelPlanRecommendState> {
  /// See also [TravelPlanRecommend].
  const TravelPlanRecommendFamily();

  /// See also [TravelPlanRecommend].
  TravelPlanRecommendProvider call(
    int travelId,
    int cityIndex,
  ) {
    return TravelPlanRecommendProvider(
      travelId,
      cityIndex,
    );
  }

  @override
  TravelPlanRecommendProvider getProviderOverride(
    covariant TravelPlanRecommendProvider provider,
  ) {
    return call(
      provider.travelId,
      provider.cityIndex,
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
    TravelPlanRecommend, TravelPlanRecommendState> {
  /// See also [TravelPlanRecommend].
  TravelPlanRecommendProvider(
    int travelId,
    int cityIndex,
  ) : this._internal(
          () => TravelPlanRecommend()
            ..travelId = travelId
            ..cityIndex = cityIndex,
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
          cityIndex: cityIndex,
        );

  TravelPlanRecommendProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.travelId,
    required this.cityIndex,
  }) : super.internal();

  final int travelId;
  final int cityIndex;

  @override
  TravelPlanRecommendState runNotifierBuild(
    covariant TravelPlanRecommend notifier,
  ) {
    return notifier.build(
      travelId,
      cityIndex,
    );
  }

  @override
  Override overrideWith(TravelPlanRecommend Function() create) {
    return ProviderOverride(
      origin: this,
      override: TravelPlanRecommendProvider._internal(
        () => create()
          ..travelId = travelId
          ..cityIndex = cityIndex,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        travelId: travelId,
        cityIndex: cityIndex,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TravelPlanRecommend,
      TravelPlanRecommendState> createElement() {
    return _TravelPlanRecommendProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TravelPlanRecommendProvider &&
        other.travelId == travelId &&
        other.cityIndex == cityIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, travelId.hashCode);
    hash = _SystemHash.combine(hash, cityIndex.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TravelPlanRecommendRef
    on AutoDisposeNotifierProviderRef<TravelPlanRecommendState> {
  /// The parameter `travelId` of this provider.
  int get travelId;

  /// The parameter `cityIndex` of this provider.
  int get cityIndex;
}

class _TravelPlanRecommendProviderElement
    extends AutoDisposeNotifierProviderElement<TravelPlanRecommend,
        TravelPlanRecommendState> with TravelPlanRecommendRef {
  _TravelPlanRecommendProviderElement(super.provider);

  @override
  int get travelId => (origin as TravelPlanRecommendProvider).travelId;
  @override
  int get cityIndex => (origin as TravelPlanRecommendProvider).cityIndex;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
