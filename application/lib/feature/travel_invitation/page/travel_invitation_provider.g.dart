// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_invitation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$travelInvitationHash() => r'f14e7fa47496a3e29daaab5202e42d6ab9d592e4';

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

/// See also [travelInvitation].
@ProviderFor(travelInvitation)
const travelInvitationProvider = TravelInvitationFamily();

/// See also [travelInvitation].
class TravelInvitationFamily extends Family<AsyncValue<void>> {
  /// See also [travelInvitation].
  const TravelInvitationFamily();

  /// See also [travelInvitation].
  TravelInvitationProvider call(
    int travelId,
    String invitationId,
  ) {
    return TravelInvitationProvider(
      travelId,
      invitationId,
    );
  }

  @override
  TravelInvitationProvider getProviderOverride(
    covariant TravelInvitationProvider provider,
  ) {
    return call(
      provider.travelId,
      provider.invitationId,
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
  String? get name => r'travelInvitationProvider';
}

/// See also [travelInvitation].
class TravelInvitationProvider extends AutoDisposeFutureProvider<void> {
  /// See also [travelInvitation].
  TravelInvitationProvider(
    int travelId,
    String invitationId,
  ) : this._internal(
          (ref) => travelInvitation(
            ref as TravelInvitationRef,
            travelId,
            invitationId,
          ),
          from: travelInvitationProvider,
          name: r'travelInvitationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$travelInvitationHash,
          dependencies: TravelInvitationFamily._dependencies,
          allTransitiveDependencies:
              TravelInvitationFamily._allTransitiveDependencies,
          travelId: travelId,
          invitationId: invitationId,
        );

  TravelInvitationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.travelId,
    required this.invitationId,
  }) : super.internal();

  final int travelId;
  final String invitationId;

  @override
  Override overrideWith(
    FutureOr<void> Function(TravelInvitationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TravelInvitationProvider._internal(
        (ref) => create(ref as TravelInvitationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        travelId: travelId,
        invitationId: invitationId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _TravelInvitationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TravelInvitationProvider &&
        other.travelId == travelId &&
        other.invitationId == invitationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, travelId.hashCode);
    hash = _SystemHash.combine(hash, invitationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TravelInvitationRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `travelId` of this provider.
  int get travelId;

  /// The parameter `invitationId` of this provider.
  String get invitationId;
}

class _TravelInvitationProviderElement
    extends AutoDisposeFutureProviderElement<void> with TravelInvitationRef {
  _TravelInvitationProviderElement(super.provider);

  @override
  int get travelId => (origin as TravelInvitationProvider).travelId;
  @override
  String get invitationId => (origin as TravelInvitationProvider).invitationId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
