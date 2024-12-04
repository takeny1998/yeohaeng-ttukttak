
import 'package:application_new/common/translation/translation_service.dart';
import 'package:easy_localization/easy_localization.dart';

final class EasyLocalTranslationService implements TranslationService {

  @override
  String from(String key, {Arguments? args}) {
    return key.tr(args: args);
  }

  @override
  String fromEnum<T extends Enum>(T? key) {
    if (key == null) return 'null'.tr();

    return 'enum.${key.runtimeType}.values.${key.name}'.tr();
  }

}