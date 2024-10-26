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
  TravelCompanionType get companionType => throw _privateConstructorUsedError;
  AgeGroup get ageGroup => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  List<TravelCompanion> get companions => throw _privateConstructorUsedError;
  List<TravelMotivation> get motivations => throw _privateConstructorUsedError;
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
      TravelCompanionType companionType,
      AgeGroup ageGroup,
      Gender gender,
      List<TravelCompanion> companions,
      List<TravelMotivation> motivations,
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
    Object? companionType = null,
    Object? ageGroup = null,
    Object? gender = null,
    Object? companions = null,
    Object? motivations = null,
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
      companionType: null == companionType
          ? _value.companionType
          : companionType // ignore: cast_nullable_to_non_nullable
              as TravelCompanionType,
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
              as List<TravelCompanion>,
      motivations: null == motivations
          ? _value.motivations
          : motivations // ignore: cast_nullable_to_non_nullable
              as List<TravelMotivation>,
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
      TravelCompanionType companionType,
      AgeGroup ageGroup,
      Gender gender,
      List<TravelCompanion> companions,
      List<TravelMotivation> motivations,
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
    Object? companionType = null,
    Object? ageGroup = null,
    Object? gender = null,
    Object? companions = null,
    Object? motivations = null,
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
      companionType: null == companionType
          ? _value.companionType
          : companionType // ignore: cast_nullable_to_non_nullable
              as TravelCompanionType,
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
              as List<TravelCompanion>,
      motivations: null == motivations
          ? _value._motivations
          : motivations // ignore: cast_nullable_to_non_nullable
              as List<TravelMotivation>,
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
      this.companionType = TravelCompanionType.none,
      this.ageGroup = AgeGroup.none,
      this.gender = Gender.none,
      final List<TravelCompanion> companions = const [],
      final List<TravelMotivation> motivations = const [],
      final List<CityModel> cities = const []})
      : _companions = companions,
        _motivations = motivations,
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
  final TravelCompanionType companionType;
  @override
  @JsonKey()
  final AgeGroup ageGroup;
  @override
  @JsonKey()
  final Gender gender;
  final List<TravelCompanion> _companions;
  @override
  @JsonKey()
  List<TravelCompanion> get companions {
    if (_companions is EqualUnmodifiableListView) return _companions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_companions);
  }

  final List<TravelMotivation> _motivations;
  @override
  @JsonKey()
  List<TravelMotivation> get motivations {
    if (_motivations is EqualUnmodifiableListView) return _motivations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_motivations);
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
    return 'TravelModel(id: $id, startedOn: $startedOn, endedOn: $endedOn, companionType: $companionType, ageGroup: $ageGroup, gender: $gender, companions: $companions, motivations: $motivations, cities: $cities)';
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
            (identical(other.companionType, companionType) ||
                other.companionType == companionType) &&
            (identical(other.ageGroup, ageGroup) ||
                other.ageGroup == ageGroup) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            const DeepCollectionEquality()
                .equals(other._companions, _companions) &&
            const DeepCollectionEquality()
                .equals(other._motivations, _motivations) &&
            const DeepCollectionEquality().equals(other._cities, _cities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      startedOn,
      endedOn,
      companionType,
      ageGroup,
      gender,
      const DeepCollectionEquality().hash(_companions),
      const DeepCollectionEquality().hash(_motivations),
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
      final TravelCompanionType companionType,
      final AgeGroup ageGroup,
      final Gender gender,
      final List<TravelCompanion> companions,
      final List<TravelMotivation> motivations,
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
  TravelCompanionType get companionType;
  @override
  AgeGroup get ageGroup;
  @override
  Gender get gender;
  @override
  List<TravelCompanion> get companions;
  @override
  List<TravelMotivation> get motivations;
  @override
  List<CityModel> get cities;

  /// Create a copy of TravelModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelModelImplCopyWith<_$TravelModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TravelCompanion _$TravelCompanionFromJson(Map<String, dynamic> json) {
  return _TravelCompanion.fromJson(json);
}

/// @nodoc
mixin _$TravelCompanion {
  int get id => throw _privateConstructorUsedError;
  TravelCompanionType get type => throw _privateConstructorUsedError;
  AgeGroup get ageGroup => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;

  /// Serializes this TravelCompanion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelCompanion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelCompanionCopyWith<TravelCompanion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelCompanionCopyWith<$Res> {
  factory $TravelCompanionCopyWith(
          TravelCompanion value, $Res Function(TravelCompanion) then) =
      _$TravelCompanionCopyWithImpl<$Res, TravelCompanion>;
  @useResult
  $Res call(
      {int id, TravelCompanionType type, AgeGroup ageGroup, Gender gender});
}

/// @nodoc
class _$TravelCompanionCopyWithImpl<$Res, $Val extends TravelCompanion>
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
    Object? ageGroup = null,
    Object? gender = null,
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
      ageGroup: null == ageGroup
          ? _value.ageGroup
          : ageGroup // ignore: cast_nullable_to_non_nullable
              as AgeGroup,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
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
      {int id, TravelCompanionType type, AgeGroup ageGroup, Gender gender});
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
    Object? ageGroup = null,
    Object? gender = null,
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
      ageGroup: null == ageGroup
          ? _value.ageGroup
          : ageGroup // ignore: cast_nullable_to_non_nullable
              as AgeGroup,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelCompanionImpl implements _TravelCompanion {
  const _$TravelCompanionImpl(
      {required this.id,
      required this.type,
      required this.ageGroup,
      required this.gender});

  factory _$TravelCompanionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelCompanionImplFromJson(json);

  @override
  final int id;
  @override
  final TravelCompanionType type;
  @override
  final AgeGroup ageGroup;
  @override
  final Gender gender;

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

abstract class _TravelCompanion implements TravelCompanion {
  const factory _TravelCompanion(
      {required final int id,
      required final TravelCompanionType type,
      required final AgeGroup ageGroup,
      required final Gender gender}) = _$TravelCompanionImpl;

  factory _TravelCompanion.fromJson(Map<String, dynamic> json) =
      _$TravelCompanionImpl.fromJson;

  @override
  int get id;
  @override
  TravelCompanionType get type;
  @override
  AgeGroup get ageGroup;
  @override
  Gender get gender;

  /// Create a copy of TravelCompanion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelCompanionImplCopyWith<_$TravelCompanionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
