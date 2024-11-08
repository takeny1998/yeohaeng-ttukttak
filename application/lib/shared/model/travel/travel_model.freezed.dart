// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TravelModel _$TravelModelFromJson(Map<String, dynamic> json) {
  return _TravelModel.fromJson(json);
}

/// @nodoc
mixin _$TravelModel {
  int get id => throw _privateConstructorUsedError;
  DateTime get startedOn => throw _privateConstructorUsedError;
  DateTime get endedOn => throw _privateConstructorUsedError;
  AgeGroup get ageGroup => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  List<TravelCompanionModel> get companions => throw _privateConstructorUsedError;
  List<TravelMotivationType> get motivationTypes =>
      throw _privateConstructorUsedError;
  List<CityModel> get cities => throw _privateConstructorUsedError;

  /// Serializes this TravelModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelModelCopyWith<TravelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelModelCopyWith<$Res> {
  factory $TravelModelCopyWith(
          TravelModel value, $Res Function(TravelModel) then) =
      _$TravelModelCopyWithImpl<$Res, TravelModel>;
  @useResult
  $Res call(
      {int id,
      DateTime startedOn,
      DateTime endedOn,
      AgeGroup ageGroup,
      Gender gender,
      List<TravelCompanionModel> companions,
      List<TravelMotivationType> motivationTypes,
      List<CityModel> cities});
}

/// @nodoc
class _$TravelModelCopyWithImpl<$Res, $Val extends TravelModel>
    implements $TravelModelCopyWith<$Res> {
  _$TravelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startedOn = null,
    Object? endedOn = null,
    Object? ageGroup = null,
    Object? gender = null,
    Object? companions = null,
    Object? motivationTypes = null,
    Object? cities = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startedOn: null == startedOn
          ? _value.startedOn
          : startedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endedOn: null == endedOn
          ? _value.endedOn
          : endedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ageGroup: null == ageGroup
          ? _value.ageGroup
          : ageGroup // ignore: cast_nullable_to_non_nullable
              as AgeGroup,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      companions: null == companions
          ? _value.companions
          : companions // ignore: cast_nullable_to_non_nullable
              as List<TravelCompanionModel>,
      motivationTypes: null == motivationTypes
          ? _value.motivationTypes
          : motivationTypes // ignore: cast_nullable_to_non_nullable
              as List<TravelMotivationType>,
      cities: null == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TravelModelImplCopyWith<$Res>
    implements $TravelModelCopyWith<$Res> {
  factory _$$TravelModelImplCopyWith(
          _$TravelModelImpl value, $Res Function(_$TravelModelImpl) then) =
      __$$TravelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      DateTime startedOn,
      DateTime endedOn,
      AgeGroup ageGroup,
      Gender gender,
      List<TravelCompanionModel> companions,
      List<TravelMotivationType> motivationTypes,
      List<CityModel> cities});
}

/// @nodoc
class __$$TravelModelImplCopyWithImpl<$Res>
    extends _$TravelModelCopyWithImpl<$Res, _$TravelModelImpl>
    implements _$$TravelModelImplCopyWith<$Res> {
  __$$TravelModelImplCopyWithImpl(
      _$TravelModelImpl _value, $Res Function(_$TravelModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startedOn = null,
    Object? endedOn = null,
    Object? ageGroup = null,
    Object? gender = null,
    Object? companions = null,
    Object? motivationTypes = null,
    Object? cities = null,
  }) {
    return _then(_$TravelModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startedOn: null == startedOn
          ? _value.startedOn
          : startedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endedOn: null == endedOn
          ? _value.endedOn
          : endedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ageGroup: null == ageGroup
          ? _value.ageGroup
          : ageGroup // ignore: cast_nullable_to_non_nullable
              as AgeGroup,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      companions: null == companions
          ? _value._companions
          : companions // ignore: cast_nullable_to_non_nullable
              as List<TravelCompanionModel>,
      motivationTypes: null == motivationTypes
          ? _value._motivationTypes
          : motivationTypes // ignore: cast_nullable_to_non_nullable
              as List<TravelMotivationType>,
      cities: null == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelModelImpl extends _TravelModel {
  const _$TravelModelImpl(
      {required this.id,
      required this.startedOn,
      required this.endedOn,
      this.ageGroup = AgeGroup.none,
      this.gender = Gender.none,
      final List<TravelCompanionModel> companions = const [],
      final List<TravelMotivationType> motivationTypes = const [],
      final List<CityModel> cities = const []})
      : _companions = companions,
        _motivationTypes = motivationTypes,
        _cities = cities,
        super._();

  factory _$TravelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelModelImplFromJson(json);

  @override
  final int id;
  @override
  final DateTime startedOn;
  @override
  final DateTime endedOn;
  @override
  @JsonKey()
  final AgeGroup ageGroup;
  @override
  @JsonKey()
  final Gender gender;
  final List<TravelCompanionModel> _companions;
  @override
  @JsonKey()
  List<TravelCompanionModel> get companions {
    if (_companions is EqualUnmodifiableListView) return _companions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_companions);
  }

  final List<TravelMotivationType> _motivationTypes;
  @override
  @JsonKey()
  List<TravelMotivationType> get motivationTypes {
    if (_motivationTypes is EqualUnmodifiableListView) return _motivationTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_motivationTypes);
  }

  final List<CityModel> _cities;
  @override
  @JsonKey()
  List<CityModel> get cities {
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cities);
  }

  @override
  String toString() {
    return 'TravelModel(id: $id, startedOn: $startedOn, endedOn: $endedOn, ageGroup: $ageGroup, gender: $gender, companions: $companions, motivationTypes: $motivationTypes, cities: $cities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startedOn, startedOn) ||
                other.startedOn == startedOn) &&
            (identical(other.endedOn, endedOn) || other.endedOn == endedOn) &&
            (identical(other.ageGroup, ageGroup) ||
                other.ageGroup == ageGroup) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            const DeepCollectionEquality()
                .equals(other._companions, _companions) &&
            const DeepCollectionEquality()
                .equals(other._motivationTypes, _motivationTypes) &&
            const DeepCollectionEquality().equals(other._cities, _cities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      startedOn,
      endedOn,
      ageGroup,
      gender,
      const DeepCollectionEquality().hash(_companions),
      const DeepCollectionEquality().hash(_motivationTypes),
      const DeepCollectionEquality().hash(_cities));

  /// Create a copy of TravelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelModelImplCopyWith<_$TravelModelImpl> get copyWith =>
      __$$TravelModelImplCopyWithImpl<_$TravelModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelModelImplToJson(
      this,
    );
  }
}

abstract class _TravelModel extends TravelModel {
  const factory _TravelModel(
      {required final int id,
      required final DateTime startedOn,
      required final DateTime endedOn,
      final AgeGroup ageGroup,
      final Gender gender,
      final List<TravelCompanionModel> companions,
      final List<TravelMotivationType> motivationTypes,
      final List<CityModel> cities}) = _$TravelModelImpl;
  const _TravelModel._() : super._();

  factory _TravelModel.fromJson(Map<String, dynamic> json) =
      _$TravelModelImpl.fromJson;

  @override
  int get id;
  @override
  DateTime get startedOn;
  @override
  DateTime get endedOn;
  @override
  AgeGroup get ageGroup;
  @override
  Gender get gender;
  @override
  List<TravelCompanionModel> get companions;
  @override
  List<TravelMotivationType> get motivationTypes;
  @override
  List<CityModel> get cities;

  /// Create a copy of TravelModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelModelImplCopyWith<_$TravelModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TravelCompanionModel _$TravelCompanionFromJson(Map<String, dynamic> json) {
  return _TravelCompanion.fromJson(json);
}

/// @nodoc
mixin _$TravelCompanion {
  int get id => throw _privateConstructorUsedError;
  TravelCompanionType get type => throw _privateConstructorUsedError;
  AgeGroup? get ageGroup => throw _privateConstructorUsedError;
  Gender? get gender => throw _privateConstructorUsedError;

  /// Serializes this TravelCompanion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelCompanion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelCompanionCopyWith<TravelCompanionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelCompanionCopyWith<$Res> {
  factory $TravelCompanionCopyWith(
          TravelCompanionModel value, $Res Function(TravelCompanionModel) then) =
      _$TravelCompanionCopyWithImpl<$Res, TravelCompanionModel>;
  @useResult
  $Res call(
      {int id, TravelCompanionType type, AgeGroup? ageGroup, Gender? gender});
}

/// @nodoc
class _$TravelCompanionCopyWithImpl<$Res, $Val extends TravelCompanionModel>
    implements $TravelCompanionCopyWith<$Res> {
  _$TravelCompanionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelCompanion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? ageGroup = freezed,
    Object? gender = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TravelCompanionType,
      ageGroup: freezed == ageGroup
          ? _value.ageGroup
          : ageGroup // ignore: cast_nullable_to_non_nullable
              as AgeGroup?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TravelCompanionImplCopyWith<$Res>
    implements $TravelCompanionCopyWith<$Res> {
  factory _$$TravelCompanionImplCopyWith(_$TravelCompanionImpl value,
          $Res Function(_$TravelCompanionImpl) then) =
      __$$TravelCompanionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, TravelCompanionType type, AgeGroup? ageGroup, Gender? gender});
}

/// @nodoc
class __$$TravelCompanionImplCopyWithImpl<$Res>
    extends _$TravelCompanionCopyWithImpl<$Res, _$TravelCompanionImpl>
    implements _$$TravelCompanionImplCopyWith<$Res> {
  __$$TravelCompanionImplCopyWithImpl(
      _$TravelCompanionImpl _value, $Res Function(_$TravelCompanionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelCompanion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? ageGroup = freezed,
    Object? gender = freezed,
  }) {
    return _then(_$TravelCompanionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TravelCompanionType,
      ageGroup: freezed == ageGroup
          ? _value.ageGroup
          : ageGroup // ignore: cast_nullable_to_non_nullable
              as AgeGroup?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelCompanionImpl implements _TravelCompanion {
  const _$TravelCompanionImpl(
      {required this.id, required this.type, this.ageGroup, this.gender});

  factory _$TravelCompanionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelCompanionImplFromJson(json);

  @override
  final int id;
  @override
  final TravelCompanionType type;
  @override
  final AgeGroup? ageGroup;
  @override
  final Gender? gender;

  @override
  String toString() {
    return 'TravelCompanion(id: $id, type: $type, ageGroup: $ageGroup, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelCompanionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.ageGroup, ageGroup) ||
                other.ageGroup == ageGroup) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, ageGroup, gender);

  /// Create a copy of TravelCompanion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelCompanionImplCopyWith<_$TravelCompanionImpl> get copyWith =>
      __$$TravelCompanionImplCopyWithImpl<_$TravelCompanionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelCompanionImplToJson(
      this,
    );
  }
}

abstract class _TravelCompanion implements TravelCompanionModel {
  const factory _TravelCompanion(
      {required final int id,
      required final TravelCompanionType type,
      final AgeGroup? ageGroup,
      final Gender? gender}) = _$TravelCompanionImpl;

  factory _TravelCompanion.fromJson(Map<String, dynamic> json) =
      _$TravelCompanionImpl.fromJson;

  @override
  int get id;
  @override
  TravelCompanionType get type;
  @override
  AgeGroup? get ageGroup;
  @override
  Gender? get gender;

  /// Create a copy of TravelCompanion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelCompanionImplCopyWith<_$TravelCompanionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
