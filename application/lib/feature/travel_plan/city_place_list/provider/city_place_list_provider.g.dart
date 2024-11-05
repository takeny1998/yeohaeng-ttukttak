// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_place_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cityPlaceListHash() => r'7fe60bb92875e43524e9015bd7f989c3368fb06c';

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

abstract class _$CityPlaceList
    extends BuildlessAutoDisposeNotifier<CityPlaceListState> {
  late final int cityId;
  late final PlaceCategoryType categoryType;

  CityPlaceListState build(
    int cityId,
    PlaceCategoryType categoryType,
  );
}

/// See also [CityPlaceList].
@ProviderFor(CityPlaceList)
const cityPlaceListProvider = CityPlaceListFamily();

/// See also [CityPlaceList].
class CityPlaceListFamily extends Family<CityPlaceListState> {
  /// See also [CityPlaceList].
  const CityPlaceListFamily();

  /// See also [CityPlaceList].
  CityPlaceListProvider call(
    int cityId,
    PlaceCategoryType categoryType,
  ) {
    return CityPlaceListProvider(
      cityId,
      categoryType,
    );
  }

  @override
  CityPlaceListProvider getProviderOverride(
    covariant CityPlaceListProvider provider,
  ) {
    return call(
      provider.cityId,
      provider.categoryType,
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
  String? get name => r'cityPlaceListProvider';
}

/// See also [CityPlaceList].
class CityPlaceListProvider
    extends AutoDisposeNotifierProviderImpl<CityPlaceList, CityPlaceListState> {
  /// See also [CityPlaceList].
  CityPlaceListProvider(
    int cityId,
    PlaceCategoryType categoryType,
  ) : this._internal(
          () => CityPlaceList()
            ..cityId = cityId
            ..categoryType = categoryType,
          from: cityPlaceListProvider,
          name: r'cityPlaceListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cityPlaceListHash,
          dependencies: CityPlaceListFamily._dependencies,
          allTransitiveDependencies:
              CityPlaceListFamily._allTransitiveDependencies,
          cityId: cityId,
          categoryType: categoryType,
        );

  CityPlaceListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cityId,
    required this.categoryType,
  }) : super.internal();

  final int cityId;
  final PlaceCategoryType categoryType;

  @override
  CityPlaceListState runNotifierBuild(
    covariant CityPlaceList notifier,
  ) {
    return notifier.build(
      cityId,
      categoryType,
    );
  }

  @override
  Override overrideWith(CityPlaceList Function() create) {
    return ProviderOverride(
      origin: this,
      override: CityPlaceListProvider._internal(
        () => create()
          ..cityId = cityId
          ..categoryType = categoryType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cityId: cityId,
        categoryType: categoryType,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CityPlaceList, CityPlaceListState>
      createElement() {
    return _CityPlaceListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CityPlaceListProvider &&
        other.cityId == cityId &&
        other.categoryType == categoryType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cityId.hashCode);
    hash = _SystemHash.combine(hash, categoryType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CityPlaceListRef on AutoDisposeNotifierProviderRef<CityPlaceListState> {
  /// The parameter `cityId` of this provider.
  int get cityId;

  /// The parameter `categoryType` of this provider.
  PlaceCategoryType get categoryType;
}

class _CityPlaceListProviderElement extends AutoDisposeNotifierProviderElement<
    CityPlaceList, CityPlaceListState> with CityPlaceListRef {
  _CityPlaceListProviderElement(super.provider);

  @override
  int get cityId => (origin as CityPlaceListProvider).cityId;
  @override
  PlaceCategoryType get categoryType =>
      (origin as CityPlaceListProvider).categoryType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
