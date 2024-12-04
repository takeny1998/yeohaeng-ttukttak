
import 'package:application_new/common/translation/easy_local_tranlation_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'translation_service.g.dart';

typedef Arguments = List<String>;

abstract interface class TranslationService {

  String from(String key, { Arguments? args });

  String fromEnum<T extends Enum>(T key);

}

@riverpod
TranslationService translationService(TranslationServiceRef ref) {
  return EasyLocalTranslationService();
}