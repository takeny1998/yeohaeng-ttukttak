// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geography_select_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GeographySelectState {
  GeoJsonModel get model => throw _privateConstructorUsedError;
  List<GeographyModel> get children => throw _privateConstructorUsedError;
  GeographyModel? get activeChild => throw _privateConstructorUsedError;

  /// Create a copy of GeographySelectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeographySelectStateCopyWith<GeographySelectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeographySelectStateCopyWith<$Res> {
  factory $GeographySelectStateCopyWith(GeographySelectState value,
          $Res Function(GeographySelectState) then) =
      _$GeographySelectStateCopyWithImpl<$Res, GeographySelectState>;
  @useResult
  $Res call(
      {GeoJsonModel model,
      List<GeographyModel> children,
      GeographyModel? activeChild});

  $GeoJsonModelCopyWith<$Res> get model;
  $GeographyModelCopyWith<$Res>? get activeChild;
}

/// @nodoc
class _$GeographySelectStateCopyWithImpl<$Res,
        $Val extends GeographySelectState>
    implements $GeographySelectStateCopyWith<$Res> {
  _$GeographySelectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeographySelectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? children = null,
    Object? activeChild = freezed,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as GeoJsonModel,
      children: null == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<GeographyModel>,
      activeChild: freezed == activeChild
          ? _value.activeChild
          : activeChild // ignore: cast_nullable_to_non_nullable
              as GeographyModel?,
    ) as $Val);
  }

  /// Create a copy of GeographySelectState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoJsonModelCopyWith<$Res> get model {
    return $GeoJsonModelCopyWith<$Res>(_value.model, (value) {
      return _then(_value.copyWith(model: value) as $Val);
    });
  }

  /// Create a copy of GeographySelectState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeographyModelCopyWith<$Res>? get activeChild {
    if (_value.activeChild == null) {
      return null;
    }

    return $GeographyModelCopyWith<$Res>(_value.activeChild!, (value) {
      return _then(_value.copyWith(activeChild: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProvinceSelectStateImplCopyWith<$Res>
    implements $GeographySelectStateCopyWith<$Res> {
  factory _$$ProvinceSelectStateImplCopyWith(_$ProvinceSelectStateImpl value,
          $Res Function(_$ProvinceSelectStateImpl) then) =
      __$$ProvinceSelectStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GeoJsonModel model,
      List<GeographyModel> children,
      GeographyModel? activeChild});

  @override
  $GeoJsonModelCopyWith<$Res> get model;
  @override
  $GeographyModelCopyWith<$Res>? get activeChild;
}

/// @nodoc
class __$$ProvinceSelectStateImplCopyWithImpl<$Res>
    extends _$GeographySelectStateCopyWithImpl<$Res, _$ProvinceSelectStateImpl>
    implements _$$ProvinceSelectStateImplCopyWith<$Res> {
  __$$ProvinceSelectStateImplCopyWithImpl(_$ProvinceSelectStateImpl _value,
      $Res Function(_$ProvinceSelectStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeographySelectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? children = null,
    Object? activeChild = freezed,
  }) {
    return _then(_$ProvinceSelectStateImpl(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as GeoJsonModel,
      children: null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<GeographyModel>,
      activeChild: freezed == activeChild
          ? _value.activeChild
          : activeChild // ignore: cast_nullable_to_non_nullable
              as GeographyModel?,
    ));
  }
}

/// @nodoc

class _$ProvinceSelectStateImpl implements _ProvinceSelectState {
  const _$ProvinceSelectStateImpl(
      {required this.model,
      required final List<GeographyModel> children,
      this.activeChild})
      : _children = children;

  @override
  final GeoJsonModel model;
  final List<GeographyModel> _children;
  @override
  List<GeographyModel> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  final GeographyModel? activeChild;

  @override
  String toString() {
    return 'GeographySelectState(model: $model, children: $children, activeChild: $activeChild)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProvinceSelectStateImpl &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.activeChild, activeChild) ||
                other.activeChild == activeChild));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model,
      const DeepCollectionEquality().hash(_children), activeChild);

  /// Create a copy of GeographySelectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProvinceSelectStateImplCopyWith<_$ProvinceSelectStateImpl> get copyWith =>
      __$$ProvinceSelectStateImplCopyWithImpl<_$ProvinceSelectStateImpl>(
          this, _$identity);
}

abstract class _ProvinceSelectState implements GeographySelectState {
  const factory _ProvinceSelectState(
      {required final GeoJsonModel model,
      required final List<GeographyModel> children,
      final GeographyModel? activeChild}) = _$ProvinceSelectStateImpl;

  @override
  GeoJsonModel get model;
  @override
  List<GeographyModel> get children;
  @override
  GeographyModel? get activeChild;

  /// Create a copy of GeographySelectState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProvinceSelectStateImplCopyWith<_$ProvinceSelectStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
