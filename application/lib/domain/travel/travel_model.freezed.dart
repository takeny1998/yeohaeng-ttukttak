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
  String get name => throw _privateConstructorUsedError;
  DateTime get startedOn => throw _privateConstructorUsedError;
  DateTime get endedOn => throw _privateConstructorUsedError;
  String get memberId => throw _privateConstructorUsedError;
  List<TravelCompanionType> get companionTypes =>
      throw _privateConstructorUsedError;
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
      String name,
      DateTime startedOn,
      DateTime endedOn,
      String memberId,
      List<TravelCompanionType> companionTypes,
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
    Object? name = null,
    Object? startedOn = null,
    Object? endedOn = null,
    Object? memberId = null,
    Object? companionTypes = null,
    Object? motivationTypes = null,
    Object? cities = null,
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
      startedOn: null == startedOn
          ? _value.startedOn
          : startedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endedOn: null == endedOn
          ? _value.endedOn
          : endedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String,
      companionTypes: null == companionTypes
          ? _value.companionTypes
          : companionTypes // ignore: cast_nullable_to_non_nullable
              as List<TravelCompanionType>,
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
      String name,
      DateTime startedOn,
      DateTime endedOn,
      String memberId,
      List<TravelCompanionType> companionTypes,
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
    Object? name = null,
    Object? startedOn = null,
    Object? endedOn = null,
    Object? memberId = null,
    Object? companionTypes = null,
    Object? motivationTypes = null,
    Object? cities = null,
  }) {
    return _then(_$TravelModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startedOn: null == startedOn
          ? _value.startedOn
          : startedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endedOn: null == endedOn
          ? _value.endedOn
          : endedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String,
      companionTypes: null == companionTypes
          ? _value._companionTypes
          : companionTypes // ignore: cast_nullable_to_non_nullable
              as List<TravelCompanionType>,
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
      required this.name,
      required this.startedOn,
      required this.endedOn,
      required this.memberId,
      required final List<TravelCompanionType> companionTypes,
      required final List<TravelMotivationType> motivationTypes,
      required final List<CityModel> cities})
      : _companionTypes = companionTypes,
        _motivationTypes = motivationTypes,
        _cities = cities,
        super._();

  factory _$TravelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final DateTime startedOn;
  @override
  final DateTime endedOn;
  @override
  final String memberId;
  final List<TravelCompanionType> _companionTypes;
  @override
  List<TravelCompanionType> get companionTypes {
    if (_companionTypes is EqualUnmodifiableListView) return _companionTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_companionTypes);
  }

  final List<TravelMotivationType> _motivationTypes;
  @override
  List<TravelMotivationType> get motivationTypes {
    if (_motivationTypes is EqualUnmodifiableListView) return _motivationTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_motivationTypes);
  }

  final List<CityModel> _cities;
  @override
  List<CityModel> get cities {
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cities);
  }

  @override
  String toString() {
    return 'TravelModel(id: $id, name: $name, startedOn: $startedOn, endedOn: $endedOn, memberId: $memberId, companionTypes: $companionTypes, motivationTypes: $motivationTypes, cities: $cities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startedOn, startedOn) ||
                other.startedOn == startedOn) &&
            (identical(other.endedOn, endedOn) || other.endedOn == endedOn) &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId) &&
            const DeepCollectionEquality()
                .equals(other._companionTypes, _companionTypes) &&
            const DeepCollectionEquality()
                .equals(other._motivationTypes, _motivationTypes) &&
            const DeepCollectionEquality().equals(other._cities, _cities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      startedOn,
      endedOn,
      memberId,
      const DeepCollectionEquality().hash(_companionTypes),
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
      required final String name,
      required final DateTime startedOn,
      required final DateTime endedOn,
      required final String memberId,
      required final List<TravelCompanionType> companionTypes,
      required final List<TravelMotivationType> motivationTypes,
      required final List<CityModel> cities}) = _$TravelModelImpl;
  const _TravelModel._() : super._();

  factory _TravelModel.fromJson(Map<String, dynamic> json) =
      _$TravelModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  DateTime get startedOn;
  @override
  DateTime get endedOn;
  @override
  String get memberId;
  @override
  List<TravelCompanionType> get companionTypes;
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

TravelParticipantModel _$TravelParticipantModelFromJson(
    Map<String, dynamic> json) {
  return _TravelParticipantModel.fromJson(json);
}

/// @nodoc
mixin _$TravelParticipantModel {
  int get id => throw _privateConstructorUsedError;
  int get travelId => throw _privateConstructorUsedError;
  String get inviteeId => throw _privateConstructorUsedError;
  String get inviterId => throw _privateConstructorUsedError;

  /// Serializes this TravelParticipantModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelParticipantModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelParticipantModelCopyWith<TravelParticipantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelParticipantModelCopyWith<$Res> {
  factory $TravelParticipantModelCopyWith(TravelParticipantModel value,
          $Res Function(TravelParticipantModel) then) =
      _$TravelParticipantModelCopyWithImpl<$Res, TravelParticipantModel>;
  @useResult
  $Res call({int id, int travelId, String inviteeId, String inviterId});
}

/// @nodoc
class _$TravelParticipantModelCopyWithImpl<$Res,
        $Val extends TravelParticipantModel>
    implements $TravelParticipantModelCopyWith<$Res> {
  _$TravelParticipantModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelParticipantModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? travelId = null,
    Object? inviteeId = null,
    Object? inviterId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      travelId: null == travelId
          ? _value.travelId
          : travelId // ignore: cast_nullable_to_non_nullable
              as int,
      inviteeId: null == inviteeId
          ? _value.inviteeId
          : inviteeId // ignore: cast_nullable_to_non_nullable
              as String,
      inviterId: null == inviterId
          ? _value.inviterId
          : inviterId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TravelParticipantModelImplCopyWith<$Res>
    implements $TravelParticipantModelCopyWith<$Res> {
  factory _$$TravelParticipantModelImplCopyWith(
          _$TravelParticipantModelImpl value,
          $Res Function(_$TravelParticipantModelImpl) then) =
      __$$TravelParticipantModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int travelId, String inviteeId, String inviterId});
}

/// @nodoc
class __$$TravelParticipantModelImplCopyWithImpl<$Res>
    extends _$TravelParticipantModelCopyWithImpl<$Res,
        _$TravelParticipantModelImpl>
    implements _$$TravelParticipantModelImplCopyWith<$Res> {
  __$$TravelParticipantModelImplCopyWithImpl(
      _$TravelParticipantModelImpl _value,
      $Res Function(_$TravelParticipantModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelParticipantModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? travelId = null,
    Object? inviteeId = null,
    Object? inviterId = null,
  }) {
    return _then(_$TravelParticipantModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      travelId: null == travelId
          ? _value.travelId
          : travelId // ignore: cast_nullable_to_non_nullable
              as int,
      inviteeId: null == inviteeId
          ? _value.inviteeId
          : inviteeId // ignore: cast_nullable_to_non_nullable
              as String,
      inviterId: null == inviterId
          ? _value.inviterId
          : inviterId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelParticipantModelImpl implements _TravelParticipantModel {
  const _$TravelParticipantModelImpl(
      {required this.id,
      required this.travelId,
      required this.inviteeId,
      required this.inviterId});

  factory _$TravelParticipantModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelParticipantModelImplFromJson(json);

  @override
  final int id;
  @override
  final int travelId;
  @override
  final String inviteeId;
  @override
  final String inviterId;

  @override
  String toString() {
    return 'TravelParticipantModel(id: $id, travelId: $travelId, inviteeId: $inviteeId, inviterId: $inviterId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelParticipantModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.travelId, travelId) ||
                other.travelId == travelId) &&
            (identical(other.inviteeId, inviteeId) ||
                other.inviteeId == inviteeId) &&
            (identical(other.inviterId, inviterId) ||
                other.inviterId == inviterId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, travelId, inviteeId, inviterId);

  /// Create a copy of TravelParticipantModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelParticipantModelImplCopyWith<_$TravelParticipantModelImpl>
      get copyWith => __$$TravelParticipantModelImplCopyWithImpl<
          _$TravelParticipantModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelParticipantModelImplToJson(
      this,
    );
  }
}

abstract class _TravelParticipantModel implements TravelParticipantModel {
  const factory _TravelParticipantModel(
      {required final int id,
      required final int travelId,
      required final String inviteeId,
      required final String inviterId}) = _$TravelParticipantModelImpl;

  factory _TravelParticipantModel.fromJson(Map<String, dynamic> json) =
      _$TravelParticipantModelImpl.fromJson;

  @override
  int get id;
  @override
  int get travelId;
  @override
  String get inviteeId;
  @override
  String get inviterId;

  /// Create a copy of TravelParticipantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelParticipantModelImplCopyWith<_$TravelParticipantModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
