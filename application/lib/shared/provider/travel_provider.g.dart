// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$travelHash() => r'90a1fc1e82559fd2ebbe26296d55ee8fdf6218a4';

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

abstract class _$Travel
    extends BuildlessAutoDisposeNotifier<TravelDetailModel> {
  late final int id;

  TravelDetailModel build(
    int id,
  );
}

/// See also [Travel].
@ProviderFor(Travel)
const travelProvider = TravelFamily();

/// See also [Travel].
class TravelFamily extends Family<TravelDetailModel> {
  /// See also [Travel].
  const TravelFamily();

  /// See also [Travel].
  TravelProvider call(
    int id,
  ) {
    return TravelProvider(
      id,
    );
  }

  @override
  TravelProvider getProviderOverride(
    covariant TravelProvider provider,
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
  String? get name => r'travelProvider';
}

/// See also [Travel].
class TravelProvider
    extends AutoDisposeNotifierProviderImpl<Travel, TravelDetailModel> {
  /// See also [Travel].
  TravelProvider(
    int id,
  ) : this._internal(
          () => Travel()..id = id,
          from: travelProvider,
          name: r'travelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$travelHash,
          dependencies: TravelFamily._dependencies,
          allTransitiveDependencies: TravelFamily._allTransitiveDependencies,
          id: id,
        );

  TravelProvider._internal(
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
    covariant Travel notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(Travel Function() create) {
    return ProviderOverride(
      origin: this,
      override: TravelProvider._internal(
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
  AutoDisposeNotifierProviderElement<Travel, TravelDetailModel>
      createElement() {
    return _TravelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TravelProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TravelRef on AutoDisposeNotifierProviderRef<TravelDetailModel> {
  /// The parameter `id` of this provider.
  int get id;
}

class _TravelProviderElement
    extends AutoDisposeNotifierProviderElement<Travel, TravelDetailModel>
    with TravelRef {
  _TravelProviderElement(super.provider);

  @override
  int get id => (origin as TravelProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
