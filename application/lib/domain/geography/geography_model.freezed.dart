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
  switch (json['level']) {
    case '0':
      return CountryModel.fromJson(json);
    case '1':
      return ProvinceModel.fromJson(json);
    case '2':
      return CityModel.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'level', 'GeographyModel',
          'Invalid union type "${json['level']}"!');
  }
}

/// @nodoc
mixin _$GeographyModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get shortName => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, String name, String shortName) country,
    required TResult Function(int id, String name, int parentId,
            String shortName, ImageModel insignia)
        province,
    required TResult Function(int id, String name, int parentId,
            String shortName, ImageModel insignia)
        city,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, String name, String shortName)? country,
    TResult? Function(int id, String name, int parentId, String shortName,
            ImageModel insignia)?
        province,
    TResult? Function(int id, String name, int parentId, String shortName,
            ImageModel insignia)?
        city,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, String name, String shortName)? country,
    TResult Function(int id, String name, int parentId, String shortName,
            ImageModel insignia)?
        province,
    TResult Function(int id, String name, int parentId, String shortName,
            ImageModel insignia)?
        city,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CountryModel value) country,
    required TResult Function(ProvinceModel value) province,
    required TResult Function(CityModel value) city,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CountryModel value)? country,
    TResult? Function(ProvinceModel value)? province,
    TResult? Function(CityModel value)? city,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CountryModel value)? country,
    TResult Function(ProvinceModel value)? province,
    TResult Function(CityModel value)? city,
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
  $Res call({int id, String name, String shortName});
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
    Object? shortName = null,
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
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryModelImplCopyWith<$Res>
    implements $GeographyModelCopyWith<$Res> {
  factory _$$CountryModelImplCopyWith(
          _$CountryModelImpl value, $Res Function(_$CountryModelImpl) then) =
      __$$CountryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String shortName});
}

/// @nodoc
class __$$CountryModelImplCopyWithImpl<$Res>
    extends _$GeographyModelCopyWithImpl<$Res, _$CountryModelImpl>
    implements _$$CountryModelImplCopyWith<$Res> {
  __$$CountryModelImplCopyWithImpl(
      _$CountryModelImpl _value, $Res Function(_$CountryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeographyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? shortName = null,
  }) {
    return _then(_$CountryModelImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountryModelImpl implements CountryModel {
  const _$CountryModelImpl(
      {required this.id,
      required this.name,
      required this.shortName,
      final String? $type})
      : $type = $type ?? '0';

  factory _$CountryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String shortName;

  @JsonKey(name: 'level')
  final String $type;

  @override
  String toString() {
    return 'GeographyModel.country(id: $id, name: $name, shortName: $shortName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, shortName);

  /// Create a copy of GeographyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryModelImplCopyWith<_$CountryModelImpl> get copyWith =>
      __$$CountryModelImplCopyWithImpl<_$CountryModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, String name, String shortName) country,
    required TResult Function(int id, String name, int parentId,
            String shortName, ImageModel insignia)
        province,
    required TResult Function(int id, String name, int parentId,
            String shortName, ImageModel insignia)
        city,
  }) {
    return country(id, name, shortName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, String name, String shortName)? country,
    TResult? Function(int id, String name, int parentId, String shortName,
            ImageModel insignia)?
        province,
    TResult? Function(int id, String name, int parentId, String shortName,
            ImageModel insignia)?
        city,
  }) {
    return country?.call(id, name, shortName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, String name, String shortName)? country,
    TResult Function(int id, String name, int parentId, String shortName,
            ImageModel insignia)?
        province,
    TResult Function(int id, String name, int parentId, String shortName,
            ImageModel insignia)?
        city,
    required TResult orElse(),
  }) {
    if (country != null) {
      return country(id, name, shortName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CountryModel value) country,
    required TResult Function(ProvinceModel value) province,
    required TResult Function(CityModel value) city,
  }) {
    return country(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CountryModel value)? country,
    TResult? Function(ProvinceModel value)? province,
    TResult? Function(CityModel value)? city,
  }) {
    return country?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CountryModel value)? country,
    TResult Function(ProvinceModel value)? province,
    TResult Function(CityModel value)? city,
    required TResult orElse(),
  }) {
    if (country != null) {
      return country(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryModelImplToJson(
      this,
    );
  }
}

abstract class CountryModel implements GeographyModel {
  const factory CountryModel(
      {required final int id,
      required final String name,
      required final String shortName}) = _$CountryModelImpl;

  factory CountryModel.fromJson(Map<String, dynamic> json) =
      _$CountryModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get shortName;

  /// Create a copy of GeographyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountryModelImplCopyWith<_$CountryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProvinceModelImplCopyWith<$Res>
    implements $GeographyModelCopyWith<$Res> {
  factory _$$ProvinceModelImplCopyWith(
          _$ProvinceModelImpl value, $Res Function(_$ProvinceModelImpl) then) =
      __$$ProvinceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int parentId,
      String shortName,
      ImageModel insignia});

  $ImageModelCopyWith<$Res> get insignia;
}

/// @nodoc
class __$$ProvinceModelImplCopyWithImpl<$Res>
    extends _$GeographyModelCopyWithImpl<$Res, _$ProvinceModelImpl>
    implements _$$ProvinceModelImplCopyWith<$Res> {
  __$$ProvinceModelImplCopyWithImpl(
      _$ProvinceModelImpl _value, $Res Function(_$ProvinceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeographyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? parentId = null,
    Object? shortName = null,
    Object? insignia = null,
  }) {
    return _then(_$ProvinceModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int,
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

  /// Create a copy of GeographyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageModelCopyWith<$Res> get insignia {
    return $ImageModelCopyWith<$Res>(_value.insignia, (value) {
      return _then(_value.copyWith(insignia: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ProvinceModelImpl implements ProvinceModel {
  const _$ProvinceModelImpl(
      {required this.id,
      required this.name,
      required this.parentId,
      required this.shortName,
      required this.insignia,
      final String? $type})
      : $type = $type ?? '1';

  factory _$ProvinceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProvinceModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int parentId;
  @override
  final String shortName;
  @override
  final ImageModel insignia;

  @JsonKey(name: 'level')
  final String $type;

  @override
  String toString() {
    return 'GeographyModel.province(id: $id, name: $name, parentId: $parentId, shortName: $shortName, insignia: $insignia)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProvinceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.insignia, insignia) ||
                other.insignia == insignia));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, parentId, shortName, insignia);

  /// Create a copy of GeographyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProvinceModelImplCopyWith<_$ProvinceModelImpl> get copyWith =>
      __$$ProvinceModelImplCopyWithImpl<_$ProvinceModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, String name, String shortName) country,
    required TResult Function(int id, String name, int parentId,
            String shortName, ImageModel insignia)
        province,
    required TResult Function(int id, String name, int parentId,
            String shortName, ImageModel insignia)
        city,
  }) {
    return province(id, name, parentId, shortName, insignia);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, String name, String shortName)? country,
    TResult? Function(int id, String name, int parentId, String shortName,
            ImageModel insignia)?
        province,
    TResult? Function(int id, String name, int parentId, String shortName,
            ImageModel insignia)?
        city,
  }) {
    return province?.call(id, name, parentId, shortName, insignia);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, String name, String shortName)? country,
    TResult Function(int id, String name, int parentId, String shortName,
            ImageModel insignia)?
        province,
    TResult Function(int id, String name, int parentId, String shortName,
            ImageModel insignia)?
        city,
    required TResult orElse(),
  }) {
    if (province != null) {
      return province(id, name, parentId, shortName, insignia);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CountryModel value) country,
    required TResult Function(ProvinceModel value) province,
    required TResult Function(CityModel value) city,
  }) {
    return province(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CountryModel value)? country,
    TResult? Function(ProvinceModel value)? province,
    TResult? Function(CityModel value)? city,
  }) {
    return province?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CountryModel value)? country,
    TResult Function(ProvinceModel value)? province,
    TResult Function(CityModel value)? city,
    required TResult orElse(),
  }) {
    if (province != null) {
      return province(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ProvinceModelImplToJson(
      this,
    );
  }
}

abstract class ProvinceModel implements GeographyModel {
  const factory ProvinceModel(
      {required final int id,
      required final String name,
      required final int parentId,
      required final String shortName,
      required final ImageModel insignia}) = _$ProvinceModelImpl;

  factory ProvinceModel.fromJson(Map<String, dynamic> json) =
      _$ProvinceModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  int get parentId;
  @override
  String get shortName;
  ImageModel get insignia;

  /// Create a copy of GeographyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProvinceModelImplCopyWith<_$ProvinceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CityModelImplCopyWith<$Res>
    implements $GeographyModelCopyWith<$Res> {
  factory _$$CityModelImplCopyWith(
          _$CityModelImpl value, $Res Function(_$CityModelImpl) then) =
      __$$CityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int parentId,
      String shortName,
      ImageModel insignia});

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
    Object? parentId = null,
    Object? shortName = null,
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
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int,
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

  /// Create a copy of GeographyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageModelCopyWith<$Res> get insignia {
    return $ImageModelCopyWith<$Res>(_value.insignia, (value) {
      return _then(_value.copyWith(insignia: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$CityModelImpl implements CityModel {
  const _$CityModelImpl(
      {required this.id,
      required this.name,
      required this.parentId,
      required this.shortName,
      required this.insignia,
      final String? $type})
      : $type = $type ?? '2';

  factory _$CityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CityModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int parentId;
  @override
  final String shortName;
  @override
  final ImageModel insignia;

  @JsonKey(name: 'level')
  final String $type;

  @override
  String toString() {
    return 'GeographyModel.city(id: $id, name: $name, parentId: $parentId, shortName: $shortName, insignia: $insignia)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.insignia, insignia) ||
                other.insignia == insignia));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, parentId, shortName, insignia);

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
    required TResult Function(int id, String name, String shortName) country,
    required TResult Function(int id, String name, int parentId,
            String shortName, ImageModel insignia)
        province,
    required TResult Function(int id, String name, int parentId,
            String shortName, ImageModel insignia)
        city,
  }) {
    return city(id, name, parentId, shortName, insignia);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, String name, String shortName)? country,
    TResult? Function(int id, String name, int parentId, String shortName,
            ImageModel insignia)?
        province,
    TResult? Function(int id, String name, int parentId, String shortName,
            ImageModel insignia)?
        city,
  }) {
    return city?.call(id, name, parentId, shortName, insignia);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, String name, String shortName)? country,
    TResult Function(int id, String name, int parentId, String shortName,
            ImageModel insignia)?
        province,
    TResult Function(int id, String name, int parentId, String shortName,
            ImageModel insignia)?
        city,
    required TResult orElse(),
  }) {
    if (city != null) {
      return city(id, name, parentId, shortName, insignia);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CountryModel value) country,
    required TResult Function(ProvinceModel value) province,
    required TResult Function(CityModel value) city,
  }) {
    return city(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CountryModel value)? country,
    TResult? Function(ProvinceModel value)? province,
    TResult? Function(CityModel value)? city,
  }) {
    return city?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CountryModel value)? country,
    TResult Function(ProvinceModel value)? province,
    TResult Function(CityModel value)? city,
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
      required final int parentId,
      required final String shortName,
      required final ImageModel insignia}) = _$CityModelImpl;

  factory CityModel.fromJson(Map<String, dynamic> json) =
      _$CityModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  int get parentId;
  @override
  String get shortName;
  ImageModel get insignia;

  /// Create a copy of GeographyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CityModelImplCopyWith<_$CityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
