// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_plan_recommend_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$travelPlanRecommendHash() =>
    r'6f97ab9a1c0ece8705686f769194f01249550e1e';

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
  late final TravelModel travel;
  late final int cityIndex;

  TravelPlanRecommendState build(
    TravelModel travel,
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
    TravelModel travel,
    int cityIndex,
  ) {
    return TravelPlanRecommendProvider(
      travel,
      cityIndex,
    );
  }

  @override
  TravelPlanRecommendProvider getProviderOverride(
    covariant TravelPlanRecommendProvider provider,
  ) {
    return call(
      provider.travel,
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
    TravelModel travel,
    int cityIndex,
  ) : this._internal(
          () => TravelPlanRecommend()
            ..travel = travel
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
          travel: travel,
          cityIndex: cityIndex,
        );

  TravelPlanRecommendProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.travel,
    required this.cityIndex,
  }) : super.internal();

  final TravelModel travel;
  final int cityIndex;

  @override
  TravelPlanRecommendState runNotifierBuild(
    covariant TravelPlanRecommend notifier,
  ) {
    return notifier.build(
      travel,
      cityIndex,
    );
  }

  @override
  Override overrideWith(TravelPlanRecommend Function() create) {
    return ProviderOverride(
      origin: this,
      override: TravelPlanRecommendProvider._internal(
        () => create()
          ..travel = travel
          ..cityIndex = cityIndex,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        travel: travel,
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
        other.travel == travel &&
        other.cityIndex == cityIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, travel.hashCode);
    hash = _SystemHash.combine(hash, cityIndex.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TravelPlanRecommendRef
    on AutoDisposeNotifierProviderRef<TravelPlanRecommendState> {
  /// The parameter `travel` of this provider.
  TravelModel get travel;

  /// The parameter `cityIndex` of this provider.
  int get cityIndex;
}

class _TravelPlanRecommendProviderElement
    extends AutoDisposeNotifierProviderElement<TravelPlanRecommend,
        TravelPlanRecommendState> with TravelPlanRecommendRef {
  _TravelPlanRecommendProviderElement(super.provider);

  @override
  TravelModel get travel => (origin as TravelPlanRecommendProvider).travel;
  @override
  int get cityIndex => (origin as TravelPlanRecommendProvider).cityIndex;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
