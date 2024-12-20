// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geography_select_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$geographySelectHash() => r'4a70a2baec9f2843862907c613f7d23e90a536f6';

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

abstract class _$GeographySelect
    extends BuildlessAutoDisposeAsyncNotifier<GeographySelectState> {
  late final int id;

  FutureOr<GeographySelectState> build(
    int id,
  );
}

/// See also [GeographySelect].
@ProviderFor(GeographySelect)
const geographySelectProvider = GeographySelectFamily();

/// See also [GeographySelect].
class GeographySelectFamily extends Family<AsyncValue<GeographySelectState>> {
  /// See also [GeographySelect].
  const GeographySelectFamily();

  /// See also [GeographySelect].
  GeographySelectProvider call(
    int id,
  ) {
    return GeographySelectProvider(
      id,
    );
  }

  @override
  GeographySelectProvider getProviderOverride(
    covariant GeographySelectProvider provider,
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
  String? get name => r'geographySelectProvider';
}

/// See also [GeographySelect].
class GeographySelectProvider extends AutoDisposeAsyncNotifierProviderImpl<
    GeographySelect, GeographySelectState> {
  /// See also [GeographySelect].
  GeographySelectProvider(
    int id,
  ) : this._internal(
          () => GeographySelect()..id = id,
          from: geographySelectProvider,
          name: r'geographySelectProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$geographySelectHash,
          dependencies: GeographySelectFamily._dependencies,
          allTransitiveDependencies:
              GeographySelectFamily._allTransitiveDependencies,
          id: id,
        );

  GeographySelectProvider._internal(
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
  FutureOr<GeographySelectState> runNotifierBuild(
    covariant GeographySelect notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(GeographySelect Function() create) {
    return ProviderOverride(
      origin: this,
      override: GeographySelectProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<GeographySelect, GeographySelectState>
      createElement() {
    return _GeographySelectProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GeographySelectProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GeographySelectRef
    on AutoDisposeAsyncNotifierProviderRef<GeographySelectState> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GeographySelectProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<GeographySelect,
        GeographySelectState> with GeographySelectRef {
  _GeographySelectProviderElement(super.provider);

  @override
  int get id => (origin as GeographySelectProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
