// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$travelDetailHash() => r'9e829971128889a52f8e6e70c24d48600dbd0843';

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
    extends BuildlessAutoDisposeNotifier<TravelDetailModel> {
  late final int id;

  TravelDetailModel build(
    int id,
  );
}

/// See also [TravelDetail].
@ProviderFor(TravelDetail)
const travelDetailProvider = TravelDetailFamily();

/// See also [TravelDetail].
class TravelDetailFamily extends Family<TravelDetailModel> {
  /// See also [TravelDetail].
  const TravelDetailFamily();

  /// See also [TravelDetail].
  TravelDetailProvider call(
    int id,
  ) {
    return TravelDetailProvider(
      id,
    );
  }

  @override
  TravelDetailProvider getProviderOverride(
    covariant TravelDetailProvider provider,
  ) {
    return call(
      provider.id,
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
    extends AutoDisposeNotifierProviderImpl<TravelDetail, TravelDetailModel> {
  /// See also [TravelDetail].
  TravelDetailProvider(
    int id,
  ) : this._internal(
          () => TravelDetail()..id = id,
          from: travelDetailProvider,
          name: r'travelDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$travelDetailHash,
          dependencies: TravelDetailFamily._dependencies,
          allTransitiveDependencies:
              TravelDetailFamily._allTransitiveDependencies,
          id: id,
        );

  TravelDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  TravelDetailModel runNotifierBuild(
    covariant TravelDetail notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(TravelDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: TravelDetailProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TravelDetail, TravelDetailModel>
      createElement() {
    return _TravelDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TravelDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TravelDetailRef on AutoDisposeNotifierProviderRef<TravelDetailModel> {
  /// The parameter `id` of this provider.
  int get id;
}

class _TravelDetailProviderElement
    extends AutoDisposeNotifierProviderElement<TravelDetail, TravelDetailModel>
    with TravelDetailRef {
  _TravelDetailProviderElement(super.provider);

  @override
  int get id => (origin as TravelDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
