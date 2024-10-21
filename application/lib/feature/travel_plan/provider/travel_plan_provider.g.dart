// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_plan_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$travelPlanHash() => r'7a0832eb124d50155a56a46425b86ccda3b2d371';

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

abstract class _$TravelPlan
    extends BuildlessAutoDisposeNotifier<TravelPlanState> {
  late final int travelId;

  TravelPlanState build(
    int travelId,
  );
}

/// See also [TravelPlan].
@ProviderFor(TravelPlan)
const travelPlanProvider = TravelPlanFamily();

/// See also [TravelPlan].
class TravelPlanFamily extends Family<TravelPlanState> {
  /// See also [TravelPlan].
  const TravelPlanFamily();

  /// See also [TravelPlan].
  TravelPlanProvider call(
    int travelId,
  ) {
    return TravelPlanProvider(
      travelId,
    );
  }

  @override
  TravelPlanProvider getProviderOverride(
    covariant TravelPlanProvider provider,
  ) {
    return call(
      provider.travelId,
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
  String? get name => r'travelPlanProvider';
}

/// See also [TravelPlan].
class TravelPlanProvider
    extends AutoDisposeNotifierProviderImpl<TravelPlan, TravelPlanState> {
  /// See also [TravelPlan].
  TravelPlanProvider(
    int travelId,
  ) : this._internal(
          () => TravelPlan()..travelId = travelId,
          from: travelPlanProvider,
          name: r'travelPlanProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$travelPlanHash,
          dependencies: TravelPlanFamily._dependencies,
          allTransitiveDependencies:
              TravelPlanFamily._allTransitiveDependencies,
          travelId: travelId,
        );

  TravelPlanProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.travelId,
  }) : super.internal();

  final int travelId;

  @override
  TravelPlanState runNotifierBuild(
    covariant TravelPlan notifier,
  ) {
    return notifier.build(
      travelId,
    );
  }

  @override
  Override overrideWith(TravelPlan Function() create) {
    return ProviderOverride(
      origin: this,
      override: TravelPlanProvider._internal(
        () => create()..travelId = travelId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        travelId: travelId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TravelPlan, TravelPlanState>
      createElement() {
    return _TravelPlanProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TravelPlanProvider && other.travelId == travelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, travelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TravelPlanRef on AutoDisposeNotifierProviderRef<TravelPlanState> {
  /// The parameter `travelId` of this provider.
  int get travelId;
}

class _TravelPlanProviderElement
    extends AutoDisposeNotifierProviderElement<TravelPlan, TravelPlanState>
    with TravelPlanRef {
  _TravelPlanProviderElement(super.provider);

  @override
  int get travelId => (origin as TravelPlanProvider).travelId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
