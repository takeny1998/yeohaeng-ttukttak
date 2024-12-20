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
  int get id => throw _privateConstructorUsedError;
  Map<String, dynamic> get geoJson => throw _privateConstructorUsedError;

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
  $Res call({int id, Map<String, dynamic> geoJson});
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
    Object? id = null,
    Object? geoJson = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      geoJson: null == geoJson
          ? _value.geoJson
          : geoJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeoJsonModelImplCopyWith<$Res>
    implements $GeoJsonModelCopyWith<$Res> {
  factory _$$GeoJsonModelImplCopyWith(
          _$GeoJsonModelImpl value, $Res Function(_$GeoJsonModelImpl) then) =
      __$$GeoJsonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, Map<String, dynamic> geoJson});
}

/// @nodoc
class __$$GeoJsonModelImplCopyWithImpl<$Res>
    extends _$GeoJsonModelCopyWithImpl<$Res, _$GeoJsonModelImpl>
    implements _$$GeoJsonModelImplCopyWith<$Res> {
  __$$GeoJsonModelImplCopyWithImpl(
      _$GeoJsonModelImpl _value, $Res Function(_$GeoJsonModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeoJsonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? geoJson = null,
  }) {
    return _then(_$GeoJsonModelImpl(
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

class _$GeoJsonModelImpl implements _GeoJsonModel {
  const _$GeoJsonModelImpl(
      {required this.id, required final Map<String, dynamic> geoJson})
      : _geoJson = geoJson;

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
    return 'GeoJsonModel(id: $id, geoJson: $geoJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoJsonModelImpl &&
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
  _$$GeoJsonModelImplCopyWith<_$GeoJsonModelImpl> get copyWith =>
      __$$GeoJsonModelImplCopyWithImpl<_$GeoJsonModelImpl>(this, _$identity);
}

abstract class _GeoJsonModel implements GeoJsonModel {
  const factory _GeoJsonModel(
      {required final int id,
      required final Map<String, dynamic> geoJson}) = _$GeoJsonModelImpl;

  @override
  int get id;
  @override
  Map<String, dynamic> get geoJson;

  /// Create a copy of GeoJsonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeoJsonModelImplCopyWith<_$GeoJsonModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
