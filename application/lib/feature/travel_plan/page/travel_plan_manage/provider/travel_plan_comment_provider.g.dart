// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_plan_comment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$travelPlanCommentHash() => r'4fca9e6db12fbb841b39666e98b4a64a79480497';

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

abstract class _$TravelPlanComment
    extends BuildlessAutoDisposeAsyncNotifier<TravelPlanCommentState> {
  late final int travelId;
  late final int planId;

  FutureOr<TravelPlanCommentState> build(
    int travelId,
    int planId,
  );
}

/// See also [TravelPlanComment].
@ProviderFor(TravelPlanComment)
const travelPlanCommentProvider = TravelPlanCommentFamily();

/// See also [TravelPlanComment].
class TravelPlanCommentFamily
    extends Family<AsyncValue<TravelPlanCommentState>> {
  /// See also [TravelPlanComment].
  const TravelPlanCommentFamily();

  /// See also [TravelPlanComment].
  TravelPlanCommentProvider call(
    int travelId,
    int planId,
  ) {
    return TravelPlanCommentProvider(
      travelId,
      planId,
    );
  }

  @override
  TravelPlanCommentProvider getProviderOverride(
    covariant TravelPlanCommentProvider provider,
  ) {
    return call(
      provider.travelId,
      provider.planId,
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
  String? get name => r'travelPlanCommentProvider';
}

/// See also [TravelPlanComment].
class TravelPlanCommentProvider extends AutoDisposeAsyncNotifierProviderImpl<
    TravelPlanComment, TravelPlanCommentState> {
  /// See also [TravelPlanComment].
  TravelPlanCommentProvider(
    int travelId,
    int planId,
  ) : this._internal(
          () => TravelPlanComment()
            ..travelId = travelId
            ..planId = planId,
          from: travelPlanCommentProvider,
          name: r'travelPlanCommentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$travelPlanCommentHash,
          dependencies: TravelPlanCommentFamily._dependencies,
          allTransitiveDependencies:
              TravelPlanCommentFamily._allTransitiveDependencies,
          travelId: travelId,
          planId: planId,
        );

  TravelPlanCommentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.travelId,
    required this.planId,
  }) : super.internal();

  final int travelId;
  final int planId;

  @override
  FutureOr<TravelPlanCommentState> runNotifierBuild(
    covariant TravelPlanComment notifier,
  ) {
    return notifier.build(
      travelId,
      planId,
    );
  }

  @override
  Override overrideWith(TravelPlanComment Function() create) {
    return ProviderOverride(
      origin: this,
      override: TravelPlanCommentProvider._internal(
        () => create()
          ..travelId = travelId
          ..planId = planId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        travelId: travelId,
        planId: planId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TravelPlanComment,
      TravelPlanCommentState> createElement() {
    return _TravelPlanCommentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TravelPlanCommentProvider &&
        other.travelId == travelId &&
        other.planId == planId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, travelId.hashCode);
    hash = _SystemHash.combine(hash, planId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TravelPlanCommentRef
    on AutoDisposeAsyncNotifierProviderRef<TravelPlanCommentState> {
  /// The parameter `travelId` of this provider.
  int get travelId;

  /// The parameter `planId` of this provider.
  int get planId;
}

class _TravelPlanCommentProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TravelPlanComment,
        TravelPlanCommentState> with TravelPlanCommentRef {
  _TravelPlanCommentProviderElement(super.provider);

  @override
  int get travelId => (origin as TravelPlanCommentProvider).travelId;
  @override
  int get planId => (origin as TravelPlanCommentProvider).planId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
