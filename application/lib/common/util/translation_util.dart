import 'package:easy_localization/easy_localization.dart';

class TranslationUtil {

  TranslationUtil._();

  static String enumValue(Enum? enumKey)  {

  if (enumKey == null) return 'null'.tr();

  return 'enum.${enumKey.runtimeType}.values.${enumKey.name}'.tr();
  }

  static String enumName<T extends Enum>() {

    final String enumName = T.toString();

    return 'enum.$enumName.name'.tr();
  }


}