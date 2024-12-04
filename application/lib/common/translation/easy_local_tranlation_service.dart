
import 'package:application_new/common/translation/translation_service.dart';
import 'package:easy_localization/easy_localization.dart';

final class EasyLocalTranslationService implements TranslationService {

  @override
  String from(String key, {Arguments? args}) {
    return key.tr(args: args);
  }

  @override
  String fromEnum<T extends Enum>(T key) {
    // TODO: implement fromEnum
    throw UnimplementedError();
  }

}