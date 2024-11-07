// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paged_travels_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PagedTravelsModel _$PagedTravelsModelFromJson(Map<String, dynamic> json) {
  return _PagedTravelsModel.fromJson(json);
}

/// @nodoc
mixin _$PagedTravelsModel {
  List<TravelModel> get travels => throw _privateConstructorUsedError;
  dynamic get hasNextPage => throw _privateConstructorUsedError;

  /// Serializes this PagedTravelsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PagedTravelsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PagedTravelsModelCopyWith<PagedTravelsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagedTravelsModelCopyWith<$Res> {
  factory $PagedTravelsModelCopyWith(
          PagedTravelsModel value, $Res Function(PagedTravelsModel) then) =
      _$PagedTravelsModelCopyWithImpl<$Res, PagedTravelsModel>;
  @useResult
  $Res call({List<TravelModel> travels, dynamic hasNextPage});
}

/// @nodoc
class _$PagedTravelsModelCopyWithImpl<$Res, $Val extends PagedTravelsModel>
    implements $PagedTravelsModelCopyWith<$Res> {
  _$PagedTravelsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PagedTravelsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travels = null,
    Object? hasNextPage = freezed,
  }) {
    return _then(_value.copyWith(
      travels: null == travels
          ? _value.travels
          : travels // ignore: cast_nullable_to_non_nullable
              as List<TravelModel>,
      hasNextPage: freezed == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PagedTravelsModelImplCopyWith<$Res>
    implements $PagedTravelsModelCopyWith<$Res> {
  factory _$$PagedTravelsModelImplCopyWith(_$PagedTravelsModelImpl value,
          $Res Function(_$PagedTravelsModelImpl) then) =
      __$$PagedTravelsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TravelModel> travels, dynamic hasNextPage});
}

/// @nodoc
class __$$PagedTravelsModelImplCopyWithImpl<$Res>
    extends _$PagedTravelsModelCopyWithImpl<$Res, _$PagedTravelsModelImpl>
    implements _$$PagedTravelsModelImplCopyWith<$Res> {
  __$$PagedTravelsModelImplCopyWithImpl(_$PagedTravelsModelImpl _value,
      $Res Function(_$PagedTravelsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PagedTravelsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travels = null,
    Object? hasNextPage = freezed,
  }) {
    return _then(_$PagedTravelsModelImpl(
      travels: null == travels
          ? _value._travels
          : travels // ignore: cast_nullable_to_non_nullable
              as List<TravelModel>,
      hasNextPage: freezed == hasNextPage ? _value.hasNextPage! : hasNextPage,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PagedTravelsModelImpl extends _PagedTravelsModel {
  const _$PagedTravelsModelImpl(
      {final List<TravelModel> travels = const [], this.hasNextPage = false})
      : _travels = travels,
        super._();

  factory _$PagedTravelsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PagedTravelsModelImplFromJson(json);

  final List<TravelModel> _travels;
  @override
  @JsonKey()
  List<TravelModel> get travels {
    if (_travels is EqualUnmodifiableListView) return _travels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_travels);
  }

  @override
  @JsonKey()
  final dynamic hasNextPage;

  @override
  String toString() {
    return 'PagedTravelsModel(travels: $travels, hasNextPage: $hasNextPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PagedTravelsModelImpl &&
            const DeepCollectionEquality().equals(other._travels, _travels) &&
            const DeepCollectionEquality()
                .equals(other.hasNextPage, hasNextPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_travels),
      const DeepCollectionEquality().hash(hasNextPage));

  /// Create a copy of PagedTravelsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PagedTravelsModelImplCopyWith<_$PagedTravelsModelImpl> get copyWith =>
      __$$PagedTravelsModelImplCopyWithImpl<_$PagedTravelsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PagedTravelsModelImplToJson(
      this,
    );
  }
}

abstract class _PagedTravelsModel extends PagedTravelsModel {
  const factory _PagedTravelsModel(
      {final List<TravelModel> travels,
      final dynamic hasNextPage}) = _$PagedTravelsModelImpl;
  const _PagedTravelsModel._() : super._();

  factory _PagedTravelsModel.fromJson(Map<String, dynamic> json) =
      _$PagedTravelsModelImpl.fromJson;

  @override
  List<TravelModel> get travels;
  @override
  dynamic get hasNextPage;

  /// Create a copy of PagedTravelsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PagedTravelsModelImplCopyWith<_$PagedTravelsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
