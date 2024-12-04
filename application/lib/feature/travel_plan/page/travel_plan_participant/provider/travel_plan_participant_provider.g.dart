// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_plan_participant_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$travelPlanParticipantHash() =>
    r'86dde68af26b388c4ac8fd510149cfa91da19742';

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

abstract class _$TravelPlanParticipant
    extends BuildlessAutoDisposeNotifier<TravelPlanParticipantState?> {
  late final int travelId;

  TravelPlanParticipantState? build(
    int travelId,
  );
}

/// See also [TravelPlanParticipant].
@ProviderFor(TravelPlanParticipant)
const travelPlanParticipantProvider = TravelPlanParticipantFamily();

/// See also [TravelPlanParticipant].
class TravelPlanParticipantFamily extends Family<TravelPlanParticipantState?> {
  /// See also [TravelPlanParticipant].
  const TravelPlanParticipantFamily();

  /// See also [TravelPlanParticipant].
  TravelPlanParticipantProvider call(
    int travelId,
  ) {
    return TravelPlanParticipantProvider(
      travelId,
    );
  }

  @override
  TravelPlanParticipantProvider getProviderOverride(
    covariant TravelPlanParticipantProvider provider,
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
  String? get name => r'travelPlanParticipantProvider';
}

/// See also [TravelPlanParticipant].
class TravelPlanParticipantProvider extends AutoDisposeNotifierProviderImpl<
    TravelPlanParticipant, TravelPlanParticipantState?> {
  /// See also [TravelPlanParticipant].
  TravelPlanParticipantProvider(
    int travelId,
  ) : this._internal(
          () => TravelPlanParticipant()..travelId = travelId,
          from: travelPlanParticipantProvider,
          name: r'travelPlanParticipantProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$travelPlanParticipantHash,
          dependencies: TravelPlanParticipantFamily._dependencies,
          allTransitiveDependencies:
              TravelPlanParticipantFamily._allTransitiveDependencies,
          travelId: travelId,
        );

  TravelPlanParticipantProvider._internal(
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
  TravelPlanParticipantState? runNotifierBuild(
    covariant TravelPlanParticipant notifier,
  ) {
    return notifier.build(
      travelId,
    );
  }

  @override
  Override overrideWith(TravelPlanParticipant Function() create) {
    return ProviderOverride(
      origin: this,
      override: TravelPlanParticipantProvider._internal(
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
  AutoDisposeNotifierProviderElement<TravelPlanParticipant,
      TravelPlanParticipantState?> createElement() {
    return _TravelPlanParticipantProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TravelPlanParticipantProvider && other.travelId == travelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, travelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TravelPlanParticipantRef
    on AutoDisposeNotifierProviderRef<TravelPlanParticipantState?> {
  /// The parameter `travelId` of this provider.
  int get travelId;
}

class _TravelPlanParticipantProviderElement
    extends AutoDisposeNotifierProviderElement<TravelPlanParticipant,
        TravelPlanParticipantState?> with TravelPlanParticipantRef {
  _TravelPlanParticipantProviderElement(super.provider);

  @override
  int get travelId => (origin as TravelPlanParticipantProvider).travelId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
