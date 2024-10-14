import 'package:application_new/shared/model/image_model.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_service.g.dart';

class ImageService {
  final String _host;

  ImageService({required String host}) : _host = host;

  String fetchUrl(ImageModel image, {required ImageSize size}) {
    final ImageModel(:path, :name, :ext) = image;
    final basePath = '_${size.resolution}';

    return Uri.https(_host, p.normalize('$basePath/$path/$name.$ext'))
        .toString();
  }
}

@riverpod
ImageService imageService(ImageServiceRef ref) {
  return ImageService(host: 'image.tatine.kr');
}

