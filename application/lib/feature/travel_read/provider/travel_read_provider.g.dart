// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_read_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$travelReadHash() => r'26b03766f9f22c0af0c7467403bb3e54a52012f1';

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

abstract class _$TravelRead
    extends BuildlessAutoDisposeNotifier<TravelReadState?> {
  late final int travelId;

  TravelReadState? build(
    int travelId,
  );
}

/// See also [TravelRead].
@ProviderFor(TravelRead)
const travelReadProvider = TravelReadFamily();

/// See also [TravelRead].
class TravelReadFamily extends Family<TravelReadState?> {
  /// See also [TravelRead].
  const TravelReadFamily();

  /// See also [TravelRead].
  TravelReadProvider call(
    int travelId,
  ) {
    return TravelReadProvider(
      travelId,
    );
  }

  @override
  TravelReadProvider getProviderOverride(
    covariant TravelReadProvider provider,
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
  String? get name => r'travelReadProvider';
}

/// See also [TravelRead].
class TravelReadProvider
    extends AutoDisposeNotifierProviderImpl<TravelRead, TravelReadState?> {
  /// See also [TravelRead].
  TravelReadProvider(
    int travelId,
  ) : this._internal(
          () => TravelRead()..travelId = travelId,
          from: travelReadProvider,
          name: r'travelReadProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$travelReadHash,
          dependencies: TravelReadFamily._dependencies,
          allTransitiveDependencies:
              TravelReadFamily._allTransitiveDependencies,
          travelId: travelId,
        );

  TravelReadProvider._internal(
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
  TravelReadState? runNotifierBuild(
    covariant TravelRead notifier,
  ) {
    return notifier.build(
      travelId,
    );
  }

  @override
  Override overrideWith(TravelRead Function() create) {
    return ProviderOverride(
      origin: this,
      override: TravelReadProvider._internal(
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
  AutoDisposeNotifierProviderElement<TravelRead, TravelReadState?>
      createElement() {
    return _TravelReadProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TravelReadProvider && other.travelId == travelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, travelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TravelReadRef on AutoDisposeNotifierProviderRef<TravelReadState?> {
  /// The parameter `travelId` of this provider.
  int get travelId;
}

class _TravelReadProviderElement
    extends AutoDisposeNotifierProviderElement<TravelRead, TravelReadState?>
    with TravelReadRef {
  _TravelReadProviderElement(super.provider);

  @override
  int get travelId => (origin as TravelReadProvider).travelId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
