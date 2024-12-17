// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$memberHash() => r'9d7e74a25e26e03b41b9a9577da034fd6e685e3d';

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

/// See also [member].
@ProviderFor(member)
const memberProvider = MemberFamily();

/// See also [member].
class MemberFamily extends Family<AsyncValue<MemberModel>> {
  /// See also [member].
  const MemberFamily();

  /// See also [member].
  MemberProvider call(
    String id,
  ) {
    return MemberProvider(
      id,
    );
  }

  @override
  MemberProvider getProviderOverride(
    covariant MemberProvider provider,
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
  String? get name => r'memberProvider';
}

/// See also [member].
class MemberProvider extends FutureProvider<MemberModel> {
  /// See also [member].
  MemberProvider(
    String id,
  ) : this._internal(
          (ref) => member(
            ref as MemberRef,
            id,
          ),
          from: memberProvider,
          name: r'memberProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$memberHash,
          dependencies: MemberFamily._dependencies,
          allTransitiveDependencies: MemberFamily._allTransitiveDependencies,
          id: id,
        );

  MemberProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<MemberModel> Function(MemberRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MemberProvider._internal(
        (ref) => create(ref as MemberRef),
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
  FutureProviderElement<MemberModel> createElement() {
    return _MemberProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MemberProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MemberRef on FutureProviderRef<MemberModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _MemberProviderElement extends FutureProviderElement<MemberModel>
    with MemberRef {
  _MemberProviderElement(super.provider);

  @override
  String get id => (origin as MemberProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
