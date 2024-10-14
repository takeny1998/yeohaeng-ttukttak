// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$travelDetailHash() => r'aab1d070559170491e8242ff29fe4c57b4b15680';

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

abstract class _$TravelDetail
    extends BuildlessAutoDisposeNotifier<TravelDetailState> {
  late final int travelId;

  TravelDetailState build(
    int travelId,
  );
}

/// See also [TravelDetail].
@ProviderFor(TravelDetail)
const travelDetailProvider = TravelDetailFamily();

/// See also [TravelDetail].
class TravelDetailFamily extends Family<TravelDetailState> {
  /// See also [TravelDetail].
  const TravelDetailFamily();

  /// See also [TravelDetail].
  TravelDetailProvider call(
    int travelId,
  ) {
    return TravelDetailProvider(
      travelId,
    );
  }

  @override
  TravelDetailProvider getProviderOverride(
    covariant TravelDetailProvider provider,
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
  String? get name => r'travelDetailProvider';
}

/// See also [TravelDetail].
class TravelDetailProvider
    extends AutoDisposeNotifierProviderImpl<TravelDetail, TravelDetailState> {
  /// See also [TravelDetail].
  TravelDetailProvider(
    int travelId,
  ) : this._internal(
          () => TravelDetail()..travelId = travelId,
          from: travelDetailProvider,
          name: r'travelDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$travelDetailHash,
          dependencies: TravelDetailFamily._dependencies,
          allTransitiveDependencies:
              TravelDetailFamily._allTransitiveDependencies,
          travelId: travelId,
        );

  TravelDetailProvider._internal(
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
  TravelDetailState runNotifierBuild(
    covariant TravelDetail notifier,
  ) {
    return notifier.build(
      travelId,
    );
  }

  @override
  Override overrideWith(TravelDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: TravelDetailProvider._internal(
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
  AutoDisposeNotifierProviderElement<TravelDetail, TravelDetailState>
      createElement() {
    return _TravelDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TravelDetailProvider && other.travelId == travelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, travelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TravelDetailRef on AutoDisposeNotifierProviderRef<TravelDetailState> {
  /// The parameter `travelId` of this provider.
  int get travelId;
}

class _TravelDetailProviderElement
    extends AutoDisposeNotifierProviderElement<TravelDetail, TravelDetailState>
    with TravelDetailRef {
  _TravelDetailProviderElement(super.provider);

  @override
  int get travelId => (origin as TravelDetailProvider).travelId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
