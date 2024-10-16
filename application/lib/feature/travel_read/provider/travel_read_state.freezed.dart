// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_read_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TravelReadState {
  DateTime get selectedDate => throw _privateConstructorUsedError;
  int get selectedPlaceId => throw _privateConstructorUsedError;
  bool get isMapMoved => throw _privateConstructorUsedError;
  TravelDetailModel get detail => throw _privateConstructorUsedError;
  List<TravelVisitModel> get selectedVisits =>
      throw _privateConstructorUsedError;

  /// Create a copy of TravelReadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelReadStateCopyWith<TravelReadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelReadStateCopyWith<$Res> {
  factory $TravelReadStateCopyWith(
          TravelReadState value, $Res Function(TravelReadState) then) =
      _$TravelReadStateCopyWithImpl<$Res, TravelReadState>;
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
class _$TravelReadStateCopyWithImpl<$Res, $Val extends TravelReadState>
    implements $TravelReadStateCopyWith<$Res> {
  _$TravelReadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelReadState
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

  /// Create a copy of TravelReadState
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
abstract class _$$TravelReadStateImplCopyWith<$Res>
    implements $TravelReadStateCopyWith<$Res> {
  factory _$$TravelReadStateImplCopyWith(_$TravelReadStateImpl value,
          $Res Function(_$TravelReadStateImpl) then) =
      __$$TravelReadStateImplCopyWithImpl<$Res>;
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
class __$$TravelReadStateImplCopyWithImpl<$Res>
    extends _$TravelReadStateCopyWithImpl<$Res, _$TravelReadStateImpl>
    implements _$$TravelReadStateImplCopyWith<$Res> {
  __$$TravelReadStateImplCopyWithImpl(
      _$TravelReadStateImpl _value, $Res Function(_$TravelReadStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelReadState
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
    return _then(_$TravelReadStateImpl(
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

class _$TravelReadStateImpl implements _TravelReadState {
  const _$TravelReadStateImpl(
      {required this.selectedDate,
      this.selectedPlaceId = 0,
      this.isMapMoved = false,
      required this.detail,
      final List<TravelVisitModel> selectedVisits = const []})
      : _selectedVisits = selectedVisits;

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
    return 'TravelReadState(selectedDate: $selectedDate, selectedPlaceId: $selectedPlaceId, isMapMoved: $isMapMoved, detail: $detail, selectedVisits: $selectedVisits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelReadStateImpl &&
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

  /// Create a copy of TravelReadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelReadStateImplCopyWith<_$TravelReadStateImpl> get copyWith =>
      __$$TravelReadStateImplCopyWithImpl<_$TravelReadStateImpl>(
          this, _$identity);
}

abstract class _TravelReadState implements TravelReadState {
  const factory _TravelReadState(
      {required final DateTime selectedDate,
      final int selectedPlaceId,
      final bool isMapMoved,
      required final TravelDetailModel detail,
      final List<TravelVisitModel> selectedVisits}) = _$TravelReadStateImpl;

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

  /// Create a copy of TravelReadState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelReadStateImplCopyWith<_$TravelReadStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
