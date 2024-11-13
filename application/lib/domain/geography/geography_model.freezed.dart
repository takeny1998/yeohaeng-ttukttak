// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geography_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeographyModel _$GeographyModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'city':
      return CityModel.fromJson(json);
    case 'region':
      return RegionModel.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'GeographyModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$GeographyModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ImageModel get insignia => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id, String name, int regionId, ImageModel insignia)
        city,
    required TResult Function(
            int id, String name, String shortName, ImageModel insignia)
        region,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, String name, int regionId, ImageModel insignia)?
        city,
    TResult? Function(
            int id, String name, String shortName, ImageModel insignia)?
        region,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, String name, int regionId, ImageModel insignia)?
        city,
    TResult Function(
            int id, String name, String shortName, ImageModel insignia)?
        region,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CityModel value) city,
    required TResult Function(RegionModel value) region,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CityModel value)? city,
    TResult? Function(RegionModel value)? region,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CityModel value)? city,
    TResult Function(RegionModel value)? region,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this GeographyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeographyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeographyModelCopyWith<GeographyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeographyModelCopyWith<$Res> {
  factory $GeographyModelCopyWith(
          GeographyModel value, $Res Function(GeographyModel) then) =
      _$GeographyModelCopyWithImpl<$Res, GeographyModel>;
  @useResult
  $Res call({int id, String name, ImageModel insignia});

  $ImageModelCopyWith<$Res> get insignia;
}

/// @nodoc
class _$GeographyModelCopyWithImpl<$Res, $Val extends GeographyModel>
    implements $GeographyModelCopyWith<$Res> {
  _$GeographyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeographyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? insignia = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      insignia: null == insignia
          ? _value.insignia
          : insignia // ignore: cast_nullable_to_non_nullable
              as ImageModel,
    ) as $Val);
  }

  /// Create a copy of GeographyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageModelCopyWith<$Res> get insignia {
    return $ImageModelCopyWith<$Res>(_value.insignia, (value) {
      return _then(_value.copyWith(insignia: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CityModelImplCopyWith<$Res>
    implements $GeographyModelCopyWith<$Res> {
  factory _$$CityModelImplCopyWith(
          _$CityModelImpl value, $Res Function(_$CityModelImpl) then) =
      __$$CityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, int regionId, ImageModel insignia});

  @override
  $ImageModelCopyWith<$Res> get insignia;
}

/// @nodoc
class __$$CityModelImplCopyWithImpl<$Res>
    extends _$GeographyModelCopyWithImpl<$Res, _$CityModelImpl>
    implements _$$CityModelImplCopyWith<$Res> {
  __$$CityModelImplCopyWithImpl(
      _$CityModelImpl _value, $Res Function(_$CityModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeographyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? regionId = null,
    Object? insignia = null,
  }) {
    return _then(_$CityModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      regionId: null == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as int,
      insignia: null == insignia
          ? _value.insignia
          : insignia // ignore: cast_nullable_to_non_nullable
              as ImageModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CityModelImpl implements CityModel {
  const _$CityModelImpl(
      {required this.id,
      required this.name,
      required this.regionId,
      required this.insignia,
      final String? $type})
      : $type = $type ?? 'city';

  factory _$CityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CityModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int regionId;
  @override
  final ImageModel insignia;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GeographyModel.city(id: $id, name: $name, regionId: $regionId, insignia: $insignia)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.insignia, insignia) ||
                other.insignia == insignia));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, regionId, insignia);

  /// Create a copy of GeographyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CityModelImplCopyWith<_$CityModelImpl> get copyWith =>
      __$$CityModelImplCopyWithImpl<_$CityModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id, String name, int regionId, ImageModel insignia)
        city,
    required TResult Function(
            int id, String name, String shortName, ImageModel insignia)
        region,
  }) {
    return city(id, name, regionId, insignia);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, String name, int regionId, ImageModel insignia)?
        city,
    TResult? Function(
            int id, String name, String shortName, ImageModel insignia)?
        region,
  }) {
    return city?.call(id, name, regionId, insignia);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, String name, int regionId, ImageModel insignia)?
        city,
    TResult Function(
            int id, String name, String shortName, ImageModel insignia)?
        region,
    required TResult orElse(),
  }) {
    if (city != null) {
      return city(id, name, regionId, insignia);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CityModel value) city,
    required TResult Function(RegionModel value) region,
  }) {
    return city(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CityModel value)? city,
    TResult? Function(RegionModel value)? region,
  }) {
    return city?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CityModel value)? city,
    TResult Function(RegionModel value)? region,
    required TResult orElse(),
  }) {
    if (city != null) {
      return city(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CityModelImplToJson(
      this,
    );
  }
}

abstract class CityModel implements GeographyModel {
  const factory CityModel(
      {required final int id,
      required final String name,
      required final int regionId,
      required final ImageModel insignia}) = _$CityModelImpl;

  factory CityModel.fromJson(Map<String, dynamic> json) =
      _$CityModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  int get regionId;
  @override
  ImageModel get insignia;

  /// Create a copy of GeographyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CityModelImplCopyWith<_$CityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegionModelImplCopyWith<$Res>
    implements $GeographyModelCopyWith<$Res> {
  factory _$$RegionModelImplCopyWith(
          _$RegionModelImpl value, $Res Function(_$RegionModelImpl) then) =
      __$$RegionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String shortName, ImageModel insignia});

  @override
  $ImageModelCopyWith<$Res> get insignia;
}

/// @nodoc
class __$$RegionModelImplCopyWithImpl<$Res>
    extends _$GeographyModelCopyWithImpl<$Res, _$RegionModelImpl>
    implements _$$RegionModelImplCopyWith<$Res> {
  __$$RegionModelImplCopyWithImpl(
      _$RegionModelImpl _value, $Res Function(_$RegionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeographyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? shortName = null,
    Object? insignia = null,
  }) {
    return _then(_$RegionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      insignia: null == insignia
          ? _value.insignia
          : insignia // ignore: cast_nullable_to_non_nullable
              as ImageModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegionModelImpl implements RegionModel {
  const _$RegionModelImpl(
      {required this.id,
      required this.name,
      required this.shortName,
      required this.insignia,
      final String? $type})
      : $type = $type ?? 'region';

  factory _$RegionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegionModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String shortName;
  @override
  final ImageModel insignia;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GeographyModel.region(id: $id, name: $name, shortName: $shortName, insignia: $insignia)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.insignia, insignia) ||
                other.insignia == insignia));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, shortName, insignia);

  /// Create a copy of GeographyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionModelImplCopyWith<_$RegionModelImpl> get copyWith =>
      __$$RegionModelImplCopyWithImpl<_$RegionModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id, String name, int regionId, ImageModel insignia)
        city,
    required TResult Function(
            int id, String name, String shortName, ImageModel insignia)
        region,
  }) {
    return region(id, name, shortName, insignia);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, String name, int regionId, ImageModel insignia)?
        city,
    TResult? Function(
            int id, String name, String shortName, ImageModel insignia)?
        region,
  }) {
    return region?.call(id, name, shortName, insignia);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, String name, int regionId, ImageModel insignia)?
        city,
    TResult Function(
            int id, String name, String shortName, ImageModel insignia)?
        region,
    required TResult orElse(),
  }) {
    if (region != null) {
      return region(id, name, shortName, insignia);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CityModel value) city,
    required TResult Function(RegionModel value) region,
  }) {
    return region(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CityModel value)? city,
    TResult? Function(RegionModel value)? region,
  }) {
    return region?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CityModel value)? city,
    TResult Function(RegionModel value)? region,
    required TResult orElse(),
  }) {
    if (region != null) {
      return region(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RegionModelImplToJson(
      this,
    );
  }
}

abstract class RegionModel implements GeographyModel {
  const factory RegionModel(
      {required final int id,
      required final String name,
      required final String shortName,
      required final ImageModel insignia}) = _$RegionModelImpl;

  factory RegionModel.fromJson(Map<String, dynamic> json) =
      _$RegionModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  String get shortName;
  @override
  ImageModel get insignia;

  /// Create a copy of GeographyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegionModelImplCopyWith<_$RegionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
