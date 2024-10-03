import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_address_model.freezed.dart';
part 'place_address_model.g.dart';

@freezed
class PlaceAddressModel with _$PlaceAddressModel {

  const factory PlaceAddressModel({
    required String lotNumber,
    required String road
  }) = _PlaceAddressModel;

  factory PlaceAddressModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceAddressModelFromJson(json);

}
