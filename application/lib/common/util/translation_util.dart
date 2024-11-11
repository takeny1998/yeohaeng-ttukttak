import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TranslationUtil {
  TranslationUtil._();

  static String enumValue(Enum? enumKey) {
    if (enumKey == null) return 'null'.tr();

    return 'enum.${enumKey.runtimeType}.values.${enumKey.name}'.tr();
  }

  static String enumName<T extends Enum>() {
    final String enumName = T.toString();
    return 'enum.$enumName.name'.tr();
  }

  static WidgetTranslator widget(BuildContext context) {
    return WidgetTranslator(context);
  }

  static String word(String key) {
    return 'word.$key'.tr();
  }

  static String message(String key) {
    return 'message.$key'.tr();
  }
}

final class WidgetTranslator {

  final BuildContext context;

  WidgetTranslator(this.context);

  String key(String key, {Map<String, String>? args}) {
    return 'widget.${context.widget.runtimeType}.$key'.tr(namedArgs: args);
  }

  String plural(String key, int value, {Map<String, String>? args}) {
    return 'widget.${context.widget.runtimeType}.$key'.plural(value, namedArgs: args);
  }

}