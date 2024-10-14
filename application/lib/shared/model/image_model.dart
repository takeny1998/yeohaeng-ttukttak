import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_model.freezed.dart';
part 'image_model.g.dart';

@freezed
class ImageModel with _$ImageModel {
  const factory ImageModel({
    required int id,
    required String path,
    required String name,
    required String ext,
    required int targetId,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}

enum ImageSize {
  small(resolution: 144),
  medium(resolution: 360),
  large(resolution: 720);

  final int resolution;

  const ImageSize({required this.resolution});
}
