// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_json_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GeoJsonModel {
  Map<String, dynamic> get geoJson => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> geoJson) country,
    required TResult Function(int id, Map<String, dynamic> geoJson) province,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> geoJson)? country,
    TResult? Function(int id, Map<String, dynamic> geoJson)? province,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> geoJson)? country,
    TResult Function(int id, Map<String, dynamic> geoJson)? province,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeoJsonCountryModel value) country,
    required TResult Function(GeoJsonProvinceModel value) province,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeoJsonCountryModel value)? country,
    TResult? Function(GeoJsonProvinceModel value)? province,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeoJsonCountryModel value)? country,
    TResult Function(GeoJsonProvinceModel value)? province,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of GeoJsonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeoJsonModelCopyWith<GeoJsonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoJsonModelCopyWith<$Res> {
  factory $GeoJsonModelCopyWith(
          GeoJsonModel value, $Res Function(GeoJsonModel) then) =
      _$GeoJsonModelCopyWithImpl<$Res, GeoJsonModel>;
  @useResult
  $Res call({Map<String, dynamic> geoJson});
}

/// @nodoc
class _$GeoJsonModelCopyWithImpl<$Res, $Val extends GeoJsonModel>
    implements $GeoJsonModelCopyWith<$Res> {
  _$GeoJsonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeoJsonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geoJson = null,
  }) {
    return _then(_value.copyWith(
      geoJson: null == geoJson
          ? _value.geoJson
          : geoJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeoJsonCountryModelImplCopyWith<$Res>
    implements $GeoJsonModelCopyWith<$Res> {
  factory _$$GeoJsonCountryModelImplCopyWith(_$GeoJsonCountryModelImpl value,
          $Res Function(_$GeoJsonCountryModelImpl) then) =
      __$$GeoJsonCountryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> geoJson});
}

/// @nodoc
class __$$GeoJsonCountryModelImplCopyWithImpl<$Res>
    extends _$GeoJsonModelCopyWithImpl<$Res, _$GeoJsonCountryModelImpl>
    implements _$$GeoJsonCountryModelImplCopyWith<$Res> {
  __$$GeoJsonCountryModelImplCopyWithImpl(_$GeoJsonCountryModelImpl _value,
      $Res Function(_$GeoJsonCountryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeoJsonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geoJson = null,
  }) {
    return _then(_$GeoJsonCountryModelImpl(
      geoJson: null == geoJson
          ? _value._geoJson
          : geoJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$GeoJsonCountryModelImpl extends GeoJsonCountryModel {
  const _$GeoJsonCountryModelImpl({required final Map<String, dynamic> geoJson})
      : _geoJson = geoJson,
        super._();

  final Map<String, dynamic> _geoJson;
  @override
  Map<String, dynamic> get geoJson {
    if (_geoJson is EqualUnmodifiableMapView) return _geoJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_geoJson);
  }

  @override
  String toString() {
    return 'GeoJsonModel.country(geoJson: $geoJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoJsonCountryModelImpl &&
            const DeepCollectionEquality().equals(other._geoJson, _geoJson));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_geoJson));

  /// Create a copy of GeoJsonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoJsonCountryModelImplCopyWith<_$GeoJsonCountryModelImpl> get copyWith =>
      __$$GeoJsonCountryModelImplCopyWithImpl<_$GeoJsonCountryModelImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> geoJson) country,
    required TResult Function(int id, Map<String, dynamic> geoJson) province,
  }) {
    return country(geoJson);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> geoJson)? country,
    TResult? Function(int id, Map<String, dynamic> geoJson)? province,
  }) {
    return country?.call(geoJson);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> geoJson)? country,
    TResult Function(int id, Map<String, dynamic> geoJson)? province,
    required TResult orElse(),
  }) {
    if (country != null) {
      return country(geoJson);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeoJsonCountryModel value) country,
    required TResult Function(GeoJsonProvinceModel value) province,
  }) {
    return country(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeoJsonCountryModel value)? country,
    TResult? Function(GeoJsonProvinceModel value)? province,
  }) {
    return country?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeoJsonCountryModel value)? country,
    TResult Function(GeoJsonProvinceModel value)? province,
    required TResult orElse(),
  }) {
    if (country != null) {
      return country(this);
    }
    return orElse();
  }
}

abstract class GeoJsonCountryModel extends GeoJsonModel {
  const factory GeoJsonCountryModel(
          {required final Map<String, dynamic> geoJson}) =
      _$GeoJsonCountryModelImpl;
  const GeoJsonCountryModel._() : super._();

  @override
  Map<String, dynamic> get geoJson;

  /// Create a copy of GeoJsonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeoJsonCountryModelImplCopyWith<_$GeoJsonCountryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GeoJsonProvinceModelImplCopyWith<$Res>
    implements $GeoJsonModelCopyWith<$Res> {
  factory _$$GeoJsonProvinceModelImplCopyWith(_$GeoJsonProvinceModelImpl value,
          $Res Function(_$GeoJsonProvinceModelImpl) then) =
      __$$GeoJsonProvinceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, Map<String, dynamic> geoJson});
}

/// @nodoc
class __$$GeoJsonProvinceModelImplCopyWithImpl<$Res>
    extends _$GeoJsonModelCopyWithImpl<$Res, _$GeoJsonProvinceModelImpl>
    implements _$$GeoJsonProvinceModelImplCopyWith<$Res> {
  __$$GeoJsonProvinceModelImplCopyWithImpl(_$GeoJsonProvinceModelImpl _value,
      $Res Function(_$GeoJsonProvinceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeoJsonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? geoJson = null,
  }) {
    return _then(_$GeoJsonProvinceModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      geoJson: null == geoJson
          ? _value._geoJson
          : geoJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$GeoJsonProvinceModelImpl extends GeoJsonProvinceModel {
  const _$GeoJsonProvinceModelImpl(
      {required this.id, required final Map<String, dynamic> geoJson})
      : _geoJson = geoJson,
        super._();

  @override
  final int id;
  final Map<String, dynamic> _geoJson;
  @override
  Map<String, dynamic> get geoJson {
    if (_geoJson is EqualUnmodifiableMapView) return _geoJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_geoJson);
  }

  @override
  String toString() {
    return 'GeoJsonModel.province(id: $id, geoJson: $geoJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoJsonProvinceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._geoJson, _geoJson));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_geoJson));

  /// Create a copy of GeoJsonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoJsonProvinceModelImplCopyWith<_$GeoJsonProvinceModelImpl>
      get copyWith =>
          __$$GeoJsonProvinceModelImplCopyWithImpl<_$GeoJsonProvinceModelImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> geoJson) country,
    required TResult Function(int id, Map<String, dynamic> geoJson) province,
  }) {
    return province(id, geoJson);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> geoJson)? country,
    TResult? Function(int id, Map<String, dynamic> geoJson)? province,
  }) {
    return province?.call(id, geoJson);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> geoJson)? country,
    TResult Function(int id, Map<String, dynamic> geoJson)? province,
    required TResult orElse(),
  }) {
    if (province != null) {
      return province(id, geoJson);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeoJsonCountryModel value) country,
    required TResult Function(GeoJsonProvinceModel value) province,
  }) {
    return province(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeoJsonCountryModel value)? country,
    TResult? Function(GeoJsonProvinceModel value)? province,
  }) {
    return province?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeoJsonCountryModel value)? country,
    TResult Function(GeoJsonProvinceModel value)? province,
    required TResult orElse(),
  }) {
    if (province != null) {
      return province(this);
    }
    return orElse();
  }
}

abstract class GeoJsonProvinceModel extends GeoJsonModel {
  const factory GeoJsonProvinceModel(
          {required final int id,
          required final Map<String, dynamic> geoJson}) =
      _$GeoJsonProvinceModelImpl;
  const GeoJsonProvinceModel._() : super._();

  int get id;
  @override
  Map<String, dynamic> get geoJson;

  /// Create a copy of GeoJsonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeoJsonProvinceModelImplCopyWith<_$GeoJsonProvinceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
