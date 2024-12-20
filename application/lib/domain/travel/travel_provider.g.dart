// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$travelHash() => r'd6c2d0a772bed28bb417c938f69a8b893f2bc449';

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

/// See also [travel].
@ProviderFor(travel)
const travelProvider = TravelFamily();

/// See also [travel].
class TravelFamily extends Family<AsyncValue<TravelModel>> {
  /// See also [travel].
  const TravelFamily();

  /// See also [travel].
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

/// See also [travel].
class TravelProvider extends FutureProvider<TravelModel> {
  /// See also [travel].
  TravelProvider(
    int id,
  ) : this._internal(
          (ref) => travel(
            ref as TravelRef,
            id,
          ),
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
  Override overrideWith(
    FutureOr<TravelModel> Function(TravelRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TravelProvider._internal(
        (ref) => create(ref as TravelRef),
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
  FutureProviderElement<TravelModel> createElement() {
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

mixin TravelRef on FutureProviderRef<TravelModel> {
  /// The parameter `id` of this provider.
  int get id;
}

class _TravelProviderElement extends FutureProviderElement<TravelModel>
    with TravelRef {
  _TravelProviderElement(super.provider);

  @override
  int get id => (origin as TravelProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
