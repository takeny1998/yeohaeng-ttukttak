// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_plan_manage_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$travelPlanManageHash() => r'9a7471a631d5b1971921b789e7638facbb122582';

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

abstract class _$TravelPlanManage
    extends BuildlessAutoDisposeNotifier<TravelPlanManageState?> {
  late final int travelId;

  TravelPlanManageState? build(
    int travelId,
  );
}

/// See also [TravelPlanManage].
@ProviderFor(TravelPlanManage)
const travelPlanManageProvider = TravelPlanManageFamily();

/// See also [TravelPlanManage].
class TravelPlanManageFamily extends Family<TravelPlanManageState?> {
  /// See also [TravelPlanManage].
  const TravelPlanManageFamily();

  /// See also [TravelPlanManage].
  TravelPlanManageProvider call(
    int travelId,
  ) {
    return TravelPlanManageProvider(
      travelId,
    );
  }

  @override
  TravelPlanManageProvider getProviderOverride(
    covariant TravelPlanManageProvider provider,
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
  String? get name => r'travelPlanManageProvider';
}

/// See also [TravelPlanManage].
class TravelPlanManageProvider extends AutoDisposeNotifierProviderImpl<
    TravelPlanManage, TravelPlanManageState?> {
  /// See also [TravelPlanManage].
  TravelPlanManageProvider(
    int travelId,
  ) : this._internal(
          () => TravelPlanManage()..travelId = travelId,
          from: travelPlanManageProvider,
          name: r'travelPlanManageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$travelPlanManageHash,
          dependencies: TravelPlanManageFamily._dependencies,
          allTransitiveDependencies:
              TravelPlanManageFamily._allTransitiveDependencies,
          travelId: travelId,
        );

  TravelPlanManageProvider._internal(
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
  TravelPlanManageState? runNotifierBuild(
    covariant TravelPlanManage notifier,
  ) {
    return notifier.build(
      travelId,
    );
  }

  @override
  Override overrideWith(TravelPlanManage Function() create) {
    return ProviderOverride(
      origin: this,
      override: TravelPlanManageProvider._internal(
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
  AutoDisposeNotifierProviderElement<TravelPlanManage, TravelPlanManageState?>
      createElement() {
    return _TravelPlanManageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TravelPlanManageProvider && other.travelId == travelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, travelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TravelPlanManageRef
    on AutoDisposeNotifierProviderRef<TravelPlanManageState?> {
  /// The parameter `travelId` of this provider.
  int get travelId;
}

class _TravelPlanManageProviderElement
    extends AutoDisposeNotifierProviderElement<TravelPlanManage,
        TravelPlanManageState?> with TravelPlanManageRef {
  _TravelPlanManageProviderElement(super.provider);

  @override
  int get travelId => (origin as TravelPlanManageProvider).travelId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
