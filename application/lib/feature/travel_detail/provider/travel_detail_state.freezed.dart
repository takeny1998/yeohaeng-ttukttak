// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TravelDetailState {
  DateTime get selectedDate => throw _privateConstructorUsedError;
  int get selectedPlaceId => throw _privateConstructorUsedError;
  bool get isMapMoved => throw _privateConstructorUsedError;
  TravelDetailModel get detail => throw _privateConstructorUsedError;
  List<TravelVisitModel> get selectedVisits =>
      throw _privateConstructorUsedError;

  /// Create a copy of TravelDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelDetailStateCopyWith<TravelDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelDetailStateCopyWith<$Res> {
  factory $TravelDetailStateCopyWith(
          TravelDetailState value, $Res Function(TravelDetailState) then) =
      _$TravelDetailStateCopyWithImpl<$Res, TravelDetailState>;
  @useResult
  $Res call(
      {DateTime selectedDate,
      int selectedPlaceId,
      bool isMapMoved,
      TravelDetailModel detail,
      List<TravelVisitModel> selectedVisits});

  $TravelDetailModelCopyWith<$Res> get detail;
}

/// @nodoc
class _$TravelDetailStateCopyWithImpl<$Res, $Val extends TravelDetailState>
    implements $TravelDetailStateCopyWith<$Res> {
  _$TravelDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDate = null,
    Object? selectedPlaceId = null,
    Object? isMapMoved = null,
    Object? detail = null,
    Object? selectedVisits = null,
  }) {
    return _then(_value.copyWith(
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedPlaceId: null == selectedPlaceId
          ? _value.selectedPlaceId
          : selectedPlaceId // ignore: cast_nullable_to_non_nullable
              as int,
      isMapMoved: null == isMapMoved
          ? _value.isMapMoved
          : isMapMoved // ignore: cast_nullable_to_non_nullable
              as bool,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as TravelDetailModel,
      selectedVisits: null == selectedVisits
          ? _value.selectedVisits
          : selectedVisits // ignore: cast_nullable_to_non_nullable
              as List<TravelVisitModel>,
    ) as $Val);
  }

  /// Create a copy of TravelDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TravelDetailModelCopyWith<$Res> get detail {
    return $TravelDetailModelCopyWith<$Res>(_value.detail, (value) {
      return _then(_value.copyWith(detail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TravelDetailStateImplCopyWith<$Res>
    implements $TravelDetailStateCopyWith<$Res> {
  factory _$$TravelDetailStateImplCopyWith(_$TravelDetailStateImpl value,
          $Res Function(_$TravelDetailStateImpl) then) =
      __$$TravelDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime selectedDate,
      int selectedPlaceId,
      bool isMapMoved,
      TravelDetailModel detail,
      List<TravelVisitModel> selectedVisits});

  @override
  $TravelDetailModelCopyWith<$Res> get detail;
}

/// @nodoc
class __$$TravelDetailStateImplCopyWithImpl<$Res>
    extends _$TravelDetailStateCopyWithImpl<$Res, _$TravelDetailStateImpl>
    implements _$$TravelDetailStateImplCopyWith<$Res> {
  __$$TravelDetailStateImplCopyWithImpl(_$TravelDetailStateImpl _value,
      $Res Function(_$TravelDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDate = null,
    Object? selectedPlaceId = null,
    Object? isMapMoved = null,
    Object? detail = null,
    Object? selectedVisits = null,
  }) {
    return _then(_$TravelDetailStateImpl(
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedPlaceId: null == selectedPlaceId
          ? _value.selectedPlaceId
          : selectedPlaceId // ignore: cast_nullable_to_non_nullable
              as int,
      isMapMoved: null == isMapMoved
          ? _value.isMapMoved
          : isMapMoved // ignore: cast_nullable_to_non_nullable
              as bool,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as TravelDetailModel,
      selectedVisits: null == selectedVisits
          ? _value._selectedVisits
          : selectedVisits // ignore: cast_nullable_to_non_nullable
              as List<TravelVisitModel>,
    ));
  }
}

/// @nodoc

class _$TravelDetailStateImpl extends _TravelDetailState {
  const _$TravelDetailStateImpl(
      {required this.selectedDate,
      this.selectedPlaceId = 0,
      this.isMapMoved = false,
      required this.detail,
      final List<TravelVisitModel> selectedVisits = const []})
      : _selectedVisits = selectedVisits,
        super._();

  @override
  final DateTime selectedDate;
  @override
  @JsonKey()
  final int selectedPlaceId;
  @override
  @JsonKey()
  final bool isMapMoved;
  @override
  final TravelDetailModel detail;
  final List<TravelVisitModel> _selectedVisits;
  @override
  @JsonKey()
  List<TravelVisitModel> get selectedVisits {
    if (_selectedVisits is EqualUnmodifiableListView) return _selectedVisits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedVisits);
  }

  @override
  String toString() {
    return 'TravelDetailState(selectedDate: $selectedDate, selectedPlaceId: $selectedPlaceId, isMapMoved: $isMapMoved, detail: $detail, selectedVisits: $selectedVisits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelDetailStateImpl &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.selectedPlaceId, selectedPlaceId) ||
                other.selectedPlaceId == selectedPlaceId) &&
            (identical(other.isMapMoved, isMapMoved) ||
                other.isMapMoved == isMapMoved) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            const DeepCollectionEquality()
                .equals(other._selectedVisits, _selectedVisits));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedDate, selectedPlaceId,
      isMapMoved, detail, const DeepCollectionEquality().hash(_selectedVisits));

  /// Create a copy of TravelDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelDetailStateImplCopyWith<_$TravelDetailStateImpl> get copyWith =>
      __$$TravelDetailStateImplCopyWithImpl<_$TravelDetailStateImpl>(
          this, _$identity);
}

abstract class _TravelDetailState extends TravelDetailState {
  const factory _TravelDetailState(
      {required final DateTime selectedDate,
      final int selectedPlaceId,
      final bool isMapMoved,
      required final TravelDetailModel detail,
      final List<TravelVisitModel> selectedVisits}) = _$TravelDetailStateImpl;
  const _TravelDetailState._() : super._();

  @override
  DateTime get selectedDate;
  @override
  int get selectedPlaceId;
  @override
  bool get isMapMoved;
  @override
  TravelDetailModel get detail;
  @override
  List<TravelVisitModel> get selectedVisits;

  /// Create a copy of TravelDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelDetailStateImplCopyWith<_$TravelDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
