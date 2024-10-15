// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TravelListModel _$TravelListModelFromJson(Map<String, dynamic> json) {
  return _TravelListModel.fromJson(json);
}

/// @nodoc
mixin _$TravelListModel {
  List<TravelModel> get travels => throw _privateConstructorUsedError;

  /// Serializes this TravelListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelListModelCopyWith<TravelListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelListModelCopyWith<$Res> {
  factory $TravelListModelCopyWith(
          TravelListModel value, $Res Function(TravelListModel) then) =
      _$TravelListModelCopyWithImpl<$Res, TravelListModel>;
  @useResult
  $Res call({List<TravelModel> travels});
}

/// @nodoc
class _$TravelListModelCopyWithImpl<$Res, $Val extends TravelListModel>
    implements $TravelListModelCopyWith<$Res> {
  _$TravelListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travels = null,
  }) {
    return _then(_value.copyWith(
      travels: null == travels
          ? _value.travels
          : travels // ignore: cast_nullable_to_non_nullable
              as List<TravelModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TravelListModelImplCopyWith<$Res>
    implements $TravelListModelCopyWith<$Res> {
  factory _$$TravelListModelImplCopyWith(_$TravelListModelImpl value,
          $Res Function(_$TravelListModelImpl) then) =
      __$$TravelListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TravelModel> travels});
}

/// @nodoc
class __$$TravelListModelImplCopyWithImpl<$Res>
    extends _$TravelListModelCopyWithImpl<$Res, _$TravelListModelImpl>
    implements _$$TravelListModelImplCopyWith<$Res> {
  __$$TravelListModelImplCopyWithImpl(
      _$TravelListModelImpl _value, $Res Function(_$TravelListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travels = null,
  }) {
    return _then(_$TravelListModelImpl(
      travels: null == travels
          ? _value._travels
          : travels // ignore: cast_nullable_to_non_nullable
              as List<TravelModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelListModelImpl implements _TravelListModel {
  const _$TravelListModelImpl({final List<TravelModel> travels = const []})
      : _travels = travels;

  factory _$TravelListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelListModelImplFromJson(json);

  final List<TravelModel> _travels;
  @override
  @JsonKey()
  List<TravelModel> get travels {
    if (_travels is EqualUnmodifiableListView) return _travels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_travels);
  }

  @override
  String toString() {
    return 'TravelListModel(travels: $travels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelListModelImpl &&
            const DeepCollectionEquality().equals(other._travels, _travels));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_travels));

  /// Create a copy of TravelListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelListModelImplCopyWith<_$TravelListModelImpl> get copyWith =>
      __$$TravelListModelImplCopyWithImpl<_$TravelListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelListModelImplToJson(
      this,
    );
  }
}

abstract class _TravelListModel implements TravelListModel {
  const factory _TravelListModel({final List<TravelModel> travels}) =
      _$TravelListModelImpl;

  factory _TravelListModel.fromJson(Map<String, dynamic> json) =
      _$TravelListModelImpl.fromJson;

  @override
  List<TravelModel> get travels;

  /// Create a copy of TravelListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelListModelImplCopyWith<_$TravelListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
